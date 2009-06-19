#define PRIMSATTR

#define CALLSAVE
#define CALLREST
#define RSPREG //asm("%r7");
#define FPCREG //asm("%r6");
#define DSPREG //asm("%r5");
#define TOSREG //asm("%r4");


static inline CELL * getlnk()
{
	register volatile CELL * lnk asm("%lr");
	return (CELL*)lnk;
}


static inline CELL arch_iscall(CELL xt)
{
        return (*(CELL*)xt & 0xff000000) == 0xeb000000;
}

static inline CELL arch_callsize()
{
        return 4;
}

static inline CELL arch_calledby(CELL xt)
{
        CELL t = *(CELL*)xt;
        t &= 0x00ffffff;
        t <<= 8;
        t >>= 6;
        t += xt;
        t += 2 * sizeof(CELL);
        return t;
}

static inline void arch_xtstore(CELL xt, CELL pdict)
{
        xt -= pdict;
        xt -= 2 * sizeof(CELL);
        xt >>= 2;
        xt &= 0x00ffffff;
        xt |= 0xeb000000;
        *(CELL*)pdict = xt;
        Sys_FlushRange(pdict, pdict + 4);
}
