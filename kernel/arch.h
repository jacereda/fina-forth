#if 0
#elif defined __aarch64__
#define ARCH aarch64
#elif defined __arm__
#define ARCH arm
#elif defined __mips__
#define ARCH mips
#elif defined __i386__
#define ARCH i686
#elif defined __powerpc__
#undef powerpc
#define ARCH powerpc
#elif defined __x86_64__
#define ARCH x86_64
#else
#error unknown arch
#endif



#define PASTE(a, b) a##b
#define HEADER_NAME <ARCH-arch.h>
#define IHEADER_NAME <dict-ARCH-STAGE.i>

#include HEADER_NAME
