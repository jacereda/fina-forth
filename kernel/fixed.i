
                PRIM(FXGTFLOAT);
                {
                f = tos / (float)FXSCALE;
		t1 = 0;
		__builtin_memcpy(&t1, &f, sizeof(f));
		tos = t1;
                NEXT;
                }

                PRIM(FLOATGTFX);
                {
                t1 = tos;
		__builtin_memcpy(&f, &t1, sizeof(f));
		f *= FXSCALE;
		tos = (CELL)f;
                NEXT;
                }

                PRIM(FXGTDOUBLE);
                {
                d = tos;
		POP;
		d /= FXSCALE;
		dc = 0;
		__builtin_memcpy(&dc, &d, sizeof(d));
                PUSHDC;
                NEXT;
                }

                PRIM(DOUBLEGTFX);
                {
                POPDC;
		__builtin_memcpy(&d, &dc, sizeof(d));
		d *= FXSCALE;
		PUSH;
		tos = (CELL)d;
                NEXT;
                }
