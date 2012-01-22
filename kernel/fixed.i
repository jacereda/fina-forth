
                PRIM(FXGTFLOAT);
                { 
		t1 = tos;
                f = t1 / (float)FXSCALE;
		__builtin_memcpy(&t1, &f, sizeof(CELL));
                tos = t1;
                NEXT;
                }

                PRIM(FLOATGTFX);
                {
                t1 = tos;
		__builtin_memcpy(&f, &t1, sizeof(CELL));
		f *= FXSCALE;
		tos = (CELL)f;
                NEXT;
                }

                PRIM(FXGTDOUBLE);
                { 
                d = tos;
		POP;
		d /= FXSCALE;
		__builtin_memcpy(&dc, &d, 2 * sizeof(CELL));
                PUSHDC;
                NEXT;
                }

                PRIM(DOUBLEGTFX);
                {
                POPDC;
		__builtin_memcpy(&d, &dc, 2 * sizeof(CELL));
		d *= FXSCALE;
		PUSH;
		tos = (CELL)d;
                NEXT;
                }

