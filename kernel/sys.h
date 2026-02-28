#include <stdint.h>

typedef int64_t foffset;
typedef uintptr_t memsz;

struct FINA_State;
int FINA_InternalTick(struct FINA_State *, int);

void Sys_Init(int argc, char **argv);
void Sys_End(void);
int Sys_Tick(struct FINA_State *state);
unsigned Sys_Argc(void);
char **Sys_Argv(void);

int Sys_Throw(void);

// File support
void *Sys_FileOpen(const char *name, unsigned mode);
void Sys_FileClose(void *handle);
memsz Sys_FileRead(void *handle, char *buf, memsz len);
void Sys_FileWrite(void *handle, char *buf, memsz len);
void *Sys_FileMMap(void *handle);
foffset Sys_FileSize(void *handle);
foffset Sys_FileTell(void *handle);
void Sys_FileSeek(void *handle, foffset pos);
unsigned Sys_FileLine(void *handle, char *buf, unsigned len);
void Sys_FileDelete(const char *name);
unsigned Sys_FileStat(const char *name);
void Sys_FileRen(const char *, const char *);
void Sys_FileTrunc(void *handle, foffset size);
void Sys_FileFlush(void *handle);
void *Sys_Popen(const char *, const char *);
int Sys_Pclose(void *);
const char* Sys_GetProgramExecutableName(void);

// Memory
void Sys_MemMove(char *to, const char *from, memsz bytes);
void Sys_MemSet(char *dst, unsigned c, memsz bytes);

// Memory Allocation
void *Sys_MemAllocate(memsz bytes);
void Sys_MemFree(void *addr);
void *Sys_MemResize(void *addr, memsz newsize);

// Console
unsigned Sys_HasChar(void);
unsigned Sys_GetChar(void);
void Sys_PutChar(unsigned c);

// Time
void *Sys_Time(void);
unsigned Sys_Second(void *tm);
unsigned Sys_Minute(void *tm);
unsigned Sys_Hour(void *tm);
unsigned Sys_Day(void *tm);
unsigned Sys_Month(void *tm);
unsigned Sys_Year(void *tm);
void Sys_Sleep(unsigned ms);
uint64_t Sys_Nanoseconds(void);

intptr_t Sys_GetPid(void);


// Shell
int Sys_System(const char *);

// Socket

int Sys_Socket(int, int, int);
int Sys_TCPSocket(void);
int Sys_UDPSocket(void);
void *Sys_GetHostByName(const char *);
void *Sys_FDOpen(int, const char *);
int Sys_Connect(int, void *, int);
