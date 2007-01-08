
        PRIM(FFPREP, 1000);
        // types rtype nargs cif -- status
        CALLSAVE;
        t1 = ffi_prep_cif((ffi_cif*)tos, FFI_DEFAULT_ABI, 
                           dsp[0], (ffi_type*)dsp[1], (ffi_type**)dsp[2]);
        CALLREST;
        tos = t1;
        dsp += 3;
        NEXT;
        
        PRIM(FFCALL, 1001);
        // ... func cif -- 
        {
        void * arg[16];
        int n = ((ffi_cif*)tos)->nargs;
        t0 = *dsp++;
        while(n--) { arg[n] = (void*)(dsp++); }
        CALLSAVE;
        ffi_call((ffi_cif*)tos, FFI_FN(t0), &t1, arg);
        CALLREST;
        if (((ffi_cif*)tos)->rtype != &ffi_type_void) 
                tos = t1;
        else
                tos = *dsp++;
        }
        NEXT;

        PRIM(FFVOID, 1002);
        PUSH;
        tos = (CELL)&ffi_type_void;
        NEXT;

        PRIM(FFINT, 1003);
        PUSH;
        tos = (CELL)&ffi_type_uint;
        NEXT;

        PRIM(FFFLOAT, 1004);
        PUSH;
        tos = (CELL)&ffi_type_float;
        NEXT;

        PRIM(FFPTR, 1005);
        PUSH;
        tos = (CELL)&ffi_type_pointer;
        NEXT;


        PRIM(DLOPEN, 1100);
        CALLSAVE;
        t1 = (CELL)dlopen(zstr((char*)dsp[0], tos), 
#if defined(__NetBSD__)
	DL_LAZY
#else
	RTLD_GLOBAL|RTLD_NOW
#endif
	);
        CALLREST;
        tos = t1;
        dsp++;
        NEXT;
        
        PRIM(DLSYM, 1101);
        CALLSAVE;
        t1 = (CELL)dlsym((void*)tos, zstr((char*)dsp[1], dsp[0]));
        CALLREST;
        tos = t1;
        dsp += 2;
        NEXT;
