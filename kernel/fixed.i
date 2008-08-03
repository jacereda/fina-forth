
                PRIM(FXGTFLOAT, 260);
                { 
		t1 = tos;
                f = t1 / 65536.0;
		__builtin_memcpy(&t1, &f, sizeof(CELL));
                tos = t1;
                NEXT;
                }

                PRIM(FLOATGTFX, 261);
                {
                t1 = tos;
		__builtin_memcpy(&f, &t1, sizeof(CELL));
		f *= 65536;
		tos = (CELL)f;
                NEXT;
                }

                PRIM(FXGTDOUBLE, 262);
                { 
                d = tos;
		POP;
		d /= 65536.0;
		__builtin_memcpy(&ll, &d, 2 * sizeof(CELL));
                PUSHLL;
                NEXT;
                }

                PRIM(DOUBLEGTFX, 263);
                {
                POPLL;
		__builtin_memcpy(&d, &ll, 2 * sizeof(CELL));
		d *= 65536;
		PUSH;
		tos = (CELL)d;
                NEXT;
                }

