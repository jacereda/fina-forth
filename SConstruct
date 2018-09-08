import os
import sys
import glob
import re

def shelloutput(cmd):
        pipe = os.popen(cmd, 'r')
        ret = pipe.read()
        pipe.close()
        return ret.strip()

def gccversion():
	ver = re.search('\d*\.\d*\.\d*', shelloutput('gcc --version')).group(0)
	return map(int, ver.split('.'))

def arch():
	if os.name == 'nt':
		arch = 'i386'
	else:
		arch = shelloutput('uname -m')
	if arch == 'ppc':
		arch = 'powerpc'
	if arch == 'amd64':
	   	arch = 'x64'
	if arch == 'x86_64':
	   	arch = 'x64'
	if arch == 'i686':
		arch = 'i386'
	if arch == 'sgimips':
	   	arch = 'mips'
	if ARGUMENTS.get('arch', 0):
		arch = ARGUMENTS.get('arch')
	return arch

def normalized_os():
	ret = sys.platform
	if ret[0:6] == 'netbsd':
		ret = 'netbsd'
	if ret[0:7] == 'freebsd':
		ret = 'freebsd'
	if ret[0:5] == 'linux':
		ret = 'linux'
	if ret[0:9] == 'dragonfly':
	   ret = 'dragonfly'
	return ret

tarch = arch()
tools = []
if os.name == 'nt':
	tools = ['mingw']

env = Environment(ARCH=tarch, TOOLS=['mingw'], OS=normalized_os())

ring0 = ARGUMENTS.get('ring0', False)
if ring0:
   env.Tool('crossmingw', '.')
   env['LINK'] = env['CC']
   env['OS'] = 'win32'
env['ENV']['PATH'] = os.environ['PATH']
env.Append(CCFLAGS='-Ofast')
if env['OS'] == 'darwin':
   env.Append(LINKFLAGS='-Wl,-no_pie')

if tarch == 'x64':
   env.Append(CPPDEFINES=['X86_64'])
else:
   if tarch == 'i386' and env['OS'] == 'darwin' and not ring0:
      env.Append(ASFLAGS='-arch i386')
   if tarch == 'i386' and env['OS'] != 'darwin':
      env.Replace(AS='as --32')
   env.Append(CPPFLAGS='-m32')
   env.Append(LINKFLAGS='-m32')

env.Append(CCFLAGS='-fno-reorder-blocks')

def slurp(f):
	f = open(str(f))
	res = f.read()
	f.close()
	return res


def barf(f, contents):
	f = open(str(f), 'w')
	f.write(contents)
	f.close

def gentab(env, target, source):
	res = ''
	prims = slurp(source[0]).split('PRIM(')[1:]
	for prim in prims:
		res += '&&' + prim.split(')')[0] + ',\n'
	barf(target[0], res)

def cat(env, target, source):
	res = ''
	for src in source:
		res += slurp(src)
	barf(target[0], res)


cat = Builder(action=cat)

tab = Builder(action=gentab, source_scanner = CScan)

asm = Builder(action=
   '$CC $CCFLAGS $CPPFLAGS $_CPPDEFFLAGS $_CPPINCFLAGS -S -o $TARGET $SOURCE',
   source_scanner = CScan)

hlp = Builder(action=
  'obj/fina help/glosgen.fs -e "newglos makeglos $SOURCE writeglos $TARGET bye"')


env.Append(BUILDERS = {
	'Tab' : tab,
	'Asm' : asm,
	'Hlp' : hlp,
	'Cat' : cat,
})

def myglob(self, pat):
	curr = os.getcwd()
	os.chdir(str(Dir('#')))
	ret = glob.glob(pat)
	os.chdir(curr)
	return ret

def basename(self, path):
	return os.path.basename(path)

def outputfrom(self, cmd):
	return shelloutput(cmd)

def CppAsm(self, target, source):
	cpp = self.Command(target + '.s', source,
			   '$CC $CCFLAGS $CPPFLAGS $_CPPDEFFLAGS $_CPPINCFLAGS -E -o $TARGET $SOURCE')
	return self.Object(target, cpp)


prefix = ARGUMENTS.get('prefix', '#./inst')
if prefix[-1] != '/':
	prefix += '/'

def Ins(self, where, what):
    return self.Default(self.Install(prefix + where, what))

def Run(self, files):
    env.Default(env.Command('dummyrun', files,
    			str(Dir(prefix)) + '/bin/fina $SOURCES'))

def TimedRun(self, file):
    env.Default(env.Command('dummy' + file, file,
		     'time ' + str(Dir(prefix)) \
		     	   + '/bin/fina $SOURCE -e "main bye"'))

Environment.Glob = classmethod(myglob)
Environment.Basename = classmethod(basename)
Environment.OutputFrom = classmethod(outputfrom)

env.AddMethod(CppAsm)
env.AddMethod(Ins)
env.AddMethod(Run)
env.AddMethod(TimedRun)
env.SConscript('SConscript.ffi',
	       variant_dir = 'obj',
	       exports=['env'],
	       duplicate = 0)

sc = 'SConscript'
if ring0:
   sc += '.ring0'
env['files'] = ARGUMENTS.get('files', 1)
env['allocate'] = ARGUMENTS.get('allocate', 1)
env['fixed'] = ARGUMENTS.get('fixed', 1)
env['ffi'] = ARGUMENTS.get('ffi', 1)
env['moreprims'] = ARGUMENTS.get('moreprims', 1)
env['profile'] = ARGUMENTS.get('profile', 0)

env.SConscript(sc,
	       variant_dir = 'obj',
	       exports=['env'],
	       duplicate = 0)
