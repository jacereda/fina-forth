
                PRIM(DOLIT,0);
                PUSH;
                tos = *fpc++;
                NEXT;
                
                PRIM(DOCONST,1);
                PUSH;
                tos = *getlnk();
                NEXT;
                
                PRIM(DOVALUE,2);
                PUSH;
                tos = *getlnk();
                NEXT;
                
                PRIM(DOVAR,3);
                PUSH; 
                tos = (CELL)getlnk();
                NEXT;
                
                PRIM(DOCREATE,4);
                PUSH;
                t0 = (CELL)getlnk();
                tos = sizeof(CELL) + t0;
                goto **(CELL**)t0;
                NEXT;
                
                PRIM(DOUSER,6);
                PUSH;
                tos = *userP() + *getlnk();
                NEXT;
                
                PRIM(DOLIST,7);
                RPUSH(fpc);
                fpc = getlnk();
#if defined(PROFILE_FORTH)
                fpc[-2]++; // XXX No ira en pc
#endif    
                NEXT;
                
                PRIM(RPFETCH,8);
                PUSH;
                tos = (CELL)rsp;
                NEXT;
                
                PRIM(RPSTORE,9);
                rsp = (CELL*)tos;
                POP;
                NEXT;
                
                PRIM(SPFETCH,10);
                PUSH;
                tos = (CELL)dsp;
                NEXT;
                
                PRIM(SPSTORE,11);
                dsp = (CELL*)tos;
                POP;
                NEXT;
                
                PRIM(UMPLUS,12);
                *dsp += tos;
                tos = (unsigned)*dsp < (unsigned)tos;
                NEXT;
                
                PRIM(STORE,15);
                *(CELL*)tos = *dsp++;
                POP;
                NEXT;
                
                PRIM(ZEROLT,16);
                tos = FLAG(tos < 0);
                NEXT;
                
                PRIM(ZEROEQUALS,17);
                tos = FLAG(tos == 0);
                NEXT;
                
                PRIM(TWOSTAR,18);
                tos += tos;
                NEXT;
                
                PRIM(TWOSLASH,19);
                tos >>= 1;
                NEXT;
                
                PRIM(GTR,20);
                RPUSH(tos);
                POP;
                NEXT;
                
                PRIM(FETCH,21);
                tos = *(CELL*)tos;
                NEXT;
                
                PRIM(AND,22);
                tos &= *dsp++;
                NEXT;
                
                PRIM(CSTORE,23);
                *(unsigned char *)tos = *dsp++;
                POP;
                NEXT;
                
                PRIM(CFETCH,24);
                tos = *(unsigned char *)tos;
                NEXT;
                
                PRIM(DROP,25);
                POP;
                NEXT;
                
                PRIM(DUP,26);
                PUSH;
                NEXT;
                
                PRIM(EXECUTE,27);
                t0 = tos;
                POP;
                goto *t0;
                NEXT;
                
                PRIM(EXIT,28);
                RPOP(fpc);
                NEXT;
                
                PRIM(MOVE,29);
                CALLSAVE;
                Sys_MemMove((char*)dsp[0], (char*)dsp[1], tos);
                CALLREST;
                dsp += 2;
                POP;
                NEXT;
                
                PRIM(OR,30);
                tos |= *dsp++;
                NEXT;
                
                PRIM(OVER,31);
                PUSH;
                tos = dsp[1];
                NEXT;
                
                PRIM(RGT,32);
                PUSH;
                RPOP(tos);
                NEXT;
                
                PRIM(I, 92);
                PUSH;
                tos = *rsp;
                NEXT;
                
                PRIM(SWAP,34);
                t0 = tos;
                tos = dsp[0];
                dsp[0] = t0;
                NEXT;
                
                PRIM(XOR,35);
                tos ^= *dsp++;
                NEXT;
                
                PRIM(BRANCH,36);
                fpc = ((char*)fpc) + *fpc;
                NEXT;
                
                PRIM(DONEXT, 116);
                if (rsp[0]--)
                        fpc = ((char*)fpc) + *fpc;
                else
                        fpc++;
                NEXT;
                
                PRIM(DOLOOP,37);
                if (++rsp[0] != rsp[1])
                        fpc = ((char*)fpc) + *fpc;
                else
                        fpc++;
                NEXT;
                
                PRIM(DOPLUSLOOP,38);
                t0 = rsp[0] - rsp[1];
                rsp[0] += tos;
                if ((t0 ^ (t0 + tos)) >= 0 || (t0 ^ tos) >= 0)
                        fpc = ((char*)fpc) + *fpc;
                else
                        fpc++;
                POP;
                NEXT;
                
                PRIM(RXQ,66);
                PUSH;
                CALLSAVE;
                t1 = Sys_HasChar();
                CALLREST;
                tos = t1;
                NEXT;
                
                PRIM(RXFETCH,39);
                PUSH;
                CALLSAVE;
                t1 = Sys_GetChar(); 
                CALLREST;
                tos = t1;
                NEXT;
                
                PRIM(TXQ,40);
                PUSH;
                tos = -1;
                NEXT;
                
                PRIM(TXSTORE,41);
                CALLSAVE;
                Sys_PutChar(tos);
                CALLREST;
                POP;
                NEXT;
                
                PRIM(ZEROBRANCH,42);
                if (tos == 0)
                        fpc = ((char*)fpc) + *fpc;
                else
                        fpc++;
                POP;
                NEXT;
                
                PRIM(QDODEFINE,44);
                PUSH;
                if (arch_iscall(tos))
                {
                        *dsp += arch_callsize();
                        tos = arch_calledby(tos);
                }
                else
                        tos = 0;
                NEXT;
                
                PRIM(XTCOMMA,45);
                t0 = *(CELL*)(Forth_Here + arch_callsize());
                t0 += sizeof(CELL)-1;
                t0 &= -sizeof(CELL);
                *(CELL*)(Forth_Here + arch_callsize()) = t0 + arch_callsize();
                arch_xtstore(tos, t0);
                tos = t0;
                NEXT;
                
                PRIM(ENDTICK,55);
                RETURN(0);
                NEXT;
                
                PRIM(BYE,56);
                RETURN(1);
                NEXT;
                
                PRIM(CALL0,57);
                CALLSAVE;
                t1 = ((unsigned(*)())tos)();
                CALLREST;
                tos = t1;
                NEXT;
                
                PRIM(CALL1,58);
                CALLSAVE;
                t1 = ((unsigned(*)())tos)(dsp[0]);
                CALLREST;
                tos = t1;
                dsp++;
                NEXT;
                
                PRIM(CALL2,59);
                CALLSAVE;
                t1 = ((unsigned(*)())tos)(dsp[0], dsp[1]);
                CALLREST;
                tos = t1;
                dsp += 2;
                NEXT;
                
                PRIM(CALL3,60);
                CALLSAVE;
                t1 = ((unsigned(*)())tos)(dsp[0], dsp[1], dsp[2]);
                CALLREST;
                tos = t1;
                dsp += 3;
                NEXT;
                
                PRIM(CALL4,61);
                CALLSAVE;
                t1 = ((unsigned(*)())tos)(dsp[0], dsp[1], dsp[2], dsp[3]);
                CALLREST;
                tos = t1;
                dsp += 4;
                NEXT;
                
                PRIM(SAMEQ,62);
                CALLSAVE;
                t1 = nCaseCompare(dsp[0], dsp[1], tos);
                CALLREST;
                tos = t1;
                dsp += 2;
                NEXT;

                PRIM(RFETCH,33);
                PUSH;
                tos = *rsp;
                NEXT;


                PRIM(MS, 298);
                CALLSAVE;
                Sys_Sleep(tos);
                CALLREST;
                POP;
                NEXT;
                
                PRIM(TIMEANDDATE, 299);
                PUSH;
                CALLSAVE;
                t1 = (CELL)Sys_Time();
                t2 = Sys_Second((void*)t1);
                t3 = Sys_Minute((void*)t1);
                t4 = Sys_Hour((void*)t1);
                t5 = Sys_Day((void*)t1);
                t6 = Sys_Month((void*)t1);
                t7 = Sys_Year((void*)t1);
                CALLREST;
                dsp -= 5;
                tos = t2;
                dsp[4] = t3;
                dsp[3] = t4;
                dsp[2] = t5;
                dsp[1] = t6;
                dsp[0] = t7;
                NEXT;

                PRIM(ARGC,300);
                PUSH;
                CALLSAVE;
                t1 = Sys_Argc();
                CALLREST;
                tos = t1;
                NEXT;

