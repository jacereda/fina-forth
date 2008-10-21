library libc c

libc sleep int (int) sleep
libc cwrite int ptr int (int) write
1 lastname count cwrite . cr
1 sleep .

require fixed.fs
library libm m

libm cosf sf (sf) cosf
libm cos df (df) cos

{ fx# 0.0 cosf -> fx# 1 }
{ fx# 0.0 cos -> fx# 1 }

libc qsort ptr int int ptr (void) qsort
callback pp:i ptr ptr (int) callback;
:noname ." Callback!" 2drop 0 ; pp:i qsortcb
here 4 1 qsortcb qsort
