#define HAS_64BIT
#define PRIMSATTR
#define FPCREG // asm("%r12")
#define RSPREG // asm("%r13")
#define DSPREG // asm("%r14")
#define TOSREG // asm("%r15")

#define ASMCALL                                                                \
        nop;                                                                   \
        nop;                                                                   \
        nop;                                                                   \
        call
#define ASMCELL .quad
#define ASMALIGN .p2align 3

#if !defined ASM

typedef __int128_t DCELL;
typedef __uint128_t UDCELL;
static inline CELL *getlnk() {
        CELL *res;
        asm volatile(" popq %0 " : "=r"(res));
        return res;
}

#define CALLSAVE
#define CALLREST

static inline CELL arch_iscall(CELL xt) {
        return (*(int32_t *)xt) == 0xe8909090;
}

static inline CELL arch_callsize() {
        return 8;
}

static inline CELL arch_calledby(CELL xt) {
        return xt + 3 + 5 + ((int32_t *)xt)[1];
}

static inline void arch_xtstore(CELL xt, CELL pdict) {
        ((int32_t *)pdict)[0] = 0xe8909090;
        ((int32_t *)pdict)[1] = xt - (pdict + 3 + 5);
}
#endif
