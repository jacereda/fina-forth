warnings @ warnings off
char " parse ustimer.fs" ' included catch [if]
2drop
[then]
char " parse nstimer.fs" ' included catch [if]
2drop
[then]
char " parse machtimer.fs" ' included catch [if]
2drop
[then]

\g Returns clock in nanoseconds
\ nstime ( -- d)
warnings !
