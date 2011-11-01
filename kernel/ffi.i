
        PRIM(FFPREP);
        // types rtype nargs cif -- status
        CALLSAVE;
        t1 = ffi_prep_cif((ffi_cif*)tos, FFI_DEFAULT_ABI, 
                           dsp[0], (ffi_type*)dsp[1], (ffi_type**)dsp[2]);
        CALLREST;
        tos = t1;
        dsp += 3;
        NEXT;
        
        PRIM(FFCALL);
        // ... func cif -- 
        {
		void * arg[16];
		double darg[16];
		float farg[16];
		CELL ret[2];
		ffi_cif * cif = (ffi_cif*)tos;
		ffi_type * rtype = cif->rtype;
		int n = cif->nargs;
		t0 = *dsp++;
		void * parg;
		while(n--) { 
			ffi_type * type = cif->arg_types[n];
			if (type == &ffi_type_double) {
				darg[n] = (*(int*)dsp) / (double)FXSCALE;
				parg = darg+n;
				dsp++;
			} else if (type == &ffi_type_float) {
				farg[n] = (*(int*)dsp) / (float)FXSCALE;
				parg = farg+n;
				dsp++;
			} else if (type == &ffi_type_uint64) {
				parg = dsp;
				dsp += 2;
			}
			else
				parg = dsp++;
			arg[n] = parg; 
		}
		CALLSAVE;
		ffi_call(cif, FFI_FN(t0), ret, arg);
		CALLREST;
		if (rtype == &ffi_type_float)
			tos = FXSCALE * *(float*)ret;
		else if (rtype == &ffi_type_double)
			tos = FXSCALE * *(double*)ret;
		else if (rtype == &ffi_type_uint64)
			*--dsp = ret[0], tos = ret[1];
		else if (rtype != &ffi_type_void) 
			tos = ret[0];
		else
			tos = *dsp++;
        }
        NEXT;

        PRIM(FFVOID);
        PUSH;
        tos = (CELL)&ffi_type_void;
        NEXT;

        PRIM(FFINT);
        PUSH;
        tos = (CELL)&ffi_type_uint;
        NEXT;

        PRIM(FFFLOAT);
        PUSH;
        tos = (CELL)&ffi_type_float;
        NEXT;

        PRIM(FFPTR);
        PUSH;
        tos = (CELL)&ffi_type_pointer;
        NEXT;

        PRIM(FFINTSIXFOUR);
        PUSH;
        tos = (CELL)&ffi_type_uint64;
        NEXT;

        PRIM(FFDOUBLE);
        PUSH;
        tos = (CELL)&ffi_type_double;
        NEXT;

        PRIM(FFCLOS);
        // xt cif clos -- status
        CALLSAVE;
        t1 = ffi_prep_closure((ffi_closure*)tos, (ffi_cif*)dsp[0],
                              closure, (void*)dsp[1]);
        CALLREST;
        tos = t1;
        dsp += 2;
        NEXT;

        PRIM(DLOPEN);
        CALLSAVE;
        t1 = (CELL)dlopen(zstr(str1, (char*)dsp[0], tos), 
#if defined(__NetBSD__) || defined(_WIN32)
	DL_LAZY
#else
	RTLD_GLOBAL|RTLD_NOW
#endif
	);
        CALLREST;
        tos = t1;
        dsp++;
        NEXT;
        
        PRIM(DLSYM);
        CALLSAVE;
        t1 = (CELL)dlsym((void*)tos, zstr(str1, (char*)dsp[1], dsp[0]));
        CALLREST;
        tos = t1;
        dsp += 2;
        NEXT;
