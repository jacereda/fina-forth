import os
import sys

def shelloutput(cmd):
        pipe = os.popen(cmd, 'r')
        ret = pipe.read()
        pipe.close()
        return ret.strip()

def arch():
	arch = shelloutput('uname -m')
	if arch == 'ppc':
		arch = 'powerpc'
	return arch

prefix = ARGUMENTS.get('prefix', '#')
helpdir = prefix + 'share/fina/help'

env = Environment(ARCH=arch(), CC='gcc')
env.Append(CPPFLAGS='-O2')
env.Append(LINKFLAGS='-g')
if sys.platform == 'netbsd3' or sys.platform == 'netbsd4':
	env.Append(LINKFLAGS=' -static ')
env.Append(CPPDEFINES=['HAS_FILES', 'HAS_ALLOCATE', 'HAS_FIXED', 'HAS_FFI', 
			'MORE_PRIMS'])


tab = Builder(action=
	'cat $SOURCE | grep "^ *PRIM(" | sed "s/PRIM(\(.*\),.*/\&\&\\1,/g" > $TARGET',
	source_scanner = CScan)

asm = Builder(action=
	'$CC $CCFLAGS $CPPFLAGS $_CPPDEFFLAGS $_CPPINCFLAGS -S -o $TARGET $SOURCE',
	source_scanner = CScan)
hlp = Builder(action='obj/fina glosgen.fs -e "newglos makeglos $SOURCE writeglos $TARGET bye"')


env.Append(BUILDERS = {'Tab' : tab})
env.Append(BUILDERS = {'Asm' : asm})
env.Append(BUILDERS = {'Hlp' : hlp})

env['INCFFI'] = {
	'netbsd3' : [	'/usr/pkg/include' ],
	'netbsd4' : [	'/usr/pkg/include' ],
	'darwin' : [
		'/sw/lib/gcc4/lib/gcc/i386-apple-darwin8/4.2.0/include/libffi', 
		'/sw/lib/gcc4/include/'
	],
	'linux2' : [	'/usr/include/libffi' ],
}[sys.platform]
env['LIBPATHFFI'] = {
	'netbsd3' : '/usr/pkg/lib',
	'netbsd4' : '/usr/pkg/lib',
	'darwin' : '/sw/lib/gcc4/lib',
	'linux2' : '/usr/lib/libffi',
}[sys.platform]
env['LIBFFI'] = {
	'netbsd3' : 'ffi',
	'netbsd4' : 'ffi',
	'darwin' : ['ffi', 'dl'],
	'linux2' : ['ffi', 'dl'],
}[sys.platform]

env['INCX'] = {
	'netbsd3': ['/usr/X11R6/include'],
	'netbsd4': ['/usr/X11R6/include'],
	'darwin': ['/usr/X11R6/include'],
	'linux2': ['/usr/include'],
}[sys.platform]
env['LIBX'] = {
	'netbsd3': ['/usr/X11R6/lib'],
	'netbsd4': ['/usr/X11R6/lib'],
	'darwin': ['/usr/X11R6/lib'],
	'linux2': ['/usr/lib'],
}[sys.platform]

env.SConscript('SConscript', 
		build_dir = 'obj', 
		src_dir = '.', 
		exports=['env', 'prefix', 'helpdir'],
		duplicate = 0)
