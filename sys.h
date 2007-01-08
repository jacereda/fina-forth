void Sys_Init(int argc, char ** argv);
void Sys_End();
int Sys_Tick();
unsigned Sys_Argc();
char ** Sys_Argv();

unsigned Sys_Throw();

// File support
void * Sys_FileOpen(const char * name, unsigned mode);
void Sys_FileClose(void * handle);
unsigned Sys_FileRead(void * handle, char * buf, unsigned len);
void Sys_FileWrite(void * handle, char * buf, unsigned len);
void * Sys_FileMMap(void * handle);
unsigned long long Sys_FileSize(void * handle);
unsigned long long Sys_FileTell(void * handle);
void Sys_FileSeek(void * handle, unsigned long long pos);
unsigned Sys_FileLine(void * handle, char * buf, unsigned len);
void Sys_FileDelete(const char * name);
unsigned Sys_FileStat(const char * name);
void Sys_FileRen(const char * old, const char * new);
void Sys_FileTrunc(void * handle, unsigned long long size);
void Sys_FileFlush(void * handle);

// Memory
void Sys_MemMove(char * to, const char * from, unsigned bytes);
void Sys_MemSet(char * dst, unsigned c, unsigned bytes);

// Memory Allocation
void * Sys_MemAllocate(unsigned bytes);
unsigned Sys_MemFree(void * addr);
void * Sys_MemResize(void * addr, unsigned newsize);

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

