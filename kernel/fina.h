#include <stdint.h>
typedef intptr_t CELL;
#define FINA_BOOTSTRAP_STACK 16

#define FUNC __attribute__((visibility("default")))

struct FINA_State {
        CELL *fpc;
        CELL *dsp;
        CELL *rsp;
        CELL tos;
        CELL bootstrap_ds[FINA_BOOTSTRAP_STACK];
        CELL bootstrap_rs[FINA_BOOTSTRAP_STACK];
};
FUNC int FINA_Init(struct FINA_State *, int argc, char **argv);
FUNC int FINA_Tick(struct FINA_State *);
FUNC void FINA_End(struct FINA_State *);
