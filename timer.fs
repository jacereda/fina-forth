require ffi.fs
library librt rt
librt clock_gettime int ptr (int) clock_gettime

create nsres 0 , 0 , \ XXX make it reentrant
\g Returns real-time clock in nanoseconds
: nstime ( -- d )
   0 nsres clock_gettime abort" Unable to get time" nsres 2@ ;

