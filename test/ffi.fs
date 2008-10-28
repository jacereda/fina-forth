library libc c

libc sleep int (int) sleep
libc cwrite int ptr int (int) write
libc bzero ptr int (void) bzero

{ 1 lastname count cwrite cr -> 5 }
{ 1 sleep -> 0 }
{ here 10 bzero -> }

require fixed.fs
library libm m

libm cosf sf (sf) cosf
libm cos df (df) cos

{ fx# 0.0 cosf -> fx# 1 }
{ fx# 0.0 cos -> fx# 1 }

{ s" cosf" symbolfrom: libm 0= -> 0 }

libc qsort ptr int int ptr (void) qsort
callback pp:i ptr ptr (int) callback;
:noname @ swap @ - ; pp:i qsortcb
{ here here 2 , 1 , 4 , 3 ,  4 4 qsortcb qsort @ -> 4 }
