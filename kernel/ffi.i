
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
		CELL ret[2];
		ffi_type * rtype = ((ffi_cif*)tos)->rtype;
		int n = ((ffi_cif*)tos)->nargs;
		t0 = *dsp++;
		while(n--) { 
			ffi_type * type = ((ffi_cif*)tos)->arg_types[n];
			arg[n] = (void*)(dsp); 
			dsp++;
			dsp += type == &ffi_type_double 
				|| type == &ffi_type_uint64;
		}
		CALLSAVE;
		ffi_call((ffi_cif*)tos, FFI_FN(t0), ret, arg);
		CALLREST;
		if (rtype != &ffi_type_void) 
			tos = ret[0];
		else
			tos = *dsp++;
		if (rtype == &ffi_type_uint64 || rtype == &ffi_type_double) {
			*--dsp = tos;
			tos = ret[1];
		}
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

        PRIM(FFINTSIXFOUR, 1006);
        PUSH;
        tos = (CELL)&ffi_type_uint64;
        NEXT;

        PRIM(FFDOUBLE, 1007);
        PUSH;
        tos = (CELL)&ffi_type_double;
        NEXT;

        PRIM(DLOPEN, 1100);
        CALLSAVE;
        t1 = (CELL)dlopen(zstr(str1, (char*)dsp[0], tos), 
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
        t1 = (CELL)dlsym((void*)tos, zstr(str1, (char*)dsp[1], dsp[0]));
        CALLREST;
        tos = t1;
        dsp += 2;
        NEXT;
