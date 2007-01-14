require ffi.fs
library libc c
libc gettimeofday ptr int (int) gettimeofday
: sus ( -- seconds microseconds)
   0 0 sp@ 0 gettimeofday abort" Unable to get time" swap ;
