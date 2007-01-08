#define CELL long

#define PRIMSATTR


#define RSPREG asm("%r18");
#define FPCREG asm("%r17");
#define DSPREG asm("%r16");
#define TOSREG asm("%r15");

#define CALLSAVE
#define CALLREST

static inline CELL * getlnk()
{
	CELL * res;
        asm volatile (" mflr %0 " : "=r" (res));
        return res;
}

static inline CELL arch_iscall(CELL xt)
{
        return (*(CELL*)xt & 0xfc000003) == 0x48000001;
}

static inline CELL arch_callsize()
{
        return 4;
}

static inline CELL arch_calledby(CELL xt)
{
        CELL t = *(CELL*)xt;
        t &= 0x3ffffffc;
        t <<= 6;
        t >>= 6;
        t += xt;
        return t;
}

static inline void arch_xtstore(CELL xt, CELL pdict)
{
        xt -= pdict;
        xt &= 0x03fffffc;
        xt |= 0x48000001;
        *(CELL*)pdict = xt;
        asm volatile("dcbst 0,%0\n sync\n icbi 0,%0\n sync\n isync\n"
                     ::"r"(pdict));
}
