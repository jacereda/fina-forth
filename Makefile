CPU?=$(shell uname -m)
QEMU?=qemu-$(CPU)
EXE?=
OS?=$(shell uname -s)
CC?=gcc
CPP?=$(CC)
PREFIX=inst
LTO?=-flto
DCE?=-ffunction-sections -fdata-sections
OPT?=-O2 -g
CFLAGS+=$(OPT) -std=gnu11 -fomit-frame-pointer -fvisibility=hidden -fno-stack-check -fno-stack-protector $(LTO) $(DCE)
PROF?=0
MOREPRIMS?=1
ALLOCATE?=1
FFI?=1
FEATURES=-DBUILD_FILES=1 -DBUILD_ALLOCATE=$(ALLOCATE) -DBUILD_FIXED=1 -DBUILD_PIPE=1 -DBUILD_FFI=$(FFI) -DBUILD_MOREPRIMS=$(MOREPRIMS) -DBUILD_PROFILE=$(PROF)
INCPATHS=-Ikernel -Iobj
CPPFLAGS+=$(INCPATHS) -DPOSIX_C_SOURCE=2 -DHAVE_LONG_DOUBLE=1 -DNDEBUG $(CPPFLAGS_$(OS)) $(FEATURES)
ASPPFLAGS+=$(INCPATHS) $(FEATURES)
LDFLAGS_Darwin=-Wl,-dead_strip -segprot __DATA rwx rwx
LDFLAGS_Linux=-Wl,-gc-sections -ldl
LDFLAGS_FreeBSD=-Wl,-gc-sections
LDFLAGS_OpenBSD=-Wl,-gc-sections
LDFLAGS_NetBSD=-Wl,-gc-sections
LDFLAGS_DragonFly=-Wl,-gc-sections
LDFLAGS_Cosmo=-Wl,-gc-sections
LDFLAGS_FFI1=-lffi
LDFLAGS+=$(LDFLAGS_$(OS)) -no-pie $(LDFLAGS_FFI$(FFI))



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

PURETESTS=test/tester.fs test/core.fs test/postpone.fs test/double.fs	\
test/double2.fs test/file.fs test/filehandler.fs test/pipehandler.fs	\
test/fina.fs test/multi.fs test/module.fs test/struct.fs test/ffi.fs

TESTS= $(PURETESTS) test/tcphandler.fs test/udphandler.fs

ALLTESTS= test/aw.fs test/double2.fs test/fina.fs test/pipehandler.fs	\
test/tcphandler.fs test/udphandler.fs test/wrongeval.fs test/bye.fs	\
test/error.fs test/gl.fs test/postpone.fs test/tester.fs		\
test/wronginclude.fs test/checkans.fs test/ffi.fs test/module.fs	\
test/right.fs test/wordsets.fs test/core.fs test/file.fs		\
test/multi.fs test/rightinclude.fs test/wrong.fs test/double.fs		\
test/filehandler.fs test/struct.fs test/wrongafterinclude.fs

ALLBENCHMARKS=benchmarks/bubble-sort.fs benchmarks/fib.fs	\
benchmarks/sieve.fs

ALLFORTH=ans-report.fs answords.fs aw.fs bnf.fs cce.fs ce.fs		\
filehandler.fs fixed.fs gdbdis.fs gl.fs glhelpers.fs glu.fs gtk.fs	\
handler.fs later.fs list.fs measure.fs memory.fs ns.fs pipehandler.fs	\
prof.fs sh.fs socket.fs struct.fs sudoku.fs tcphandler.fs	\
udphandler.fs ticker.fs tt.fs units.fs verboseinc.fs sys/args.fs	\
sys/assert.fs sys/backtrace.fs sys/based.fs sys/c.fs sys/core.fs	\
sys/core2.fs sys/coreext.fs sys/cstr.fs sys/defer.fs sys/double.fs	\
sys/doubleext.fs sys/facility.fs sys/facilityext.fs sys/ffi.fs		\
sys/file.fs sys/fileext.fs sys/help.fs sys/instinclude.fs		\
sys/lineedit.fs sys/module.fs sys/multi.fs sys/optional.fs		\
sys/osnice.fs sys/pipe.fs sys/require.fs sys/save.fs sys/savefina.fs	\
sys/search.fs sys/searchext.fs sys/signals.fs sys/source.fs		\
sys/string.fs sys/throwmsg.fs sys/tools.fs sys/toolsext.fs		\
meta/arm-tconfig.fs meta/fina.fs meta/host-fina.fs			\
meta/i686-tconfig.fs meta/meta.fs meta/mips-tconfig.fs			\
meta/powerpc-tconfig.fs meta/tconfig.fs meta/x86_64-tconfig.fs

ALLHELP=$(addprefix obj/, $(ALLFORTH:.fs=.help))
ANSHELP=help/ansblock.help help/ansexception.help		\
help/ansfloating.help help/anssearch.help help/anscore.help	\
help/ansfacility.help help/anslocals.help help/ansstring.help	\
help/ansdouble.help help/ansfile.help help/ansmemory.help	\
help/anstools.help

BENCHMARKS=benchmarks/bubble-sort.fs benchmarks/fib.fs	\
benchmarks/sieve.fs

META=meta/$(CPU)-tconfig.fs meta/tconfig.fs meta/host-fina.fs	\
meta/meta.fs meta/fina.fs

KERNELSRCS=kernel/main.c kernel/sysposix.c

KERNELOBJS = \
  $(patsubst %.c,obj/%.o,$(filter %.c,$(KERNELSRCS))) \
  $(patsubst %.S,obj/%.o,$(filter %.S,$(KERNELSRCS)))

all: obj/fina$(EXE)

obj/%tab.it: kernel/%.i
	install -d `dirname $@`
	cat $^ | python gentab.py > $@

obj/dict0.S: kernel/dict0.S $(patsubst kernel/%.i,obj/%tab.it,$(IFILES))
	cp $< $@

obj/dict1.S: obj/kernel0$(EXE) $(BOOT) $(META)
	cat $(BOOT) $(META) | $(QEMU) obj/kernel0$(EXE) > $@

obj/dict2.S: obj/kernel1$(EXE) $(BOOT) $(META)
	cat $(BOOT) $(META) | $(QEMU) obj/kernel1$(EXE) > $@

obj/dict-$(CPU)-%.i: obj/dict%.S
	$(CPP) -D__$(CPU)__ -E $(CPPFLAGS) $< -o - | sed 's/\\/\\\\/g; s/"/\\"/g; s/^/"/; s/$$/\\n"/' > $@

obj/dict-aarch64-%.i: obj/dict%.S
	$(CPP) -D__aarch64__ -E $(CPPFLAGS) $< -o - | sed 's/\\/\\\\/g; s/"/\\"/g; s/^/"/; s/$$/\\n"/' > $@

bootstrap: obj/dict2.S
	cp $< kernel/dict0.S

kerneltest%: obj/kernel%
	cat $(KERNELTESTS) | $<

kernel/finac.c: $(patsubst kernel/%.i,obj/%tab.it,$(IFILES))

obj/finac%.o: kernel/finac.c obj/dict%.i obj/dict-$(CPU)-%.i  obj/dict-aarch64-%.i
	$(CC) -c -DSTAGE=$* $(CPPFLAGS) $(CFLAGS) $< $(LDFLAGS) -o $@

obj/dict%.i:
	echo "#include \"dict-$(CPU)-$*.i\"" > $@

obj/kernel%$(EXE): obj/finac%.o $(KERNELOBJS)
	$(CC) -DSTAGE=$* $(CPPFLAGS) $(CFLAGS) $^ $(LDFLAGS) -o $@

obj/saveaux.fs:
	echo warnings on 'save"' obj/fina$(EXE)'"' bye > $@

obj/build.fs: $(FULL) obj/saveaux.fs
	cat $(FULL) > $@
	printf ': buildstr s" %s" ;\n' `git rev-parse HEAD|cut -c1-8` >> $@
	cat sys/savefina.fs obj/saveaux.fs >> $@

obj/fina$(EXE): obj/kernel2$(EXE) $(FULL) sys/savefina.fs obj/saveaux.fs
	(cat $(FULL) && printf ': buildstr s" %s" ;\n' `git rev-parse HEAD|cut -c1-8` && cat sys/savefina.fs obj/saveaux.fs) | $(QEMU) obj/kernel2$(EXE)
	chmod 755 $@

obj/%.o: %.S
	mkdir -p $(dir $@)
	$(CC) $(ASPPFLAGS) -c $< -o $@

obj/%.o: obj/%.S
	mkdir -p $(dir $@)
	$(CC) $(ASPPFLAGS) -c $< -o $@

obj/%.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

tests: obj/fina$(EXE) $(TESTS)
	$(QEMU) $^

puretests: obj/fina$(EXE) $(PURETESTS) test/bye.fs
	$(QEMU) $^

check:
	echo TESTING | $(MAKE) puretests

bench: obj/fina$(EXE) $(ALLBENCHMARKS)
	for b in $(ALLBENCHMARKS) ; do time $< $$b -e "main bye" ; done

obj/%.help: %.fs obj/fina$(EXE) help/glosgen.fs
	install -d `dirname $@`
	$(QEMU) obj/fina$(EXE) help/glosgen.fs -e "newglos makeglos $< writeglos $@ bye"

obj/toc.help: obj/fina$(EXE) $(ALLHELP)
	echo $(ALLHELP)
	$(QEMU) $< help/maketoc.fs -e "toc{ $(ALLHELP) }toc bye" > $@

install: obj/fina$(EXE) $(ALLFORTH) $(ALLTESTS) $(ALLBENCHMARKS) obj/toc.help $(ALLHELP) $(ANSHELP)
	install -d $(PREFIX)/bin
	install obj/fina$(EXE) $(PREFIX)/bin/fina$(EXE)
	install -d $(PREFIX)/share/fina/test
	install $(ALLFORTH) $(PREFIX)/share/fina
	install $(ALLTESTS) $(PREFIX)/share/fina/test
	install -d $(PREFIX)/share/fina/benchmarks
	install $(ALLBENCHMARKS) $(PREFIX)/share/fina/benchmarks
	install -d $(PREFIX)/share/fina/help
	install obj/toc.help $(ALLHELP) $(ANSHELP) $(PREFIX)/share/fina/help
	install -d $(PREFIX)/share/doc/fina
	install README.md AUTHORS LICENSE $(PREFIX)/share/doc/fina
	install -d $(PREFIX)/share/fina/ffl
	install ffl/ffl/*.fs $(PREFIX)/share/fina/ffl/
	install ffl/engines/fina/config.fs $(PREFIX)/share/fina/ffl/
	install ffl/test/*.fs $(PREFIX)/share/fina/test/
	install ffl/test/*.xml $(PREFIX)/share/fina/test/
	install ffl/test/*.mo $(PREFIX)/share/fina/test/
	install ffl/test/*.gz $(PREFIX)/share/fina/test/
	install -d $(PREFIX)/share/doc/fina/ffl/html
	install ffl/html/*.html $(PREFIX)/share/doc/fina/ffl/html

clean:
	rm -fR obj
