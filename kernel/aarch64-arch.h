#define PRIMSATTR
#define RSPREG
#define FPCREG
#define DSPREG
#define TOSREG
#define CALLSAVE SAVEREGS
#define CALLREST RESTREGS

typedef __int128_t DCELL;
typedef __uint128_t UDCELL;

static inline CELL *getlnk(void) {
        register CELL *lnk asm("x30");
        return lnk;
}

static inline CELL arch_iscall(CELL xt) {
       return ((((uint32_t *)xt)[1] & 0xfc000000) == 0x94000000);
}

static inline CELL arch_callsize(void) {
        return 8;
}

static inline CELL arch_calledby(CELL xt) {
    int32_t insn = ((uint32_t *)xt)[1];
    int64_t imm = (insn & 0x03ffffff);
    imm <<= 38;
    imm >>= 38;
    return xt + 4 + (imm << 2);
}

static inline void arch_xtstore(CELL xt, CELL pdict) {
  intptr_t pc = pdict + 4;
  intptr_t off = (xt - pc) >> 2;
  uint32_t imm = (uint32_t)(off & 0x03ffffff);
  ((uint32_t*)pdict)[0] = 0xD503201Fu;
  ((uint32_t *)pdict)[1] = 0x94000000u | imm;
  asm volatile ("dc\tcvau, %0"
		:
		: "r" (pdict)
		: "memory");
  asm volatile ("ic\tivau, %0"
		:
		: "r" (pdict)
		: "memory");

  asm volatile ("dc\tcvau, %0"
		:
		: "r" (pdict+4)
		: "memory");
  asm volatile ("ic\tivau, %0"
		:
		: "r" (pdict+4)
		: "memory");

  asm volatile ("dsb\tish" : : : "memory");
  asm volatile("isb" : : : "memory");
}
