
                PRIM(FXGTFLOAT, 260);
                { 
		t1 = tos;
                f = t1 / (float)FXSCALE;
		__builtin_memcpy(&t1, &f, sizeof(CELL));
                tos = t1;
                NEXT;
                }

                PRIM(FLOATGTFX, 261);
                {
                t1 = tos;
		__builtin_memcpy(&f, &t1, sizeof(CELL));
		f *= FXSCALE;
		tos = (CELL)f;
                NEXT;
                }

                PRIM(FXGTDOUBLE, 262);
                { 
                d = tos;
		POP;
		d /= FXSCALE;
		__builtin_memcpy(&ll, &d, 2 * sizeof(CELL));
                PUSHLL;
                NEXT;
                }

                PRIM(DOUBLEGTFX, 263);
                {
                POPLL;
		__builtin_memcpy(&d, &ll, 2 * sizeof(CELL));
		d *= FXSCALE;
		PUSH;
		tos = (CELL)d;
                NEXT;
                }

