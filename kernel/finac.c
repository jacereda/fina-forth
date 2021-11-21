#include "fina.h"
#include "arch.h"
#include "sys.h"

typedef uintptr_t UCELL;
#define FXSCALE 1000

#if BUILD_FFI
#if defined _WIN32
#include <windows.h>
#define DL_LAZY 0
static void * dlopen(const char * path, int mode) {
  return LoadLibrary(path);
}
static void * dlsym(void * l, const char * sym) {
  return GetProcAddress(l, sym);
}

#else
#include <dlfcn.h>
#endif
#include <ffi.h>
#endif

#define MAXSTR 512 // power of 2
#define FLAG(x) ((x)? -1 : 0)
#define CELLSHIFT (8*sizeof(CELL))
#define POPDC dc  = (((DCELL)tos) << CELLSHIFT) | *(UCELL*)dsp++; tos = *dsp++
#define POPDC2 dc2 = (((DCELL)tos) << CELLSHIFT) | *(UCELL*)dsp++; tos = *dsp++
#define PUSHDC *--dsp = tos; *--dsp = dc; tos = dc>>CELLSHIFT

#undef DEBUG
#if defined DEBUG
static inline void loc(const char * p) {
  while (*p++)
    Sys_PutChar(p[-1]);
  Sys_PutChar('\n');
}
#define DUMPDECL(x) const char * locstr = #x
#define DUMPLOC SAVEREGS; loc(locstr); RESTREGS
#else
#define DUMPDECL(x)
#define DUMPLOC
#endif

#define PRIM(x)  x: asm volatile(".globl XT_" #x "\nXT_" #x ":"); { DUMPDECL(x); int unused
#define NEXTT goto *(CELL*)*fpc++
#define NEXT (void) unused; DUMPLOC; } NEXTT
#define PUSH *--dsp = tos
#define RPUSH(reg) *--rsp = (CELL)(reg)
#define RPOP(reg) reg = *rsp++;
#define ARPOP(reg) reg = (CELL*)*rsp++;
#define POP tos = *dsp++

static inline CELL *userP()
{
        extern CELL Forth_UserP;
        return (CELL*)(Forth_UserP + arch_callsize());
}

static inline unsigned upCase(unsigned uiVal)
{
        if (uiVal >= 'a' && uiVal <= 'z')
                uiVal += 'A' - 'a';
        return uiVal;
}

static inline CELL nInsensitiveCompare(CELL p1, CELL p2, CELL len)
{
        CELL c1 = 0, c2 = 0;
        while (len-- && c1 == c2)
        {
                c1 = upCase(*(char*)p1++);
                c2 = upCase(*(char*)p2++);
        }
        return c1 == c2? 0 : c1 < c2? 1 : -1;
}

static inline CELL nCompare(CELL p1, CELL p2, CELL len)
{
        CELL c1 = 0, c2 = 0;
        while (len-- && c1 == c2)
        {
                c1 = *(char*)p1++;
                c2 = *(char*)p2++;
        }
        return c1 == c2? 0 : c1 < c2? 1 : -1;
}


#if BUILD_FILES
static inline char * zstr(char * res, const char * str, unsigned len)
{
        len &= MAXSTR-1;
        res[len] = 0;
        while (len--)
                res[len] = str[len];
        return res;
}
#endif  // BUILD_FILES

static unsigned strLen(const char * str)
{
    const char * ostr = str;
    while (*str++) ;
    return str - ostr - 1;
}

#if BUILD_FFI
static void closure(ffi_cif * cif, void * result, void ** args, void * xt)
{
        unsigned nargs = cif->nargs;
        struct FINA_State state;
        state.fpc = (CELL*)(arch_callsize() + (char*)xt);
        state.dsp = state.bootstrap_ds+FINA_BOOTSTRAP_STACK;
        state.rsp = state.bootstrap_rs+FINA_BOOTSTRAP_STACK;
        state.tos = (CELL)state.dsp;
        while(nargs--)
          *--(state.dsp) = *(CELL*)(*args++);
        FINA_Tick(&state);
        *(CELL*)result = state.tos;
}
#endif // BUILD_FFI

#if 0
static inline UCELL UMStar(UCELL * rl, UCELL a, UCELL b) {
        UDCELL res = a;
        res *= b;
        *rl = res;
        return res >> CELLSHIFT;
}
#endif

static inline UCELL UMSlashMod(UCELL * dd,
                               UCELL d,
                               UCELL * pmod)
{
        UCELL s = CELLSHIFT-1;
        UCELL i = CELLSHIFT;
        UCELL h = dd[0];
        UCELL l = dd[1];
        while (i--)
        {
                UCELL t = (CELL)h >> s;
                h = (h << 1) | (l >> s);
                l += l;
                if ((h | t) >= d)
                {
                        h -= d;
                        l++;
                }
        }
        *pmod = h;
        return l;
}

#define SAVEREGS do { \
        state->tos = tos; \
        state->rsp = rsp; \
        state->dsp = dsp; \
        state->fpc = fpc; \
} while(0)

#define RESTREGS do { \
        fpc = state->fpc; \
        rsp = state->rsp; \
        dsp = state->dsp; \
        tos = state->tos; \
} while(0)

int FINA_Init(struct FINA_State * state, int argc, char ** argv)
{
        extern CELL Forth_Entry;
        state->fpc = (CELL*)(Forth_Entry + arch_callsize());
        state->dsp = state->bootstrap_ds + FINA_BOOTSTRAP_STACK;
        state->rsp = state->bootstrap_rs + FINA_BOOTSTRAP_STACK;
        state->tos = 0;
        Sys_Init(argc, argv);
        return 0;
}

void FINA_End(struct FINA_State * state)
{
        Sys_End();
}

static int internalTick(struct FINA_State *, int) PRIMSATTR;

int FINA_InternalTick(struct FINA_State * state, int throwval) {
        return internalTick(state, throwval);
}

int FINA_Tick(struct FINA_State * state)
{
                return Sys_Tick(state);
}

int internalTick(struct FINA_State * state, int throwval) {
        static const void * tab[] = {
                &&NOOP,
#include "primstab.it"

#if BUILD_MOREPRIMS
#include "moreprimstab.it"
#endif

#if BUILD_FILES
#include "filestab.it"
#endif

#if BUILD_ALLOCATE
#include "allocatetab.it"
#endif

#if BUILD_FIXED
#include "fixedtab.it"
#endif

#if BUILD_FFI
#include "ffitab.it"
#endif

                &&ARGV,
        };

        register CELL * rsp RSPREG;
        register CELL * fpc FPCREG;
        register CELL * dsp DSPREG;
        register CELL   tos TOSREG;
#if defined LNKREG
        volatile register CELL * lnk LNKREG;
#endif
        int ret = 0xdeadbeef;
        extern CELL Forth_Here;
        CELL t0, t1, t2, t3, t4, t5, t6, t7;
        DCELL dc, dc2;
        float f;
        double d;
        char str1[MAXSTR];
        char str2[MAXSTR];

        (void)dc; (void)dc2;
        if (throwval)
        {
                fpc = (CELL*)(arch_callsize() + **(CELL**)userP());
                rsp = state->bootstrap_rs + FINA_BOOTSTRAP_STACK;
                dsp = state->bootstrap_ds + FINA_BOOTSTRAP_STACK;
                tos = throwval;
        }
        else
                RESTREGS;

        // DON'T MOVE THIS
        PRIM(NOOP);
        NEXT;

#define RETURN(x) ret = x; goto end

#include "prims.i"

#if BUILD_MOREPRIMS
#include "moreprims.i"
#endif

#if BUILD_FILES
#include "files.i"
#endif

#if BUILD_ALLOCATE
#include "allocate.i"
#endif

#if BUILD_FIXED
#include "fixed.i"
#endif

#if BUILD_FFI
#include "ffi.i"
#endif

        // DON'T MOVE THIS
        PRIM(ARGV);
        PUSH;
        CALLSAVE;
        t1 = (CELL)Sys_Argv();
        CALLREST;
        tos = t1;
        NEXT;

end:
        SAVEREGS;
        return ret;
}
