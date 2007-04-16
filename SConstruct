import os
import sys
import glob

def shelloutput(cmd):
        pipe = os.popen(cmd, 'r')
        ret = pipe.read()
        pipe.close()
        return ret.strip()

def gccversion():
	return shelloutput('gcc --version').split(' ')[2].split('.')

def arch():
	arch = shelloutput('uname -m')
	if arch == 'ppc':
		arch = 'powerpc'
	if arch == 'i686':
		arch = 'i386'
	return arch

env = Environment(ARCH=arch(), CC='gcc')
env['ENV']['PATH'] = os.environ['PATH']
env.Append(CCFLAGS='-O2 -g')
env.Append(LINKFLAGS='-g')
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

env['INCFFI'] = ARGUMENTS.get('INCFFI',{
	'netbsd3' : '/usr/pkg/include',
	'netbsd4' : '/usr/pkg/include',
	'darwin' : '/sw/lib/gcc4.2/lib/gcc/i386-apple-darwin8/4.2.0/include/libffi' +\
		':/sw/lib/gcc4.2/include/',
	'freebsd6' : '/usr/local/include',
	'linux2' : '/usr/include/libffi',
}[sys.platform]).split(':')
env['LIBPATHFFI'] = ARGUMENTS.get('LIBPATHFFI', {
	'netbsd3' : '/usr/pkg/lib',
	'netbsd4' : '/usr/pkg/lib',
	'darwin' : '/sw/lib/gcc4.2/lib',
	'freebsd6' : '/usr/local/lib',
	'linux2' : '/usr/lib/libffi',
}[sys.platform])
env['LIBFFI'] = {
	'netbsd3' : 'ffi',
	'netbsd4' : 'ffi',
	'darwin' : ['ffi', 'dl'],
	'freebsd6' : 'ffi',
	'linux2' : ['ffi', 'dl'],
}[sys.platform]

env['INCX'] = ARGUMENTS.get('INCX', {
	'netbsd3': ['/usr/X11R6/include'],
	'netbsd4': ['/usr/X11R6/include'],
	'darwin': ['/usr/X11R6/include'],
	'freebsd6': ['/usr/X11R6/include'],
	'linux2': ['/usr/include'],
}[sys.platform])
env['LIBPATHX'] = ARGUMENTS.get('LIBPATHX', {
	'netbsd3': ['/usr/X11R6/lib'],
	'netbsd4': ['/usr/X11R6/lib'],
	'darwin': ['/usr/X11R6/lib'],
	'freebsd6': ['/usr/X11R6/lib'],
	'linux2': ['/usr/lib'],
}[sys.platform])

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
