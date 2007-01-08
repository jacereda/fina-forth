#define CELL long

#define PRIMSATTR  
#define FPCREG asm("%esi")
#define RSPREG
#define DSPREG asm("%edi") 
#define TOSREG asm("%ecx")

static inline CELL * getlnk()
{
        CELL * res;
        asm volatile (" popl %0 " : "=r" (res));
        return res;
}

#define CALLSAVE SAVEREGS
#define CALLREST RESTREGS

static inline CELL arch_iscall(CELL xt)
{
        return (*(CELL*)xt) == 0xe8909090;
}

static inline CELL arch_callsize()
{
        return 8;
}

static inline CELL arch_calledby(CELL xt)
{
        return xt + 3 + 5 + ((CELL*)xt)[1];
}

static inline void arch_xtstore(CELL xt, CELL pdict)
{
        ((CELL*)pdict)[0] = 0xe8909090;
        ((CELL*)pdict)[1] = xt - (pdict + 3 + 5);
}

