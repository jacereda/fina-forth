Import('env')
ffienv = env.Clone()
ffiarch = {
	'i386' : 'X86',
	'powerpc' : 'POWERPC',
	'mips': 'MIPS',
}[ffienv['ARCH']]
ffios = {
	'netbsd' : '_FREEBSD',
	'freebsd' : '_FREEBSD',
	'openbsd' : '_FREEBSD',
	'darwin' : '_DARWIN',
	'linux' : '',
}[ffienv['OS']]
ffienv.Append(CPPDEFINES=[
	['TARGET', ffiarch + ffios],
	[ffiarch + ffios, 1],
	['HAVE_LONG_DOUBLE', 1],
])
ffiarchbase = {
	'i386' : 'x86',
	'powerpc': 'powerpc',
	'mips': 'mips',
}[ffienv['ARCH']]
ffiossrc = {
	'darwin' : 'darwin.S',
	'linux' : 'sysv.S ppc_closure.S',
	'freebsd' : 'freebsd.S',
	'openbsd' : 'freebsd.S',
	'netbsd' : 'freebsd.S',
}[ffienv['OS']]
if ffienv['ARCH'] == 'mips' and ffiossrc == 'freebsd.S':
   ffiossrc = 'o32.S'
   ffienv.Append(CPPDEFINES=[['FFI_MIPS_O32', 1]])


plat = ffiarchbase + '/ffi.c '
for i in Split(ffiossrc):
    plat += ffiarchbase + '/' + i + ' '
fficpppath = [
	'libs/libffi/include', 
	'libs/libffi/src/',
	'libs/libffi/src/' + ffiarchbase,
	'libs/libffi/',
]

ffienv.Append(CPPPATH=fficpppath)

ffienv.Library('ffi', ['libs/libffi/src/' + i for i in Split('''
	debug.c 
	prep_cif.c 
	types.c
	closures.c
''' + plat)])


fenv = env.Clone()
fenv.Append(CPPPATH=['obj'] + fficpppath)
fenv.Append(CPPDEFINES=[[ffiarch + ffios, 1]])
fenv.Append(LIBPATH=['.'])
fenv.Append(LIBS=['ffi'])

if fenv['OS'] == 'linux':
   fenv.Append(LIBS=['dl'])

for i in fenv.Glob('kernel/*.i'):
	fenv.Tab(fenv.Basename(i[:-2]) + 'tab.it', i)

fenv.Command('arch.h', 'kernel/$ARCH-arch.h', 'ln -sf ${SOURCE.abspath} $TARGET')
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
	src = fenv.Command(name + '.fs', [kernel] + boot + meta,
		'cat ${SOURCES[1:]} > $TARGET')
        fenv.Command('kernel/' + arch + '-dict' + str(phase) + '.s', 
		[kernel, src],
                '${SOURCES[0]} < ${SOURCES[1]} > $TARGET')

architectures = ['powerpc', 'mips', 'i386']

for phase in range(3):
        ks = fenv.Command('kernel/kernel' + str(phase) + '.s', 
                ['finac.s', 'kernel/$ARCH-dict' + str(phase) + '.s'],
                'cat $SOURCES > $TARGET')
        k = fenv.Program('kernel' + str(phase), 
                        [ks, 'kernel/sysposix.c', 'kernel/main.c'])
        if ARGUMENTS.get('test', 0):
                fenv.Default(fenv.Command('dummy' + str(phase), 
				[k] + kerneltests,
	                        'cat ${SOURCES[1:]} | $SOURCE'))
        for arch in architectures:
                gendict(arch, phase+1, k)

for arch in architectures:
        fenv.Default(fenv.Command(arch + 'dummy', 
                        'kernel/' + arch + '-dict2.s', 
                        Copy('kernel/' + arch + '-dict0.s', '$SOURCE')))
        

fenv.Command('sys/build.fs', ['kernel2'] + full[:-2], 
	'echo ": buildstr s\\" ' + \
	fenv.OutputFrom('svnversion ' + str(Dir('#'))) + \
	'\\" ;" > $TARGET')
fsrc = fenv.Command('finasrc.fs', full,
  'echo "`cat $SOURCES ` warnings on save\\" obj/fina\\" bye" > $TARGET')
f = fenv.Command('fina', ['kernel2', fsrc],
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

