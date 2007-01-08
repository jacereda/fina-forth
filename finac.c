#include "fina.h"
#include "arch.h"
#include "sys.h"

#if defined(HAS_FFI)
#include <dlfcn.h>
#include <ffi.h>
#endif

// #define PROFILE_FORTH 1

#define FLAG(x) (x)? -1 : 0;

#define POPLL  ll  = (((long long)tos) << 32) | *(unsigned*)dsp++; tos = *dsp++
#define POPLL2 ll2 = (((long long)tos) << 32) | *(unsigned*)dsp++; tos = *dsp++
#define POPULL ull = (((unsigned long long)tos) << 32) \
                   | *(unsigned*)dsp++; tos = *dsp++
#define PUSHLL *--dsp = tos; *--dsp = ll; tos = ll>>32
#define PUSHULL *--dsp = tos; *--dsp = ull; tos = ull>>32

#define PRIM(x, n)  x: asm(".p2align 2\n.globl XT_" #x "\nXT_" #x ":"); { int unused
#define NEXTT goto **fpc++
#define NEXT (void) unused; } NEXTT
#define PUSH *--dsp = tos
#define RPUSH(reg) *--rsp = (CELL)(reg)
#define RPOP(reg) reg = *rsp++;
#define POP tos = *dsp++

struct state {
        CELL * fpc;
        CELL * dsp;
        CELL * rsp;
        CELL   tos;
} _saved;
struct state volatile * volatile saved = &_saved;
#define BOOTSTRAP_STACK 16

static CELL bootstrap_dsp[BOOTSTRAP_STACK];
static CELL bootstrap_rsp[BOOTSTRAP_STACK];

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

static inline CELL nCaseCompare(CELL p1, CELL p2, CELL len)
{
        CELL c1 = 0, c2 = 0;
        while (len-- && c1 == c2)
        {
                c1 = upCase(*(char*)p1++);
                c2 = upCase(*(char*)p2++);
        }
        return c1 == c2? 0 : c1 < c2? -1 : 1;
}

#if defined(HAS_FILES)
static char * zstr(const char * str, unsigned len)
{
        static char res[512];
        len &= 511;
        Sys_MemMove(res, str, len);
        res[len] = 0;
        return res;
}

static char * zstr2(const char * str, unsigned len)
{
        static char res[512];
        len &= 511;
        Sys_MemMove(res, str, len);
        res[len] = 0;
        return res;
}
#endif  // HAS_FILES

static unsigned strLen(const char * str)
{
    const char * ostr = str;
    while (*str++) ;
    return str - ostr - 1;
}


static inline unsigned CELL UMSlashMod(unsigned CELL * dd, 
                                       unsigned CELL d, 
                                       unsigned CELL * pmod)
{
#if 0
        *pmod = dd % d;
        return dd / d;
#else
        unsigned s = 8*sizeof(CELL)-1;
        unsigned i = 8*sizeof(CELL);
        unsigned h = dd[0];
        unsigned l = dd[1];
        while (i--)
        {
                unsigned t = (int)h >> s;
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
#endif
}

#define SAVEREGS \
        saved->tos = tos; \
        saved->rsp = rsp; \
        saved->dsp = dsp; \
        saved->fpc = fpc 

#define RESTREGS \
        fpc = saved->fpc; \
        rsp = saved->rsp; \
        dsp = saved->dsp; \
        tos = saved->tos 

int FINA_Init(int argc, char ** argv)
{
        extern CELL Forth_Entry;
        Sys_Init(argc, argv);
        
        saved->fpc = (CELL*)(Forth_Entry + arch_callsize());
        saved->dsp = bootstrap_dsp+BOOTSTRAP_STACK;
        saved->rsp = bootstrap_rsp+BOOTSTRAP_STACK;
        saved->tos = 0;
        return 0;
}

void FINA_End()
{
        Sys_End();
}

int FINA_InternalTick(int throw)
{
        static CELL * tab[] = {
                &&NOOP,
#include "primstab.it"

#if defined(MORE_PRIMS)
#include "moreprimstab.it"
#endif

#if defined(HAS_FILES)
#include "filestab.it"
#endif

#if defined(HAS_ALLOCATE)
#include "allocatetab.it"
#endif

#if defined(HAS_FIXED)
#include "fixedtab.it"
#endif

#if defined(HAS_FFI)
#include "ffitab.it"
#endif

                &&ARGV,
        };
        
        register CELL * rsp RSPREG;
        register CELL * fpc FPCREG;
        register CELL * dsp DSPREG;
        register CELL   tos TOSREG; 
        int ret = 0xdeadbeef;
        extern CELL Forth_Here;
        register CELL t0;
        CELL t1, t2, t3, t4, t5, t6, t7;
        long long ll, ll2;
        unsigned long long ull;
        float f;
        
        (void)ll; (void)ll2; (void)ull;
        if (throw)
        {
                fpc = (CELL*)(arch_callsize() + **(CELL**)userP());
                rsp = bootstrap_rsp + BOOTSTRAP_STACK;
                dsp = bootstrap_dsp + BOOTSTRAP_STACK;
                tos = throw;
        }
        else
                RESTREGS;
        
        
        // DON'T MOVE THIS
        PRIM(NOOP,-1);
        NEXT;
        
#define RETURN(x) ret = x; goto end
        
#include "prims.i"
        
#if defined(MORE_PRIMS)
#include "moreprims.i"
#endif
        
#if defined(HAS_FILES)
#include "files.i"
#endif

#if defined(HAS_ALLOCATE)
#include "allocate.i"
#endif

#if defined(HAS_FIXED)
#include "fixed.i"
#endif

#if defined(HAS_FFI)
#include "ffi.i"
#endif

        // DON'T MOVE THIS
        PRIM(ARGV,301);
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

int FINA_Tick()
{
        return Sys_Tick();
}

