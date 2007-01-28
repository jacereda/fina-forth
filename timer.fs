marker forgettimer

char " parse nstime" ' evaluate catch nip nip [if]
   forgettimer  marker forgettimer
   char " parse machtimer.fs" ' included catch drop 2drop
[then]

char " parse nstime" ' evaluate catch nip nip [if] 
   forgettimer  marker forgettimer
   char " parse nstimer.fs" ' included catch drop 2drop
[then]

char " parse nstime" ' evaluate catch nip nip [if]
   forgettimer  marker forgettimer
   char " parse ustimer.fs" ' included catch drop 2drop
[then]

\g Returns clock in nanoseconds
\ nstime ( -- d)
