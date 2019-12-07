ARCH_x86_64=x64
ARCH_amd64=x64
ARCH_ppc=powerpc
ARCH_i686=i386
ARCH_sgimips=mips
ARCH:=$(ARCH_$(shell uname -m))
OS=$(shell uname -s)
CC=gcc
LD=gcc
PREFIX=inst
ASMCALL_x64='nop;nop;nop;call'
ASMCALL_arm='bl'
ASMCALL_i386='nop;nop;nop;call'
ASMCALL_mips='bal'
ASMCALL_powerpc='bl'
ASMCELL_x64='.quad'
ASMCELL_arm='.long'
ASMCELL_i386='.long'
ASMCELL_mips='.long'
ASMCELL_powerpc='.long'
ASMALIGN_x64='.p2align 3'
ASMALIGN_arm='.balign 4'
ASMALIGN_i386='.p2align 2'
ASMALIGN_mips='.balign 4'
ASMALIGN_powerpc='.align 2'
FFIARCH_x64=X86
FFIARCH_i386=X86
FFIARCH_powerpc=POWERPC
FFIARCH_mips=MIPS
FFIARCH_arm=ARM
FFIARCH=$(FFIARCH_$(ARCH))
FFIOS_Darwin=_DARWIN
FFIOS_NetBSD=_FREEBSD
FFIOS_FreeBSD=_FREEBSD
FFIOS_OpenBSD=_FREEBSD
FFIOS_DragonFly=_FREEBSD
FFIOS_Linux=
FFIOS=$(FFIOS_$(OS))
FFIPLAT_Darwin_x64=libs/libffi/src/x86/ffi64.c libs/libffi/src/x86/darwin64.S
FFIPLAT_Linux_x64=libs/libffi/src/x86/ffi64.c libs/libffi/src/x86/unix64.S
FFIPLAT_Linux_i386=libs/libffi/src/x86/ffi.c libs/libffi/src/x86/sysv.S
FFIPLAT_Linux_powerpc=libs/libffi/src/powerpc/ffi.c libs/libffi/src/powerpc/sysv.S libs/libffi/src/powerpc/ppc_closure.S
FFIPLAT_Linux_mips=libs/libffi/src/mips/ffi.c libs/libffi/src/mips/o32.S
FFIPLAT_Linux_arm=libs/libffi/src/arm/ffi.c libs/libffi/src/arm/sysv.S
FFIPLAT_FreeBSD_x64=libs/libffi/src/x86/ffi64.c libs/libffi/src/x86/unix64.S
FFIPLAT_FreeBSD_i386=libs/libffi/src/x86/ffi.c libs/libffi/src/x86/freebsd.S
FFIPLAT_OpenBSD_x64=libs/libffi/src/x86/ffi64.c libs/libffi/src/x86/unix64.S
FFIPLAT_OpenBSD_i386=libs/libffi/src/x86/ffi.c libs/libffi/src/x86/freebsd.S
FFIPLAT_NetBSD_x64=libs/libffi/src/x86/ffi64.c libs/libffi/src/x86/unix64.S
FFIPLAT_NetBSD_i386=libs/libffi/src/x86/ffi.c libs/libffi/src/x86/freebsd.S
FFIPLAT_DragonFly_x64=libs/libffi/src/x86/ffi64.c libs/libffi/src/x86/unix64.S
CFLAGS+=-Ofast -fomit-frame-pointer -fno-reorder-blocks -freorder-blocks-algorithm=simple
CPPFLAGS+=-Iobj -Ilibs/libffi -Ilibs/libffi/include -DASMCALL=$(ASMCALL_$(ARCH)) -DASMCELL=$(ASMCELL_$(ARCH)) -DASMALIGN=$(ASMALIGN_$(ARCH)) -DBUILD_FILES=1 -DBUILD_ALLOCATE=1 -DBUILD_FIXED=1 -DBUILD_FFI=1 -DBUILD_MOREPRIMS=1 -DBUILD_PROFILE=0 -DX86_64 -DTARGET=$(FFIARCH)$(FFIOS) -D$(FFIARCH)$(FFIOS)=1 -DHAVE_LONG_DOUBLE=1
LDFLAGS+=-Wl,-no_pie

IFILES=kernel/allocate.i kernel/files.i kernel/moreprims.i	\
kernel/ffi.i kernel/fixed.i kernel/prims.i

BOOT=sys/core.fs sys/defer.fs sys/core2.fs sys/throwmsg.fs	\
sys/based.fs sys/source.fs sys/search.fs sys/coreext.fs

FULL=sys/core.fs sys/defer.fs sys/core2.fs sys/throwmsg.fs		\
sys/based.fs sys/source.fs sys/signals.fs sys/search.fs			\
sys/coreext.fs sys/searchext.fs sys/module.fs sys/cstr.fs sys/file.fs	\
sys/fileext.fs sys/double.fs sys/doubleext.fs sys/optional.fs		\
sys/string.fs sys/require.fs sys/tools.fs sys/toolsext.fs		\
sys/facility.fs sys/facilityext.fs sys/lineedit.fs sys/assert.fs	\
sys/multi.fs sys/osnice.fs sys/args.fs sys/save.fs sys/ffi.fs		\
sys/c.fs sys/backtrace.fs sys/pipe.fs sys/instinclude.fs sys/help.fs

KERNELTESTS=sys/core.fs sys/defer.fs sys/core2.fs test/tester.fs	\
test/core.fs test/postpone.fs test/bye.fs

TESTS=test/tester.fs test/core.fs test/postpone.fs test/double.fs	\
test/double2.fs test/file.fs test/filehandler.fs test/pipehandler.fs	\
test/tcphandler.fs test/fina.fs test/multi.fs test/module.fs		\
test/struct.fs test/ffi.fs test/bye.fs

ALLTESTS= test/aw.fs test/double2.fs test/fina.fs test/pipehandler.fs	\
test/tcphandler.fs test/wrongeval.fs test/bye.fs test/error.fs		\
test/gl.fs test/postpone.fs test/tester.fs test/wronginclude.fs		\
test/checkans.fs test/ffi.fs test/module.fs test/right.fs		\
test/wordsets.fs test/core.fs test/file.fs test/multi.fs		\
test/rightinclude.fs test/wrong.fs test/double.fs test/filehandler.fs	\
test/pboof.fs test/struct.fs test/wrongafterinclude.fs

ALLBENCHMARKS=benchmarks/bubble-sort.fs benchmarks/fib.fs	\
benchmarks/sieve.fs

ALLFORTH=ans-report.fs answords.fs aw.fs bnf.fs cce.fs ce.fs		\
filehandler.fs fixed.fs gdbdis.fs gl.fs glhelpers.fs glu.fs gtk.fs	\
handler.fs later.fs list.fs machtimer.fs measure.fs memory.fs ns.fs	\
nstimer.fs pboof.fs pipehandler.fs prof.fs saveaux.fs sh.fs socket.fs	\
struct.fs sudoku.fs tcphandler.fs ticker.fs timer.fs tt.fs under.fs	\
units.fs ustimer.fs verboseinc.fs sys/args.fs sys/assert.fs		\
sys/backtrace.fs sys/based.fs sys/c.fs sys/core.fs sys/core2.fs		\
sys/coreext.fs sys/cstr.fs sys/defer.fs sys/double.fs			\
sys/doubleext.fs sys/facility.fs sys/facilityext.fs sys/ffi.fs		\
sys/file.fs sys/fileext.fs sys/help.fs sys/instinclude.fs		\
sys/lineedit.fs sys/module.fs sys/multi.fs sys/optional.fs		\
sys/osnice.fs sys/pipe.fs sys/require.fs sys/save.fs sys/savefina.fs	\
sys/search.fs sys/searchext.fs sys/signals.fs sys/source.fs		\
sys/string.fs sys/throwmsg.fs sys/tools.fs sys/toolsext.fs		\
meta/arm-tconfig.fs meta/fina.fs meta/host-fina.fs			\
meta/i386-tconfig.fs meta/meta.fs meta/mips-tconfig.fs			\
meta/powerpc-tconfig.fs meta/tconfig.fs meta/x64-tconfig.fs

ALLHELP=$(addprefix obj/, $(ALLFORTH:.fs=.help))
ANSHELP=help/ansblock.help help/ansexception.help		\
help/ansfloating.help help/anssearch.help help/anscore.help	\
help/ansfacility.help help/anslocals.help help/ansstring.help	\
help/ansdouble.help help/ansfile.help help/ansmemory.help	\
help/anstools.help

BENCHMARKS=benchmarks/bubble-sort.fs benchmarks/fib.fs	\
benchmarks/sieve.fs

META=meta/$(ARCH)-tconfig.fs meta/tconfig.fs meta/host-fina.fs	\
meta/meta.fs meta/fina.fs

FFISRCS= libs/libffi/src/debug.c libs/libffi/src/prep_cif.c	\
libs/libffi/src/types.c libs/libffi/src/closures.c		\
$(FFIPLAT_$(OS)_$(ARCH))

all: obj/fina

obj/arch.h: kernel/$(ARCH)-arch.h
	install -d obj
	install $^ $@

obj/%tab.it: kernel/%.i
	cat $^ | python gentab.py > $@

obj/finac.S: kernel/finac.c obj/arch.h $(patsubst kernel/%.i,obj/%tab.it,$(IFILES))
	$(CC) -S -MMD -MT $@ -MF $@.dep $(CPPFLAGS) $(CFLAGS) $< -o $@

obj/dict1.S: obj/kernel0 $(BOOT) $(META)
	cat $(BOOT) $(META) | obj/kernel0 > $@

obj/dict2.S: obj/kernel1 $(BOOT) $(META)
	cat $(BOOT) $(META) | obj/kernel1 > $@

obj/kernel0.S: obj/finac.S kernel/dict0.S
	cat $^ > $@

obj/kernel1.S: obj/finac.S obj/dict1.S
	cat $^ > $@

obj/kernel2.S: obj/finac.S obj/dict2.S
	cat $^ > $@

kerneltest%: obj/kernel%
	cat $(KERNELTESTS) | $<

obj/kernel%: obj/kernel%.o kernel/main.c kernel/sysposix.c $(FFISRCS)
	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $^ -o $@

obj/build.fs: $(FULL) saveaux.fs
	cat $(FULL) > $@
	printf ': buildstr s" %s" ;\n' `git rev-parse HEAD|cut -c1-8` >> $@
	cat sys/savefina.fs saveaux.fs >> $@

obj/fina: obj/kernel2 $(FULL) sys/savefina.fs saveaux.fs
	(cat $(FULL) && printf ': buildstr s" %s" ;\n' `git rev-parse HEAD|cut -c1-8` && cat sys/savefina.fs saveaux.fs) | obj/kernel2
	chmod 755 $@

tests: obj/fina $(TESTS)
	$^

bench: obj/fina $(ALLBENCHMARKS)
	for b in $(ALLBENCHMARKS) ; do time $< $$b -e "main bye" ; done

obj/%.help: %.fs obj/fina help/glosgen.fs
	install -d `dirname $@`
	obj/fina help/glosgen.fs -e "newglos makeglos $< writeglos $@ bye"

obj/toc.help: obj/fina $(ALLHELP)
	echo $(ALLHELP)
	$< help/maketoc.fs -e "toc{ $(ALLHELP) }toc bye" > $@

install: obj/fina $(ALLFORTH) $(ALLTESTS) $(ALLBENCHMARKS) obj/toc.help $(ALLHELP) $(ANSHELP)
	install obj/fina $(PREFIX)/bin/fina
	install $(ALLFORTH) $(PREFIX)/share/
	install $(ALLTESTS) $(PREFIX)/share/fina/test
	install $(ALLBENCHMARKS) $(PREFIX)/share/fina/benchmarks
	install obj/toc.help $(ALLHELP) $(ANSHELP) $(PREFIX)/share/fina/help
	install README AUTHORS LICENSE $(PREFIX)/share/doc/fina
	install ffl/html/*.html $(PREFIX)/share/doc/fina/ffl/html

clean:
	rm -fR obj
