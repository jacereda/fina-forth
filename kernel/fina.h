#include <stdint.h>
typedef intptr_t CELL;
#define FINA_BOOTSTRAP_STACK 16

struct FINA_State {
        CELL *fpc;
        CELL *dsp;
        CELL *rsp;
        CELL tos;
        CELL bootstrap_ds[FINA_BOOTSTRAP_STACK];
        CELL bootstrap_rs[FINA_BOOTSTRAP_STACK];
};
int FINA_Init(struct FINA_State *, int argc, char **argv);
int FINA_Tick(struct FINA_State *);
void FINA_End(struct FINA_State *);
