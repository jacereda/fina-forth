char " parse machtimer.fs" ' included catch [if]
2drop
char " parse nstimer.fs" ' included catch [if]
2drop
include ustimer.fs
: sns sus 1000 * ;
[then]

\g Returns clock in nanoseconds
: nstime ( -- d)
   sns >r 1000000000 m* r> m+ ;
[then]
