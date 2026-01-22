                PRIM(OPENF);
                CALLSAVE;
                t1 = (CELL)Sys_FileOpen(zstr(str1, (char*)dsp[1], dsp[0]), tos);
                t2 = Sys_Throw();
                CALLREST;
                *++dsp = t1;
                tos = t2;
                NEXT;

                PRIM(CLOSEF);
                CALLSAVE;
                Sys_FileClose((void*)tos);
                t1 = Sys_Throw();
                CALLREST;
                tos = t1;
                NEXT;

                PRIM(READF);
                CALLSAVE;
                t1 = Sys_FileRead((void*)tos, (char*)dsp[1], dsp[0]);
                t2 = Sys_Throw();
                CALLREST;
                *++dsp = t1;
                tos = t2 == -39? 0 : t2;
                NEXT;

                PRIM(WRITEF);
                CALLSAVE;
                Sys_FileWrite((void*)tos, (char*)dsp[1], dsp[0]);
                t1 = Sys_Throw();
                CALLREST;
                tos = t1;
                dsp += 2;
                NEXT;

                PRIM(MMAPF);
                CALLSAVE;
                t1 = (CELL)Sys_FileMMap((void*)tos);
                t2 = Sys_Throw();
                CALLREST;
                tos = t1;
                PUSH;
                tos = t2;
                NEXT;

                PRIM(SEEKF);
                t0 = tos;
                POP;
                POPDC;
                CALLSAVE;
                Sys_FileSeek((void*)t0, dc);
                t1 = Sys_Throw();
                CALLREST;
                PUSH;
                tos = t1;
                NEXT;

                PRIM(SIZEF);
                t0 = tos;
                POP;
                CALLSAVE;
                dc = Sys_FileSize((void*)t0);
                t1 = Sys_Throw();
                CALLREST;
                PUSHDC;
                PUSH;
                tos = t1;
                NEXT;

                PRIM(TELLF);
                CALLSAVE;
                dc = Sys_FileTell((void*)tos);
                t1 = Sys_Throw();
                CALLREST;
                POP;
                PUSHDC;
                PUSH;
                tos = t1;
                NEXT;

                PRIM(LINEF);
                CALLSAVE;
                t1 = Sys_FileLine((void*)tos, (char*)dsp[1], dsp[0]+1);
                t2 = Sys_Throw();
                CALLREST;
                dsp[1] = t1;
                tos = t2;
                dsp[0] = FLAG(t2 != -39);
                tos = tos == -39? 0 : tos;
                NEXT;

                PRIM(DELETEF);
                CALLSAVE;
                Sys_FileDelete(zstr(str1, (char*)*dsp, tos));
                t1 = Sys_Throw();
                CALLREST;
                dsp++;
                tos = t1;
                NEXT;

                PRIM(STATF);
                CALLSAVE;
                t1 = Sys_FileStat(zstr(str1, (char*)dsp[0], tos));
                t2 = Sys_Throw();
                CALLREST;
                dsp[0] = t1;
                tos = t2;
                NEXT;

                PRIM(RENF);
                CALLSAVE;
                t1 = (CELL)zstr(str1, (char*)dsp[0], tos);
                Sys_FileRen(zstr(str2, (char*)dsp[2], dsp[1]), (char*)t1);
                t1 = Sys_Throw();
                CALLREST;
                tos = t1;
                dsp += 3;
                NEXT;

                PRIM(TRUNCF);
                t0 = tos;
                POP;
                POPDC;
                PUSH;
                CALLSAVE;
                Sys_FileTrunc((void*)t0, dc);
                t1 = Sys_Throw();
                CALLREST;
                tos = t1;
                NEXT;

                PRIM(FLUSHF);
                CALLSAVE;
                Sys_FileFlush((void*)tos);
                t1 = Sys_Throw();
                CALLREST;
                tos = t1;
                NEXT;

                PRIM(POPEN)
                CALLSAVE;
                t1= (CELL)Sys_Popen((char *)dsp[0], (char*)tos);
                CALLREST;
                POP;
                tos = t1;
                NEXT;

                PRIM(PCLOSE)
                CALLSAVE;
                t1 = Sys_Pclose((void*)tos);
                CALLREST;
                tos = t1;
                NEXT;

                PRIM(SYSTEM)
                CALLSAVE;
                t1 = Sys_System((char*)tos);
                CALLREST;
                tos = t1;
                NEXT;

                PRIM(SOCKET)
                CALLSAVE;
                t1 = Sys_Socket(dsp[1], dsp[0], tos);
                CALLREST;
                dsp += 2;
                tos = t1;
                NEXT;

                PRIM(ZGETHOSTBYNAME)
                CALLSAVE;
                t1 = (CELL)Sys_GetHostByName((char*)tos);
                CALLREST;
                tos = t1;
                NEXT;

                PRIM(FDOPEN)
                CALLSAVE;
                t1 = (CELL)Sys_FDOpen(dsp[0], (char*)tos);
                CALLREST;
                dsp++;
                tos = t1;
                NEXT;

                PRIM(CONNECT);
                CALLSAVE;
                t1 = Sys_Connect(dsp[1], (void*)dsp[0], tos);
                CALLREST;
                dsp += 2;
                tos = t1;
                NEXT;
