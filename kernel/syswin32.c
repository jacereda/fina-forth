#include <stdio.h>
#include "fina.h"
#include "sys.h"

unsigned char g_buf[] = {
#include "boot.i"
};
unsigned g_curr = 0;
unsigned g_bufsz = 0;

int Sys_Tick(struct FINA_State * state)
{
	return FINA_InternalTick(state, 0);
}

void Sys_Init(int argcc, char ** argvv)
{
	g_bufsz = __builtin_strlen(g_buf);
	fflush(stdout);
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
	unsigned ret;
	if (g_curr < g_bufsz)
		ret = g_buf[g_curr++];
	else
		ret = getchar();
	fflush(stdout);
	return ret;
}

void Sys_PutChar(unsigned c)
{
	putchar(c);
	fflush(stdout);
}

void Sys_MemMove(char * to, const char * from, unsigned bytes)
{
	__builtin_memmove(to, from, bytes);
}

void Sys_MemSet(char * dst, unsigned val, unsigned bytes)
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

unsigned Sys_FileRead(void * handle, char * buf, unsigned len)
{
	return 0;
}

void Sys_FileWrite(void * handle, char * buf, unsigned len)
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

unsigned long long Sys_FileSize(void * handle)
{
	return 0;
}

void Sys_FileSeek(void * handle, unsigned long long pos)
{
}

unsigned long long Sys_FileTell(void * handle)
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

void Sys_FileTrunc(void * handle, unsigned long long size)
{
}

void Sys_FileFlush(void * handle)
{
}

void * Sys_MemAllocate(unsigned bytes)
{
	return 0;
}

unsigned Sys_MemFree(void * p)
{
	return 0;
}

void * Sys_MemResize(void * p, unsigned newsize)
{
	return 0;
}
