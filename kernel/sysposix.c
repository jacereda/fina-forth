#define _LARGEFILE_SOURCE
#define _FILE_OFFSET_BITS 64

#include <sys/types.h>
#include <sys/mman.h>
#include <sys/stat.h>

#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <setjmp.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <termios.h>
#include <unistd.h>


#include "fina.h"
#include "arch.h"
#include "sys.h"

static struct termios otio;
static unsigned argc;
static char ** argv;
static int throwval;
static jmp_buf jmpbuf;


void mysignal(int signo, void (*handler)(int))
{
        struct sigaction action;
        action.sa_handler = handler;
        sigemptyset(&action.sa_mask);
        action.sa_flags=SA_NODEFER;
        sigaction(signo, &action, 0);
}

static void errnoThrow(int error)
{
        if (error) switch (errno)
        {
        case ENOENT:
                throwval = -38;
                break;
        case ENOMEM:
                throwval = -21;
                break;
        default:
                throwval = -37;
        }
        if (!error)
                throwval = 0;
        errno = 0;
}

static void memThrow(int error)
{
// malloc() doesn't seem to set errno on Darwin. The man page says it should.
#if defined(__MACH__)  
        if (error) errno = ENOMEM;
#endif
        errnoThrow(error);
}

static void ferrorThrow(int error, FILE * handle)
{
        if (error && feof(handle))
                throwval = -39;
        if (error && ferror(handle))
                throwval = -37;
        if (!error)
                throwval = 0;
        clearerr(handle);
}

static void sighandler(int sig)
{
        switch (sig)
        {
        case SIGBUS:
        case SIGSEGV:
        case SIGILL:
                throwval = -9;
                break;
        default:
                throwval = -59;
        }
        mysignal(sig, sighandler);
        longjmp(jmpbuf, throwval);
}

int Sys_Tick(struct FINA_State * state)
{
        static int set = 0;
        int throwval = 0;
        if (!set)
                throwval = setjmp(jmpbuf);
        set = !throwval;
        return FINA_InternalTick(state, throwval);
}

static void initSignals()
{
        mysignal(SIGBUS, sighandler);
        mysignal(SIGSEGV, sighandler);
        mysignal(SIGILL, sighandler);
}

static void initTerm()
{
        struct termios tio;
        unsigned ret;
        if (isatty(fileno(stdin)))
        {
                ret = tcgetattr(fileno(stdin), &otio);
                assert(ret == 0);
                tio = otio;
                tio.c_lflag &= ~(ECHO | ICANON);
                ret = tcsetattr(fileno(stdin), TCSANOW, &tio);
                assert(ret == 0);
        }
}

static void endTerm()
{
        unsigned ret;
        if (isatty(fileno(stdin)))
        {
                ret = tcsetattr(fileno(stdin), TCSANOW, &otio);
                assert(ret == 0);
        }
}

static uintptr_t end() {
        extern CELL Forth_End;
        return (uintptr_t) &Forth_End;
}

static uintptr_t start() {
        extern CELL Forth_Entry;
        return (uintptr_t) &Forth_Entry;
}

static unsigned pageshift() {
        return 12;
}

static unsigned pagesize() {
        return 1 << pageshift();
}

static uintptr_t page(uintptr_t addr) {
        return addr >> pageshift();
}

static uintptr_t tosize(uintptr_t npages) {
        return npages * pagesize();
}

static void * toaddr(uintptr_t page) {
        return (void*)(page * pagesize());
}

void Sys_Init(int argcc, char ** argvv)
{
        argc = argcc;
        argv = argvv;
        initTerm();
        initSignals();
        if (mprotect(toaddr(page(start())),
                     tosize(page(end()) - page(start()) + 1),
                     PROT_READ+PROT_WRITE+PROT_EXEC))
                perror("mprotect");
}

void Sys_End()
{
        endTerm();
}

unsigned Sys_HasChar()
{
        int ret, flags, rflags;
        flags = fcntl(fileno(stdin),F_GETFL,0);
        assert(flags != -1);
        rflags = fcntl(fileno(stdin),F_SETFL,flags|O_NDELAY);
        assert(rflags != -1);
        ret = getchar();
        ungetc(ret, stdin);
        rflags = fcntl(fileno(stdin),F_SETFL,flags);        
        assert(rflags != -1);
        return ret != EOF;
}

unsigned Sys_GetChar() 
{
        return getchar();
}

void Sys_PutChar(unsigned c)
{
        unsigned ret;
        ret = putchar(c);
        errnoThrow(ret != c);
        ret = fflush(stdout);
        errnoThrow(ret != 0);
}

void Sys_MemMove(char * to, const char * from, unsigned bytes)
{
        memmove(to, from, bytes);
}

void Sys_MemSet(char * dst, unsigned val, unsigned bytes)
{
        memset(dst, val, bytes);
}

void * Sys_FileOpen(const char * name, unsigned mode)
{
        const char *modestr[]={"r", "rb", "r+", "r+b", "w", "wb", "BAD"};
        void * handle;
        if (mode > 5)
                mode = 6;
        handle = fopen(name, modestr[mode]);
        errnoThrow(handle == 0);
        return handle;
}

int Sys_Throw()
{
        return throwval;
}

void Sys_FileClose(void * handle)
{
        FILE * fh = (FILE*)handle;
        errnoThrow(handle == 0);
        if (!throwval) errnoThrow(0 != fclose(fh));
}

unsigned Sys_FileRead(void * handle, char * buf, unsigned len)
{
        FILE * fh = (FILE*)handle;
        unsigned res = 0;
        errnoThrow(fh == 0);
        if (!throwval) res = fread(buf, 1, len, fh);
        if (!throwval) ferrorThrow(res != len, fh);
        return res;
}

void Sys_FileWrite(void * handle, char * buf, unsigned len)
{
        FILE * fh = (FILE*)handle;  
        unsigned res = 0;
        errnoThrow(fh == 0);
        if (!throwval) res = fwrite(buf, 1, len, fh);
        if (!throwval) ferrorThrow(res != len, fh);
}

void * Sys_FileMMap(void * handle)
{
        FILE * fh = (FILE*)handle; 
        void * res = 0;
        errnoThrow(fh == 0);
        if (!throwval) res = mmap(0, 0x40000000, PROT_READ, MAP_SHARED, 
                               fileno(fh), 0);
        if (!throwval) errnoThrow(res == (void*)-1);
        return res;
}

unsigned Sys_Argc()
{
        return argc;
}

char ** Sys_Argv()
{
        return argv;
}

DCELL Sys_FileSize(void * handle)
{
        FILE * fh = (FILE*)handle;   
        off_t prev = -1, res = -1;
        errnoThrow(fh == 0);
        if (!throwval) errnoThrow(-1 == (prev = ftello(fh)));
        if (!throwval) errnoThrow(-1 == fseeko(fh, 0, SEEK_END));
        if (!throwval) errnoThrow(-1 == (res = ftello(fh)));
        if (!throwval) errnoThrow(-1 == fseeko(fh, prev, SEEK_SET));
        return res;
}

void Sys_FileSeek(void * handle, DCELL pos)
{
        FILE * fh = (FILE*)handle;     
        errnoThrow(fh == 0);
        if (!throwval) errnoThrow(-1 == fseeko(fh, pos, SEEK_SET));
}

DCELL Sys_FileTell(void * handle)
{
        FILE * fh = (FILE*)handle;       
        off_t res = -1;
        errnoThrow(fh == 0);
        if (!throwval) res = ftello(fh);
        if (!throwval) errnoThrow(-1 == res);
        return res;
}

unsigned Sys_FileLine(void * handle, char * buf, unsigned size)
{
        FILE * fh = (FILE*)handle;  
        unsigned res = 0;
        errnoThrow(fh == 0);
        if (!throwval) ferrorThrow(0 == fgets(buf, size, fh), fh);
        if (!throwval) res = strlen(buf);
        if (!throwval) res -= buf[res-1] == '\n';
        return res;
}

void * Sys_Time()
{
        time_t t = time(0);
        return localtime(&t);
}

unsigned Sys_Second(void * t)
{
        return ((struct tm *)t)->tm_sec;
}

unsigned Sys_Minute(void * t)
{
        return ((struct tm *)t)->tm_min;
}

unsigned Sys_Hour(void * t)
{
        return ((struct tm *)t)->tm_hour;
}

unsigned Sys_Day(void * t)
{
        return ((struct tm *)t)->tm_mday;
}

unsigned Sys_Month(void * t)
{
        return ((struct tm *)t)->tm_mon + 1;
}

unsigned Sys_Year(void * t)
{
        return ((struct tm *)t)->tm_year + 1900;
}

void Sys_Sleep(unsigned ms)
{
        usleep(ms * 1000);
}

void Sys_FileDelete(const char * name)
{
        errnoThrow(-1 == unlink(name));
}

unsigned Sys_FileStat(const char * name)
{
        struct stat s;
        errnoThrow(stat(name, &s));
        return s.st_mode;
}

void Sys_FileRen(const char * oldname, const char * newname)
{
        errnoThrow(rename(oldname, newname));
}

void Sys_FileTrunc(void * handle, DCELL size)
{
        FILE * fh = (FILE*)handle;  
        errnoThrow(ftruncate(fileno((FILE*)fh), size));
}

void Sys_FileFlush(void * handle)
{
        FILE * fh = (FILE*)handle;  
        errnoThrow(fflush(fh));
}


void * Sys_MemAllocate(unsigned bytes)
{
        void * ret = malloc(bytes);
        memThrow(0 == ret);
        return ret;
}

unsigned Sys_MemFree(void * p)
{
        free(p);
        return 0;
}

void * Sys_MemResize(void * p, unsigned newsize)
{
        void * ret = realloc(p, newsize);
        memThrow(0 == ret);
        return ret;
}
