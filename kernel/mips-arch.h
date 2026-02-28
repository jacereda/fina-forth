#define PRIMSATTR __attribute__((section(".data")))

#define RSPREG asm("%s3")
#define FPCREG asm("%s2")
#define DSPREG asm("%s1")
#define TOSREG asm("%s0")
#define LNKREG asm("%ra")
#define CALLSAVE
#define CALLREST

typedef int64_t DCELL;
typedef uint64_t UDCELL;

static inline CELL *getlnk(void) {
        CELL *res;
        asm volatile(" move	%0,$ra" : "=r"(res));
        return res;
}

#if defined(__linux__)
#include <sys/cachectl.h>
static inline void flush_cache(char *pdict, unsigned bytes) {
        cacheflush((char *)pdict, bytes, ICACHE);
}
#elif defined(__NetBSD__)
#include <mips/cachectl.h>
static inline void flush_cache(char *pdict, unsigned bytes) {
        _cacheflush(pdict, bytes, ICACHE);
}
#else
#error Define flush_cache
#endif

static inline CELL arch_iscall(CELL xt) {
        return (*(CELL *)xt & 0xffff0000) == 0x04110000;
}

static inline CELL arch_callsize(void) {
        return 8;
}

static inline CELL arch_calledby(CELL xt) {
        CELL t = *(CELL *)xt;
        t &= 0xffff;
        t <<= 16;
        t >>= 14;
        t += xt + 4;
        return t;
}

static inline void arch_xtstore(CELL xt, CELL pdict) {
        xt -= pdict + 4;
        xt >>= 2;
        xt &= 0xffff;
        xt |= 0x04110000;
        ((CELL *)pdict)[0] = xt;
        ((CELL *)pdict)[1] = 0;
        flush_cache((char *)pdict, 8);
}
