
                PRIM(DOTO);
                *(CELL*)(*fpc++ + arch_callsize()) = tos;
                POP;
                NEXT;

                PRIM(UMSLASHMOD);
#if 1
                tos = UMSlashMod((UCELL*)dsp, tos,
				 (UCELL*)(dsp+1));
                dsp++;
#else
                t0 = tos;
                POP;
                POPDC;
                PUSH;
                tos = ((UDCELL)dc) % t0;
                PUSH;
                tos = ((UDCELL)dc) / t0;
#endif
                NEXT;

                PRIM(ALIGNED);
                tos += sizeof(CELL) - 1;
                tos &= -sizeof(CELL);
                NEXT;

                PRIM(ULT);
                tos = FLAG(((UCELL)*dsp++) < (UCELL) tos);
                NEXT;

                PRIM(PLUS);
                tos += *dsp++;
                NEXT;

                PRIM(CHARPLUS);
                tos++;
                NEXT;

                PRIM(CELLS);
                tos *= sizeof(CELL);
                NEXT;

                PRIM(COUNT);
                *--dsp = tos + 1;
                tos = *(unsigned char*)tos;
                NEXT;

                PRIM(QDUP);
                if (tos)
                        PUSH;
                NEXT;

                PRIM(NIP);
                dsp++;
                NEXT;

                PRIM(DNEGATE);
                POPDC;
                dc = -dc;
                PUSHDC;
                NEXT;

                PRIM(ROT);
                t0 = tos;
                tos = dsp[1];
                dsp[1] = dsp[0];
                dsp[0] = t0;
                NEXT;

                PRIM(ONEPLUS);
                tos++;
                NEXT;

                PRIM(ONEMINUS);
                tos--;
                NEXT;

                PRIM(CELLMINUS);
                tos -= sizeof(CELL);
                NEXT;

                PRIM(TWODUP);
                t0 = *dsp;
                *--dsp = tos;
                *--dsp = t0;
                NEXT;

                PRIM(DODO);
                RPUSH(*dsp++);
                RPUSH(tos);
                POP;
                NEXT;

                PRIM(MINUS);
                tos = *dsp++ - tos;
                NEXT;

                PRIM(GT);
                tos = FLAG(*dsp++ > tos);
                NEXT;

                PRIM(TWOSTORE);
                ((CELL*)tos)[0] = *dsp++;
                ((CELL*)tos)[1] = *dsp++;
                POP;
                NEXT;

                PRIM(EQUALS);
                tos = FLAG(tos == *dsp++);
                NEXT;

                PRIM(TWODROP);
                dsp++;
                POP;
                NEXT;

                PRIM(TWOSWAP);
                t0 = tos;
                tos = dsp[1];
                dsp[1] = t0;
                t0 = dsp[0];
                dsp[0] = dsp[2];
                dsp[2] = t0;
                NEXT;

                PRIM(UNLOOP);
                rsp += 2;
                NEXT;

                PRIM(LT);
                tos = FLAG(*dsp++ < tos);
                NEXT;

                PRIM(PLUSSTORE);
                *(CELL*)tos += *dsp++;
                POP;
                NEXT;

                PRIM(SGTD);
                PUSH;
                tos >>= CELLSHIFT-1;
                NEXT;

                PRIM(TWOFETCH);
                *--dsp=((CELL*)tos)[1];
                tos = ((CELL*)tos)[0];
                NEXT;

                PRIM(WITHIN);
                tos = FLAG(((UCELL)dsp[1] - (UCELL)dsp[0])
                           < ((UCELL)tos - (UCELL)dsp[0]));
                dsp += 2;
                NEXT;

                PRIM(UMSTAR);
		UDCELL t0 = (UCELL)tos;
		t0 *= ((UCELL*)dsp)[0];
		tos = t0 >> CELLSHIFT;
		dsp[0] = t0;
                NEXT;

                PRIM(DPLUS);
                POPDC;
                POPDC2;
                dc += dc2;
                PUSHDC;
                NEXT;

                PRIM(ABS);
                tos = tos > 0? tos : -tos;
                NEXT;

                PRIM(NEGATE);
                tos = -tos;
                NEXT;

                PRIM(INVERT);
                tos = ~tos;
                NEXT;

                PRIM(PICK);
                tos = dsp[tos];
                NEXT;

                PRIM(RSHIFT);
                tos = ((UCELL)*dsp++) >> tos;
                NEXT;

                PRIM(MAX);
                tos = tos > *dsp? tos : *dsp;
                dsp++;
                NEXT;

                PRIM(MIN);
                tos = tos < *dsp? tos : *dsp;
                dsp++;
                NEXT;

                PRIM(MSTAR);
                dc = tos;
                POP;
                dc *= tos;
                POP;
                PUSHDC;
                NEXT;

                PRIM(FILL);
                CALLSAVE;
                Sys_MemSet((char*)dsp[1], tos, dsp[0]);
                CALLREST;
                dsp += 2;
                POP;
                NEXT;

                PRIM(STAR);
                tos *= *dsp++;
                NEXT;

                PRIM(J);
                PUSH;
                tos = rsp[2];
                NEXT;

                PRIM(CELLPLUS);
                tos += sizeof(CELL);
                NEXT;

                PRIM(LSHIFT);
                tos = *dsp++ << tos;
                NEXT;

                PRIM(TWOOVER);
                PUSH;
                t0 = dsp[3];
                tos = dsp[2];
                *--dsp = t0;
                NEXT;

                PRIM(RDROP);
                rsp++;
                NEXT;

                PRIM(ZEROLTGT);
                tos = FLAG(tos);
                NEXT;

                PRIM(LTGT);
                tos = FLAG(tos != *dsp++);
                NEXT;

//                PRIMXXX(SLASH);
//                tos = *dsp++ / tos;
//                NEXT;
