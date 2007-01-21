
                PRIM(ALLOCATE, 250);
                CALLSAVE;
                t1 = (CELL)Sys_MemAllocate(tos);
                t2 = Sys_Throw();
                CALLREST;
                tos = t1;
                PUSH;
                tos = t2;
                NEXT;

                PRIM(FREE, 251);
                CALLSAVE;
                t1 = Sys_MemFree((void*)tos);
                CALLREST;
                tos = t1;
                NEXT;

                PRIM(RESIZE, 252);
                CALLSAVE;
                t1 = (CELL)Sys_MemResize((void*)dsp[0], tos);
                t2 = Sys_Throw();
                CALLREST;
                dsp[0] = t1;
                tos = t2;
                NEXT;
