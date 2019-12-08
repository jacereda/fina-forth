#include <stdio.h>
#include "fina.h"
#include "sys.h"
#include <windows.h>

static HANDLE g_in;
static HANDLE g_out;
static HANDLE g_heap;

int Sys_Tick(struct FINA_State * state)
{
        return FINA_InternalTick(state, 0);
}

void Sys_Init(int argcc, char ** argvv)
{
        g_in = GetStdHandle(STD_INPUT_HANDLE);
        g_out = GetStdHandle(STD_OUTPUT_HANDLE);
        g_heap = GetProcessHeap();
}

void Sys_End()
{
}

unsigned Sys_HasChar()
{
        return 1;
}

unsigned Sys_GetChar() 
{
        unsigned char c = '\r';
        DWORD read;
        while (c == '\r')
                ReadFile(g_in, &c, sizeof(c), &read, 0);
        return c;
}

void Sys_PutChar(unsigned u)
{
        char c = u;
        WriteFile(g_out, &c, 1, 0, 0);
}

void Sys_MemMove(char * to, const char * from, memsz bytes)
{
        __builtin_memmove(to, from, bytes);
}

void Sys_MemSet(char * dst, unsigned val, memsz bytes)
{
        __builtin_memset(dst, val, bytes);
}

void * Sys_FileOpen(const char * name, unsigned mode)
{
        return 0;
}

int Sys_Throw()
{
        return 0;
}

void Sys_FileClose(void * handle)
{
}

memsz Sys_FileRead(void * handle, char * buf, memsz len)
{
        return 0;
}

void Sys_FileWrite(void * handle, char * buf, memsz len)
{
}

void * Sys_FileMMap(void * handle)
{
        return 0;
}

unsigned Sys_Argc()
{
        return 0;
}

char ** Sys_Argv()
{
        return 0;
}

foffset Sys_FileSize(void * handle)
{
        return 0;
}

void Sys_FileSeek(void * handle, foffset pos)
{
}

foffset Sys_FileTell(void * handle)
{
        return 0;
}

unsigned Sys_FileLine(void * handle, char * buf, unsigned size)
{
        return 0;
}

void * Sys_Time()
{
        return 0;
}

unsigned Sys_Second(void * t)
{
        return 0;
}

unsigned Sys_Minute(void * t)
{
        return 0;
}

unsigned Sys_Hour(void * t)
{
        return 0;
}

unsigned Sys_Day(void * t)
{
        return 0;
}

unsigned Sys_Month(void * t)
{
        return 0;
}

unsigned Sys_Year(void * t)
{
        return 0;
}

void Sys_Sleep(unsigned ms)
{
}

void Sys_FileDelete(const char * name)
{
}

unsigned Sys_FileStat(const char * name)
{
        return 0;
}

void Sys_FileRen(const char * old, const char * new)
{
}

void Sys_FileTrunc(void * handle, foffset size)
{
}

void Sys_FileFlush(void * handle)
{
}

void * Sys_MemAllocate(memsz bytes)
{
        return HeapAlloc(g_heap, 0, bytes);
}

void Sys_MemFree(void * p)
{
        HeapFree(g_heap, 0, p);
}

void * Sys_MemResize(void * p, memsz newsize)
{
        return HeapReAlloc(g_heap, 0, p, newsize);
}
