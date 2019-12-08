
                PRIM(ALLOCATE);
                CALLSAVE;
                t1 = (CELL)Sys_MemAllocate(tos);
                t2 = Sys_Throw();
                CALLREST;
                tos = t1;
                PUSH;
                tos = t2;
                NEXT;

                PRIM(FREE);
                CALLSAVE;
                Sys_MemFree((void*)tos); 
                CALLREST;
                tos = 0;
                NEXT;

                PRIM(RESIZE);
                CALLSAVE;
                t1 = (CELL)Sys_MemResize((void*)dsp[0], tos);
                t2 = Sys_Throw();
                CALLREST;
                dsp[0] = t1;
                tos = t2;
                NEXT;
