#include "fina.h"

int main(int argc, char ** argv)
{
		struct FINA_State state;
		if (0 == FINA_Init(&state, argc, argv))
				while (0 == FINA_Tick(&state)) 
						;
		FINA_End(&state);
		return 0;
}

