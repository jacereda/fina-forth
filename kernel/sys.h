#include <stdint.h>

typedef int64_t foffset;
typedef uintptr_t memsz;

struct FINA_State;
int FINA_InternalTick(struct FINA_State *, int);

void Sys_Init(int argc, char ** argv);
void Sys_End();
int Sys_Tick(struct FINA_State * state);
unsigned Sys_Argc();
char ** Sys_Argv();

int Sys_Throw();

// File support
void * Sys_FileOpen(const char * name, unsigned mode);
void Sys_FileClose(void * handle);
memsz Sys_FileRead(void * handle, char * buf, memsz len);
void Sys_FileWrite(void * handle, char * buf, memsz len);
void * Sys_FileMMap(void * handle);
foffset Sys_FileSize(void * handle);
foffset Sys_FileTell(void * handle);
void Sys_FileSeek(void * handle, foffset pos);
unsigned Sys_FileLine(void * handle, char * buf, unsigned len);
void Sys_FileDelete(const char * name);
unsigned Sys_FileStat(const char * name);
void Sys_FileRen(const char *, const char *);
void Sys_FileTrunc(void * handle, foffset size);
void Sys_FileFlush(void * handle);

// Memory
void Sys_MemMove(char * to, const char * from, memsz bytes);
void Sys_MemSet(char * dst, unsigned c, memsz bytes);

// Memory Allocation
void * Sys_MemAllocate(memsz bytes);
void Sys_MemFree(void * addr);
void * Sys_MemResize(void * addr, memsz newsize);

// Console
unsigned Sys_HasChar();
unsigned Sys_GetChar();
void Sys_PutChar(unsigned c);

// Time
void * Sys_Time();
unsigned Sys_Second(void * tm);
unsigned Sys_Minute(void * tm);
unsigned Sys_Hour(void * tm);
unsigned Sys_Day(void * tm);
unsigned Sys_Month(void * tm);
unsigned Sys_Year(void * tm);
void Sys_Sleep(unsigned ms);

