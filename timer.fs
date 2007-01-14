require ffi.fs
char " parse nstimer.fs ' included try
[if]
include ustimer.fs
: sns sus 1000 * ;
[then]

\g Returns clock in nanoseconds
: nstime ( -- d)
   sns >r 1000000000 m* r> m+ ;
