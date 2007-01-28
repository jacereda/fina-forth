Import('env')
fenv = env.Copy()
fenv.Append(CPPPATH=['obj'] + fenv['INCFFI'])
fenv.Append(LIBPATH=fenv['LIBPATHFFI'])
fenv.Append(LINKFLAGS=' -rpath=' + env['LIBPATHFFI'])
fenv.Append(LIBS=fenv['LIBFFI'])

for i in fenv.Glob('kernel/*.i'):
	fenv.Tab(fenv.Basename(i[:-2]) + 'tab.it', i)

fenv.Command('arch.h', 'kernel/$ARCH-arch.h', 'ln -sf ${SOURCE.abspath} $TARGET')
fenv.Asm('finac.s', 'kernel/finac.c')

boot = ['sys/' + i for i in Split("""
   core.fs defer.fs core2.fs throwmsg.fs search.fs coreext.fs 
""")]

full = ['sys/' + i for i in Split("""
   core.fs defer.fs core2.fs throwmsg.fs signals.fs
   search.fs coreext.fs searchext.fs keyhandler.fs 
   file.fs fileext.fs double.fs doubleext.fs optional.fs
   string.fs require.fs tools.fs toolsext.fs
   facility.fs facilityext.fs lineedit.fs 
   assert.fs multi.fs
   osnice.fs args.fs save.fs ffi.fs c.fs
   instinclude.fs help.fs build.fs savefina.fs
""")]

kerneltests = ['sys/core.fs'] + ['test/' + i for i in Split("""
   tester.fs core.fs postpone.fs bye.fs
""")]

tests = ['test/' + i for i in Split("""
   tester.fs core.fs postpone.fs
   file.fs double.fs double2.fs
   fina.fs bye.fs
""")]

benchmarks = env.Glob('benchmarks/*.fs')

def gendict(arch, phase, kernel):
        meta =  ['meta/' + arch + '-tconfig.fs'] + \
                ['meta/' + i for i in Split("""
		   tconfig.fs host-fina.fs meta.fs fina.fs
	        """)]
        fenv.Command('kernel/' + arch + '-dict' + str(phase) + '.s', 
                [kernel] + boot + meta,
                'cat ${SOURCES[1:]} | $SOURCE > $TARGET')

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
	"""echo ": build s\\" `svnversion .`\\" ;" > $TARGET""")
f = fenv.Command('fina', ['kernel2'] + full,
        ['echo "`cat ${SOURCES[1:]} ` warnings on save\\" obj/fina\\" bye"' +\
         '  | $SOURCE',
        'chmod 777 $TARGET'])

if ARGUMENTS.get('test', 0):
        fenv.Command('testfina', [f] + tests, 
                '$SOURCE ${SOURCES[1:]}')

#awenv = env.Copy()
#awenv.Append(LIBPATH=awenv['LIBPATHX'])
#awenv.Append(CPPPATH=awenv['INCX'])
#awenv.Append(LIBS=['X11', 'GL', 'Xxf86vm', 'Xext'])
#awenv.Append(CCFLAGS=' -g ')
#env.Default(awenv.SharedLibrary(prefix + 'lib/fina/aw', Split('aw.c awx.c')))


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

