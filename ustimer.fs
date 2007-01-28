\ Don't use this, include timer.fs
libc gettimeofday ptr int (int) gettimeofday
: sns ( -- seconds nanoseconds)
   0 0 sp@ 0 gettimeofday -21 ?throw swap 1000 * ;
sns 2drop
: nstime ( -- d)
   sns >r 1000000000 m* r> m+ ;
