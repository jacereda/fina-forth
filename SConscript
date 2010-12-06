Import('env')
fenv = env.Clone()
fenv.Append(CPPDEFINES=[
      ['ASMCALL', {
                'arm': '"bl"',
                'i386': '"nop;nop;nop;call"',
                'mips': '"bal"',
                'powerpc': '"bl"',
                'x64': '"nop;nop;nop;call"',
                }[env['ARCH']]],
      ['ASMCELL', {
                'arm': '".long"',
                'i386': '".long"',
                'mips': '".long"',
                'powerpc': '".long"',
                'x64': '".quad"',
                }[env['ARCH']]],
      ['ASMALIGN', {
                'arm': '".balign\ 4"',
                'i386': '".p2align\ 2"',
                'mips': '".balign\ 4"',
                'powerpc': '".align\ 2"',
                'x64': '".p2align\ 3"',
                }[env['ARCH']]],
      ['BUILD_FILES', fenv['files']],
      ['BUILD_ALLOCATE', fenv['allocate']],
      ['BUILD_FIXED', fenv['fixed']],
      ['BUILD_FFI', fenv['ffi']],
      ['BUILD_MOREPRIMS', fenv['moreprims']],
      ['BUILD_PROFILE', fenv['profile']],
       ])

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
fenv.Asm('finac.S', 'kernel/finac.c')

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
        fenv.Command('kernel/dict%s.S' % phase,
		[kernel, src],
                '${SOURCES[0]} < ${SOURCES[1]} > $TARGET')

def genbaredict(arch, kernel):
        meta =  ['meta/' + arch + '-tconfig.fs'] + \
                ['meta/' + i for i in Split("""
		   tconfig.fs host-fina.fs meta.fs fina.fs
	        """)]
	name = 'kernel/' + arch + '-baredict'
	src = fenv.Cat(name + '.fs', boot + meta)
        fenv.Default(fenv.Command(name + '.S', [kernel, src],
                '${SOURCES[0]} < ${SOURCES[1]} > $TARGET'))

k = None

if fenv['OS'] == 'win32':
   ksys = 'nt'
else:  
   ksys = 'posix'

for phase in range(3):
        ks = fenv.Cat('kernel/kernel' + str(phase) + '.S', 
                ['finac.S', 'kernel/dict' + str(phase) + '.S'])

        k = fenv.Program('kernel' + str(phase), 
                        [ks, 'kernel/sys' + ksys + '.c', 'kernel/main.c'])
        if ARGUMENTS.get('test', 0):
                fenv.Default(fenv.Command('dummy' + str(phase), 
				[k] + kerneltests,
	                        'cat ${SOURCES[1:]} | $SOURCE'))
        gendict(fenv['ARCH'], phase+1, k)

genbaredict('i386', k)

fenv.Default(fenv.Command('dummy', 
                          'kernel/dict2.S', 
                         Copy('kernel/dict0.S', '$SOURCE')))
        

fenv.Command('sys/build.fs', [k] + full[:-2], 
	'echo ": buildstr s\\" ' + \
	fenv.OutputFrom('hg id -i') + \
	'\\" ;" > $TARGET')
fsrc = fenv.Cat('finasrc.fs', full + ['saveaux.fs'])
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
env.Ins('bin', f)
env.Ins('share/fina', env.Glob('*.fs'))
env.Ins('share/fina/test', tests)
env.Ins('share/fina/benchmarks', benchmarks)
env.Ins('share/fina/help', [toc] + allhelp + anshelp)
env.Ins('share/doc/fina', Split("""
  README AUTHORS LICENSE
"""))

# FFL installation
env.Ins('share/fina/ffl', 'ffl/engines/fina/config.fs')
env.Ins('share/fina/ffl', env.Glob('ffl/ffl/*.fs'))
#env.Ins('share/fina/test', env.Glob('ffl/test/*.fs'))
env.Ins('share/doc/fina/ffl', ['ffl/' + i for i in Split('''
AUTHORS COPYING ChangeLog NEWS README
''')])
env.Ins('share/doc/fina/ffl/html', env.Glob('ffl/html/*.html'))

# Check installation
if ARGUMENTS.get('check', 0):
   env.Run(tests)

# Benchmarks
if ARGUMENTS.get('bench', 0):
    for i in benchmarks:
        env.TimedRun(i)

