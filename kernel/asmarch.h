#if 0
#elif defined __aarch64__
#define ASMCALL nop; bl
#define ASMCELL .xword
#define ASMALIGN .p2align 3
#elif defined __arm__
#define ASMCALL bl
#define ASMCELL .long
#define ASMALIGN .p2align 2
#elif defined __mips__
#define ASMCALL bal
#define ASMCELL .long
#define ASMALIGN .p2align 2
#elif defined __powerpc__
#define ASMCALL bl
#define ASMCELL .long
#define ASMALIGN .p2align 2
#elif defined __i386__
#define ASMCALL nop; nop; nop; call
#define ASMCELL .long
#define ASMALIGN .p2align 2
#elif defined __x86_64__
#define ASMCALL nop; nop; nop; call
#define ASMCELL .quad
#define ASMALIGN .p2align 3
#endif
