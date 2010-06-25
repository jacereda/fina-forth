#define _LARGEFILE_SOURCE
#define _FILE_OFFSET_BITS 64

#include <sys/types.h>
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
#include <unistd.h>


#include "fina.h"
#include "sys.h"

static unsigned argc;
static char ** argv;
static int throw;
static jmp_buf jmpbuf;


void mysignal(int signo, void * handler)
{
}

static void errnoThrow(int error)
{
        if (error) switch (errno)
        {
        case ENOENT:
                throw = -38;
                break;
        case ENOMEM:
                throw = -21;
                break;
        default:
                throw = -37;
        }
        if (!error)
                throw = 0;
        errno = 0;
}

static void memThrow(int error)
{
        errnoThrow(error);
}

static void ferrorThrow(int error, FILE * handle)
{
        if (error && feof(handle))
                throw = -39;
        if (error && ferror(handle))
                throw = -37;
        if (!error)
                throw = 0;
        clearerr(handle);
}

static void sighandler(int sig)
{
        switch (sig)
        {
#if defined SIGBUS
        case SIGBUS:
#endif
        case SIGSEGV:
        case SIGILL:
                throw = -9;
                break;
        default:
                throw = -59;
        }
	mysignal(sig, sighandler);
        longjmp(jmpbuf, throw);
}

int Sys_Tick(struct FINA_State * state)
{
        static int set = 0;
        int throw = 0;
        if (!set)
                throw = setjmp(jmpbuf);
        set = !throw;
		return FINA_InternalTick(state, throw);
}

static void initSignals()
{
}

static void initTerm()
{
}

static void endTerm()
{
}

void Sys_Init(int argcc, char ** argvv)
{
        extern CELL Forth_Entry;
        argc = argcc;
        argv = argvv;
        initTerm();
        initSignals();
}

void Sys_End()
{
        endTerm();
}

unsigned Sys_HasChar()
{
	return 1;
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
        char *modestr[]={"r", "rb", "r+", "r+b", "w", "wb", "BAD"};
        void * handle;
        if (mode > 5)
                mode = 6;
        handle = fopen(name, modestr[mode]);
        errnoThrow(handle == 0);
        return handle;
}

int Sys_Throw()
{
        return throw;
}

void Sys_FileClose(void * handle)
{
        errnoThrow(handle == 0);
        if (!throw) errnoThrow(0 != fclose(handle));
}

unsigned Sys_FileRead(void * handle, char * buf, unsigned len)
{
        unsigned res = 0;
        errnoThrow(handle == 0);
        if (!throw) res = fread(buf, 1, len, handle);
        if (!throw) ferrorThrow(1, handle);
        return res;
}

void Sys_FileWrite(void * handle, char * buf, unsigned len)
{
        unsigned res = 0;
        errnoThrow(handle == 0);
        if (!throw) res = fwrite(buf, 1, len, handle);
        if (!throw) ferrorThrow(res != len, handle);
}

void * Sys_FileMMap(void * handle)
{
	return 0;
}

unsigned Sys_Argc()
{
        return argc;
}

char ** Sys_Argv()
{
        return argv;
}

unsigned long long Sys_FileSize(void * handle)
{
        off_t prev = -1, res = -1;
        errnoThrow(handle == 0);
        if (!throw) errnoThrow(-1 == (prev = ftell(handle)));
        if (!throw) errnoThrow(-1 == fseek(handle, 0, SEEK_END));
        if (!throw) errnoThrow(-1 == (res = ftell(handle)));
        if (!throw) errnoThrow(-1 == fseek(handle, prev, SEEK_SET));
        return res;
}

void Sys_FileSeek(void * handle, unsigned long long pos)
{
        errnoThrow(handle == 0);
        if (!throw) errnoThrow(-1 == fseek(handle, pos, SEEK_SET));
}

unsigned long long Sys_FileTell(void * handle)
{
        unsigned long long res = -1;
        errnoThrow(handle == 0);
        if (!throw) res = ftell(handle);
        if (!throw) errnoThrow(-1 == res);
        return res;
}

unsigned Sys_FileLine(void * handle, char * buf, unsigned size)
{
        unsigned res = 0;
        errnoThrow(handle == 0);
        if (!throw) ferrorThrow(0 == fgets(buf, size, handle), handle);
        if (!throw) res = strlen(buf);
        if (!throw) res -= buf[res-1] == '\n';
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

void Sys_FileRen(const char * old, const char * new)
{
        errnoThrow(rename(old, new));
}

void Sys_FileTrunc(void * handle, unsigned long long size)
{
        errnoThrow(ftruncate(fileno((FILE*)handle), size));
}

void Sys_FileFlush(void * handle)
{
        errnoThrow(fflush(handle));
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
