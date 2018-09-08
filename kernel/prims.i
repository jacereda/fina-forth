
                PRIM(DOLIT);
                PUSH;
                tos = *fpc++;
                NEXT;
                
                PRIM(DOCONST);
                PUSH;
                tos = *getlnk();
                NEXT;
                
                PRIM(DOVALUE);
                PUSH;
                tos = *getlnk();
                NEXT;
                
                PRIM(DOVAR);
                PUSH; 
                tos = (CELL)getlnk();
                NEXT;
                
                PRIM(DOCREATE);
                PUSH;
                t0 = (CELL)getlnk();
                tos = sizeof(CELL) + t0;
                goto **(CELL**)t0;
                NEXT;
                
                PRIM(DOUSER);
                PUSH;
                tos = *userP() + sizeof(CELL) * *getlnk();
                NEXT;
                
                PRIM(DOLIST);
                RPUSH(fpc);
                fpc = getlnk();
#if BUILD_PROFILE
                {
                        extern CELL Forth_Prof, Forth_Entry;
                        fpc[(&Forth_Prof - &Forth_Entry)
                            + 2 - arch_callsize() / sizeof(CELL)]++;
                }
#endif    
                NEXT;
                
                PRIM(RPFETCH);
                PUSH;
                tos = (CELL)rsp;
                NEXT;
                
                PRIM(RPSTORE);
                rsp = (CELL*)tos;
                POP;
                NEXT;
                
                PRIM(SPFETCH);
                PUSH;
                tos = (CELL)dsp;
                NEXT;
                
                PRIM(SPSTORE);
                dsp = (CELL*)tos;
                POP;
                NEXT;
                
                PRIM(UMPLUS);
                *dsp += tos;
                tos = ((UCELL)*dsp) < (UCELL)tos;
                NEXT;
                
                PRIM(STORE);
                *(CELL*)tos = *dsp++;
                POP;
                NEXT;
                
                PRIM(ZEROLT);
                tos = FLAG(tos < 0);
                NEXT;
                
                PRIM(ZEROEQUALS);
                tos = FLAG(tos == 0);
                NEXT;
                
                PRIM(TWOSTAR);
                tos += tos;
                NEXT;
                
                PRIM(TWOSLASH);
                tos >>= 1;
                NEXT;
                
                PRIM(GTR);
                RPUSH(tos);
                POP;
                NEXT;
                
                PRIM(FETCH);
                tos = *(CELL*)tos;
                NEXT;
                
                PRIM(AND);
                tos &= *dsp++;
                NEXT;
                
                PRIM(CSTORE);
                *(unsigned char *)tos = *dsp++;
                POP;
                NEXT;
                
                PRIM(CFETCH);
                tos = *(unsigned char *)tos;
                NEXT;
                
                PRIM(DROP);
                POP;
                NEXT;
                
                PRIM(DUP);
                PUSH;
                NEXT;
                
                PRIM(EXECUTE);
                t0 = tos;
                POP;
                goto *(CELL*)t0;
                NEXT;
                
                PRIM(EXIT);
                ARPOP(fpc);
                NEXT;
                
                PRIM(MOVE);
                CALLSAVE;
                Sys_MemMove((char*)dsp[0], (char*)dsp[1], tos);
                CALLREST;
                dsp += 2;
                POP;
                NEXT;
                
                PRIM(OR);
                tos |= *dsp++;
                NEXT;
                
                PRIM(OVER);
                PUSH;
                tos = dsp[1];
                NEXT;
                
                PRIM(RGT);
                PUSH;
                RPOP(tos);
                NEXT;
                
                PRIM(I);
                PUSH;
                tos = *rsp;
                NEXT;
                
                PRIM(SWAP);
                t0 = tos;
                tos = dsp[0];
                dsp[0] = t0;
                NEXT;
                
                PRIM(XOR);
                tos ^= *dsp++;
                NEXT;
                
                PRIM(BRANCH);
                fpc += fpc[0];
                NEXT;
                
                PRIM(DONEXT);
                if (rsp[0]--)
                        fpc += fpc[0];
                else
                        fpc++;
                NEXT;
                
                PRIM(DOLOOP);
                if (++rsp[0] != rsp[1])
                        fpc += fpc[0];
                else
                        fpc++;
                NEXT;
                
                PRIM(DOPLUSLOOP);
                t0 = rsp[0] - rsp[1];
                rsp[0] += tos;
                if ((t0 ^ (t0 + tos)) >= 0 || (t0 ^ tos) >= 0)
                        fpc += fpc[0];
                else
                        fpc++;
                POP;
                NEXT;
                
                PRIM(RXQ);
                PUSH;
                CALLSAVE;
                t1 = Sys_HasChar();
                CALLREST;
                tos = t1;
                NEXT;
                
                PRIM(RXFETCH);
                PUSH;
                CALLSAVE;
                t1 = Sys_GetChar(); 
                CALLREST;
                tos = t1;
                NEXT;
                
                PRIM(TXQ);
                PUSH;
                tos = -1;
                NEXT;
                
                PRIM(TXSTORE);
                CALLSAVE;
                Sys_PutChar(tos);
                CALLREST;
                POP;
                NEXT;
                
                PRIM(ZEROBRANCH);
                if (tos == 0)
                        fpc +=  fpc[0];
                else
                        fpc++;
                POP;
                NEXT;
                
                PRIM(QDODEFINE);
                PUSH;
                if (arch_iscall(tos))
                {
                        *dsp += arch_callsize();
                        tos = arch_calledby(tos);
                }
                else
                        tos = 0;
                NEXT;
                
                PRIM(XTCOMMA);
                t0 = *(CELL*)(Forth_Here + arch_callsize());
                t0 += sizeof(CELL)-1;
                t0 &= -sizeof(CELL);
                *(CELL*)(Forth_Here + arch_callsize()) = t0 + arch_callsize();
                arch_xtstore(tos, t0);
                tos = t0;
                NEXT;
                
                PRIM(ENDTICK);
                RETURN(0);
                NEXT;
                
                PRIM(BYE);
                RETURN(1);
                NEXT;
                
                PRIM(CALL0);
                CALLSAVE;
                t1 = ((UCELL(*)())tos)();
                CALLREST;
                tos = t1;
                NEXT;
                
                PRIM(CALL1);
                CALLSAVE;
                t1 = ((UCELL(*)(CELL))tos)(dsp[0]);
                CALLREST;
                tos = t1;
                dsp++;
                NEXT;
                
                PRIM(CALL2);
                CALLSAVE;
                t1 = ((UCELL(*)(CELL,CELL))tos)(dsp[0], dsp[1]);
                CALLREST;
                tos = t1;
                dsp += 2;
                NEXT;
                
                PRIM(CALL3);
                CALLSAVE;
                t1 = ((UCELL(*)(CELL,CELL,CELL))tos)(dsp[0], dsp[1], dsp[2]);
                CALLREST;
                tos = t1;
                dsp += 3;
                NEXT;
                
                PRIM(CALL4);
                CALLSAVE;
                t1 = ((UCELL(*)(CELL,CELL,CELL,CELL))tos)(dsp[0], dsp[1], dsp[2], dsp[3]);
                CALLREST;
                tos = t1;
                dsp += 4;
                NEXT;
                
                PRIM(ISAMEQ);
                CALLSAVE;
                t1 = nInsensitiveCompare(dsp[0], dsp[1], tos);
                CALLREST;
                tos = t1;
                dsp += 2;
                NEXT;

                PRIM(SAMEQ);
                CALLSAVE;
                t1 = nCompare(dsp[0], dsp[1], tos);
                CALLREST;
                tos = t1;
                dsp += 2;
                NEXT;


                PRIM(RFETCH);
                PUSH;
                tos = *rsp;
                NEXT;

                PRIM(XTEND);
                t0 = sizeof(tab) / sizeof(CELL);
                while (t0--)
                        if (tos == (CELL)tab[t0])
                                tos = (CELL)tab[t0+1];
                NEXT;

                PRIM(MS);
                CALLSAVE;
                Sys_Sleep(tos);
                CALLREST;
                POP;
                NEXT;
                
                PRIM(TIMEANDDATE);
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
                dsp[4] = t2;
                dsp[3] = t3;
                dsp[2] = t4;
                dsp[1] = t5;
                dsp[0] = t6;
                tos = t7;
                NEXT;

                PRIM(ARGC);
                PUSH;
                CALLSAVE;
                t1 = Sys_Argc();
                CALLREST;
                tos = t1;
                NEXT;

