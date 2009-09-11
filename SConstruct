import os
import sys
import glob

def shelloutput(cmd):
        pipe = os.popen(cmd, 'r')
        ret = pipe.read()
        pipe.close()
        return ret.strip()

def gccversion():
	out = shelloutput('gcc --version').split(' ')
	if len(out) < 3:
		ind = 0
	else:
		ind = 2
	return map(int, out[ind].split('.'))


def arch():
	arch = shelloutput('uname -m')
	if arch == 'ppc':
		arch = 'powerpc'
	if arch == 'i686':
		arch = 'i386'
	if arch == 'sgimips':
	   	arch = 'mips'
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

if ARGUMENTS.get('BUILD64',0):
   tarch = 'x64'
else:
   tarch = arch()
env = Environment(ARCH=tarch, CC='gcc', OS=normalized_os())
#env['ENV']['PATH'] = os.environ['PATH']
env.Append(CCFLAGS='-O2 -g')
env.Append(LINKFLAGS='-g')
if ARGUMENTS.get('BUILD64',0):
   env.Append(CPPDEFINES=['X86_64'])
else:
   if env['ARCH'] == 'i386' and env['OS'] == 'darwin':
      env.Append(ASFLAGS='-arch i386')
   env.Append(CCFLAGS='-m32')
   env.Append(LINKFLAGS='-m32')

env.Append(CPPDEFINES=['HAS_FILES', 'HAS_ALLOCATE', 'HAS_FIXED', 'HAS_FFI', 
			'MORE_PRIMS'])
gccmajor, gccminor, gccrev = gccversion()
if gccmajor < 3:
	env.Append(CPPDEFINES=[['__LONG_LONG_MAX__', '9223372036854775807']])
else:
	env.Append(CCFLAGS='-fno-reorder-blocks')


tab = Builder(action=
   'install -d obj && cat $SOURCE' + \
   ' | grep "^ *PRIM("' + \
   ' | sed "s/PRIM(\(.*\),.*/\&\&\\1,/g" > obj/${TARGET.name} ',
   source_scanner = CScan)

asm = Builder(action=
   '$CC $CCFLAGS $CPPFLAGS $_CPPDEFFLAGS $_CPPINCFLAGS -S -o $TARGET $SOURCE',
   source_scanner = CScan)

hlp = Builder(action=
  'obj/fina help/glosgen.fs -e "newglos makeglos $SOURCE writeglos $TARGET bye"')


env.Append(BUILDERS = {
	'Tab' : tab,
	'Asm' : asm,
	'Hlp' : hlp,
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


Environment.Glob = classmethod(myglob)
Environment.Basename = classmethod(basename)
Environment.OutputFrom = classmethod(outputfrom)

env.SConscript('SConscript', 
		build_dir = 'obj', 
		src_dir = '.', 
		exports=['env'],
		duplicate = 0)
