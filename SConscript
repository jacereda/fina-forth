Import('env')
fenv = env.Clone()
fenv.Append(CPPDEFINES=['HAS_FILES', 'HAS_ALLOCATE', 'HAS_FIXED', 'HAS_FFI', 
			'MORE_PRIMS'])
fenv.Append(CPPPATH=[
	'obj',
	'libs/libffi/include',
	])
#fenv.Append(CPPDEFINES=[[ffiarch + ffios, 1]])
fenv.Append(LIBPATH=['.'])
fenv.Append(LIBS=['ffi'])

if fenv['OS'] == 'linux':
   fenv.Append(LIBS=['dl'])

for i in fenv.Glob('kernel/*.i'):
	fenv.Tab(fenv.Basename(i[:-2]) + 'tab.it', i)

fenv.Command('arch.h', 'kernel/$ARCH-arch.h', Copy('$TARGET', '${SOURCE.abspath}'))
fenv.Asm('finac.s', 'kernel/finac.c')

boot = ['sys/' + i for i in Split("""
   core.fs defer.fs core2.fs throwmsg.fs based.fs
   source.fs search.fs coreext.fs 
""")]

full = ['sys/' + i for i in Split("""
   core.fs defer.fs core2.fs throwmsg.fs 
   based.fs source.fs signals.fs
   search.fs coreext.fs searchext.fs module.fs
   cstr.fs file.fs fileext.fs double.fs doubleext.fs optional.fs
   string.fs require.fs tools.fs toolsext.fs
   facility.fs facilityext.fs lineedit.fs 
   assert.fs multi.fs
   osnice.fs args.fs save.fs ffi.fs c.fs pipe.fs
   instinclude.fs help.fs build.fs savefina.fs
""")]

kerneltests = ['sys/core.fs', 'sys/defer.fs', 'sys/core2.fs'] + \
	      ['test/' + i for i in Split("""
      	        tester.fs core.fs postpone.fs bye.fs
	       """)]

tests = ['test/' + i for i in Split("""
   tester.fs core.fs postpone.fs double.fs double2.fs file.fs
   filehandler.fs pipehandler.fs tcphandler.fs 
   fina.fs multi.fs module.fs struct.fs ffi.fs bye.fs
""")]

benchmarks = env.Glob('benchmarks/*.fs')

def gendict(arch, phase, kernel):
        meta =  ['meta/' + arch + '-tconfig.fs'] + \
                ['meta/' + i for i in Split("""
		   tconfig.fs host-fina.fs meta.fs fina.fs
	        """)]
	name = 'kernel/' + arch + '-dict' + str(phase)
	src = fenv.Cat(name + '.fs', boot + meta)
        fenv.Command('kernel/' + arch + '-dict' + str(phase) + '.s', 
		[kernel, src],
                '${SOURCES[0]} < ${SOURCES[1]} > $TARGET')

def genbaredict(arch, kernel):
        meta =  ['meta/' + arch + '-tconfig.fs'] + \
                ['meta/' + i for i in Split("""
		   tconfig-bare.fs host-fina.fs meta.fs fina.fs
	        """)]
	name = 'kernel/' + arch + '-baredict'
	src = fenv.Cat(name + '.fs', boot + meta)
        fenv.Default(fenv.Command(name + '.s', [kernel, src],
                '${SOURCES[0]} < ${SOURCES[1]} > $TARGET'))

architectures = ['powerpc', 'mips', 'i386', 'x64']
k = None

if fenv['OS'] == 'win32':
   ksys = 'nt'
else:  
   ksys = 'posix'

for phase in range(3):
        ks = fenv.Cat('kernel/kernel' + str(phase) + '.s', 
                ['finac.s', 'kernel/$ARCH-dict' + str(phase) + '.s'])

        k = fenv.Program('kernel' + str(phase), 
                        [ks, 'kernel/sys' + ksys + '.c', 'kernel/main.c'])
        if ARGUMENTS.get('test', 0):
                fenv.Default(fenv.Command('dummy' + str(phase), 
				[k] + kerneltests,
	                        'cat ${SOURCES[1:]} | $SOURCE'))
        for arch in architectures:
                gendict(arch, phase+1, k)

genbaredict('i386', k)

for arch in architectures:
        fenv.Default(fenv.Command(arch + 'dummy', 
                        'kernel/' + arch + '-dict2.s', 
                        Copy('kernel/' + arch + '-dict0.s', '$SOURCE')))
        

fenv.Command('sys/build.fs', [k] + full[:-2], 
	'echo ": buildstr s\\" ' + \
	fenv.OutputFrom('svnversion ' + str(Dir('#'))) + \
	'\\" ;" > $TARGET')
fsrc = fenv.Cat('finasrc.fs', full + ['save.fs'])
f = fenv.Command('fina', [k, fsrc],
	['$SOURCE < ${SOURCES[1]}', 'chmod 777 $TARGET'])

if ARGUMENTS.get('test', 0):
        fenv.Default(fenv.Command('testfina', [f] + tests, 
                '$SOURCE ${SOURCES[1:]}'))

allforth = env.Glob('*.fs') + env.Glob('sys/*.fs') + env.Glob('meta/*.fs')

anshelp = env.Glob('help/*.help')

allhelp = [env.Hlp(i.replace('.fs', '.help'), [i, f]) for i in allforth]
toc = env.Command('toc.help', [f] + allhelp, 
        '$SOURCE help/maketoc.fs -e "toc{ ${SOURCES[1:]} }toc bye" > $TARGET')


# Installation rules
prefix = str(Dir(ARGUMENTS.get('prefix', '#inst')))
if prefix[-1] != '/':
	prefix += '/'
env.Default(env.Install(prefix + 'bin', f))
env.Default(env.Install(prefix + 'share/fina', env.Glob('*.fs')))
env.Default(env.Install(prefix + 'share/fina/test', tests))
env.Default(env.Install(prefix + 'share/fina/benchmarks', benchmarks))
env.Default(env.Install(prefix + 'share/fina/help', [toc] + allhelp + anshelp))
env.Default(env.Install(prefix + 'share/doc/fina', Split("""
  README AUTHORS LICENSE
""")))

# Check installation
if ARGUMENTS.get('check', 0):
	env.Default(env.Command('dummy' + i, tests,
                                prefix + 'bin/fina $SOURCES'))

# Benchmarks
if ARGUMENTS.get('bench', 0):
    for i in benchmarks:
        env.Default(env.Command('dummy' + i , i,
                'time ' + prefix + 'bin/fina $SOURCE -e "main bye"'))

