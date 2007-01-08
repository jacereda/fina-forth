
#if defined(HAS_FILES)
                PRIM(OPENF, 200);
                CALLSAVE;
                t1 = (CELL)Sys_FileOpen(zstr((char*)dsp[1], dsp[0]), tos);
                t2 = Sys_Throw();
                CALLREST;
                *++dsp = t1;
                tos = t2;
                NEXT;

                PRIM(CLOSEF, 201);
                CALLSAVE;
                Sys_FileClose((void*)tos);
                t1 = Sys_Throw();
                CALLREST;
                tos = t1;
                NEXT;

                PRIM(READF, 202);
                CALLSAVE;
                t1 = Sys_FileRead((void*)tos, (char*)dsp[1], dsp[0]);
                t2 = Sys_Throw();
                CALLREST;
                *++dsp = t1;
                tos = t2;
                NEXT;
                
                PRIM(WRITEF, 203);
                CALLSAVE;
                Sys_FileWrite((void*)tos, (char*)dsp[1], dsp[0]);
                t1 = Sys_Throw();
                CALLREST;
                tos = t1;
                dsp += 2;
                NEXT;

                PRIM(MMAPF, 204);
                CALLSAVE;
                t1 = (CELL)Sys_FileMMap((void*)tos);
                t2 = Sys_Throw();
                CALLREST;
                tos = t1;
                PUSH;
                tos = t2;
                NEXT;

                PRIM(SEEKF, 205);
                t0 = tos;
                POP;
                POPULL;
                CALLSAVE;
                Sys_FileSeek((void*)t0, ull);
                t1 = Sys_Throw();
                CALLREST;
                PUSH;
                tos = t1;
                NEXT;
                
                PRIM(SIZEF, 206);
                t0 = tos;
                POP;
                CALLSAVE;
                ull = Sys_FileSize((void*)t0);
                t1 = Sys_Throw();
                CALLREST;
                PUSHULL;
                PUSH;
                tos = t1;
                NEXT;

                PRIM(TELLF, 207);
                CALLSAVE;
                ull = Sys_FileTell((void*)tos);
                t1 = Sys_Throw();
                CALLREST;
                POP;
                PUSHULL;
                PUSH;
                tos = t1;
                NEXT;
                        
                PRIM(LINEF, 208);
                t3 = dsp[1];
                t4 = dsp[0];
                CALLSAVE;
                { 
                    char buf[1024];
                    t1 = Sys_FileLine(tos, buf, t4+1);
                    t2 = Sys_Throw();
                    Sys_MemMove(t3, buf, t4);
                }
                CALLREST;
                dsp[1] = t1;
                tos = t2;
                dsp[0] = FLAG(tos != -39);
                tos = tos == -39? 0 : tos;
                NEXT;

                PRIM(DELETEF, 209);
                CALLSAVE;
                Sys_FileDelete(zstr((char*)*dsp, tos));
                t1 = Sys_Throw();
                CALLREST;
                dsp++;
                tos = t1;
                NEXT;

                PRIM(STATF, 210);
                CALLSAVE;
                t1 = Sys_FileStat(zstr((char*)dsp[0], tos));
                t2 = Sys_Throw();
                CALLREST;
                dsp[0] = t1;
                tos = t2;
                NEXT;

                PRIM(RENF, 211);
                CALLSAVE;
                t1 = (CELL)zstr2((char*)dsp[0], tos);
                Sys_FileRen(zstr((char*)dsp[2], dsp[1]), (char*)t1);
                t1 = Sys_Throw();
                CALLREST;
                tos = t1;
                dsp += 3;
                NEXT;

                PRIM(TRUNCF, 212);
                t0 = tos;
                POP;
                POPULL;
                PUSH;
                CALLSAVE;
                Sys_FileTrunc((void*)t0, ull);
                t1 = Sys_Throw();
                CALLREST;
                tos = t1;
                NEXT;

                PRIM(FLUSHF, 213);
                CALLSAVE;
                Sys_FileFlush((void*)tos);
                t1 = Sys_Throw();
                CALLREST;
                tos = t1;
                NEXT;
                
#endif  // HASFILES

