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
#env['ENV']['PATH'] = os.environ['PATH']
env.Append(CCFLAGS='-O2 -g')
env.Append(LINKFLAGS='-g')
if tarch == 'x64':
   env.Append(CPPDEFINES=['X86_64'])
else:
   if env['ARCH'] == 'i386' and env['OS'] == 'darwin' and not ring0:
      env.Append(ASFLAGS='-arch i386')
   env.Append(CCFLAGS='-m32')
   env.Append(LINKFLAGS='-m32')

if ARGUMENTS.get('profile', False):
   env.Append(CPPDEFINES=['PROFILE'])

gccmajor, gccminor, gccrev = gccversion()
if gccmajor < 3:
	env.Append(CPPDEFINES=[['__LONG_LONG_MAX__', '9223372036854775807']])
else:
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
		res += '&&' + prim.split(',')[0] + ',\n'
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


Environment.Glob = classmethod(myglob)
Environment.Basename = classmethod(basename)
Environment.OutputFrom = classmethod(outputfrom)

env.AddMethod(CppAsm)
env.SConscript('SConscript.ffi',
		build_dir = 'obj', 
		src_dir = '.', 
		exports=['env'],
		duplicate = 0)

sc = 'SConscript'
if ring0:
   sc += '.ring0'
env.SConscript(sc,
		build_dir = 'obj', 
		src_dir = '.', 
		exports=['env'],
		duplicate = 0)
