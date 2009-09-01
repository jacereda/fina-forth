#define HAS_64BIT
#define PRIMSATTR  
#define FPCREG asm("%rsi")
#define RSPREG
#define DSPREG asm("%rdi") 
#define TOSREG asm("%rdx")
typedef __int128_t DCELL;
typedef __uint128_t UDCELL;
static inline CELL * getlnk()
{
        CELL * res;
        asm volatile  (" popq %0 " : "=r" (res));
        return res;
}

#define CALLSAVE SAVEREGS
#define CALLREST RESTREGS

static inline CELL arch_iscall(CELL xt)
{
        return (*(int32_t*)xt) == 0xe8909090;
}

static inline CELL arch_callsize()
{
        return 8;
}

static inline CELL arch_calledby(CELL xt)
{
        return xt + 3 + 5 + ((int32_t*)xt)[1];
}

static inline void arch_xtstore(CELL xt, CELL pdict)
{
        ((int32_t*)pdict)[0] = 0xe8909090;
        ((int32_t*)pdict)[1] = xt - (pdict + 3 + 5);
}
