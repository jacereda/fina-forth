
                PRIM(DOTO,5);
                ((CELL*)*fpc++)[arch_callsize() / sizeof(CELL)] = tos;
                POP;
                NEXT;
                
                PRIM(UMSLASHMOD,67);
#if 1
                tos = UMSlashMod(dsp, tos, dsp+1);
                dsp++;
#else
                t0 = tos;
                POP;
                POPLL;
                PUSH;
                tos = ((unsigned long long)ll) % t0;
                PUSH;
                tos = ((unsigned long long)ll) / t0;
#endif
                NEXT;
                
                PRIM(ALIGNED, 68);
                tos += sizeof(CELL) - 1;
                tos &= -sizeof(CELL);
                NEXT;
                
                PRIM(ULT, 69);
                tos = FLAG(((unsigned)*dsp++) < (unsigned) tos);
                NEXT;
                
                PRIM(PLUS, 71);
                tos += *dsp++;
                NEXT;
                
                PRIM(CHARPLUS, 72);
                tos++;
                NEXT;
                
                PRIM(CELLS, 73);
                tos *= sizeof(CELL);
                NEXT;
                
                PRIM(COUNT, 74);
                *--dsp = tos + 1;
                tos = *(unsigned char*)tos;
                NEXT;
                
                PRIM(QDUP, 75);
                if (tos)
                        PUSH;
                NEXT;
                
                PRIM(NIP, 76);
                dsp++;
                NEXT;
                
                PRIM(DNEGATE, 78);
                POPLL;
                ll = -ll;
                PUSHLL;
                NEXT;
                
                PRIM(ROT, 79);
                t0 = tos;
                tos = dsp[1];
                dsp[1] = dsp[0];
                dsp[0] = t0;
                NEXT;
                
                PRIM(ONEPLUS, 80);
                tos++;
                NEXT;
                
                PRIM(ONEMINUS, 81);
                tos--;
                NEXT;
                
                PRIM(CELLMINUS, 82);
                tos -= sizeof(CELL);
                NEXT;
                
                PRIM(TWODUP, 83); 
                t0 = *dsp;
                *--dsp = tos;
                *--dsp = t0;
                NEXT;
                
                PRIM(DODO, 85);
                RPUSH(*dsp++);
                RPUSH(tos);
                POP;
                NEXT;
                
                PRIM(MINUS, 86);
                tos = *dsp++ - tos;
                NEXT;
                
                PRIM(GT, 87);
                tos = FLAG(*dsp++ > tos);
                NEXT;
                
                PRIM(TWOSTORE, 88);
                ((CELL*)tos)[0] = *dsp++;
                ((CELL*)tos)[1] = *dsp++;
                POP;
                NEXT;
                
                PRIM(EQUALS, 89);
                tos = FLAG(tos == *dsp++);
                NEXT;
                
                PRIM(TWODROP, 90);
                dsp++;
                POP;
                NEXT;
                
                PRIM(TWOSWAP, 91);
                t0 = tos;
                tos = dsp[1];
                dsp[1] = t0;
                t0 = dsp[0];
                dsp[0] = dsp[2];
                dsp[2] = t0;
                NEXT;
                
                PRIM(UNLOOP, 93);
                rsp += 2;
                NEXT;
                
                PRIM(LT, 94);
                tos = FLAG(*dsp++ < tos);
                NEXT;
                
                PRIM(PLUSSTORE, 95);
                *(CELL*)tos += *dsp++;
                POP;
                NEXT;
                
                PRIM(SGTD, 96);
                PUSH;
                tos >>= 31;
                NEXT;
                
                PRIM(TWOFETCH, 97);
                *--dsp=((CELL*)tos)[1];
                tos = ((CELL*)tos)[0];
                NEXT;
                
                PRIM(WITHIN, 98);
                tos = FLAG(((unsigned)dsp[1] - (unsigned)dsp[0]) 
                           < ((unsigned)tos - (unsigned)dsp[0]));
                dsp += 2;
                NEXT;
                
                PRIM(UMSTAR, 99);
                unsigned long long t0 = (unsigned)tos;
                unsigned long long t1;
                POP;
                t1 = (unsigned)tos;
                ull = t1 * t0;
                POP;
                PUSHULL;
                NEXT;
                
                PRIM(DPLUS, 100);
                POPLL;
                POPLL2;
                ll += ll2;
                PUSHLL;
                NEXT;
                
                PRIM(ABS, 101);
                tos = tos > 0? tos : -tos;
                NEXT;
                
                PRIM(NEGATE, 102);
                tos = -tos;
                NEXT;
                
                PRIM(INVERT, 103);
                tos = ~tos;
                NEXT;
                
                PRIM(PICK, 104);
                tos = dsp[tos];
                NEXT;
                
                PRIM(RSHIFT, 105);
                tos = ((unsigned)*dsp++) >> tos;
                NEXT;
                
                PRIM(MAX, 106);
                tos = tos > *dsp? tos : *dsp;
                dsp++;
                NEXT;
                
                PRIM(MIN, 107);
                tos = tos < *dsp? tos : *dsp;
                dsp++;
                NEXT;
                
                PRIM(MSTAR, 108);
                ll = tos;
                POP;
                ll *= tos;
                POP;
                PUSHLL;
                NEXT;
                
                PRIM(FILL, 109);
                CALLSAVE;
                Sys_MemSet((char*)dsp[1], tos, dsp[0]);
                CALLREST;
                dsp += 2;
                POP;
                NEXT;
                
                PRIM(STAR, 110);
                tos *= *dsp++;
                NEXT;
                
                PRIM(J, 111);
                PUSH;
                tos = rsp[2];
                NEXT;
                
                PRIM(CELLPLUS, 112);
                tos += sizeof(CELL);
                NEXT;
                
                PRIM(LSHIFT, 113);
                tos = *dsp++ << tos;
                NEXT;
                
                PRIM(TWOOVER, 115);
                PUSH;
                t0 = dsp[3];
                tos = dsp[2];
                *--dsp = t0;
                NEXT;
                
                PRIM(RDROP, 120);
                rsp++;
                NEXT;
                
                PRIM(ZEROLTGT, 121);
                tos = FLAG(tos);
                NEXT;

                PRIM(LTGT, 122);
                tos = FLAG(tos != *dsp++);
                NEXT;
                
//                PRIM(SLASH, 123);
//                tos = *dsp++ / tos;
//                NEXT;
                
