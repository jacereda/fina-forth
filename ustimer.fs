require ffi.fs
library libc c.so.6
libc gettimeofday ptr int (int) gettimeofday

: sus ( -- seconds microseconds )
   0 0 sp@ 0 gettimeofday abort" Unable to get time" ;
\g Returns real-time clock in microseconds
: ustime ( -- d )
   sus 1000000 m* rot m+ ;
