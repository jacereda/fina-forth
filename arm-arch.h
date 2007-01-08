#define CELL long

#define PRIMSATTR

#define SAVESP
#define RESTORESP
register CELL * rsp asm("%r7");
register CELL * fpc asm("%r6");
register CELL * dsp asm("%r5");
register CELL   tos asm("%r4");


static inline CELL * getlnk()
{
	register volatile CELL * lnk asm("%lr");
	return lnk;
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
        t += tos;
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
