require ffi.fs
library librt rt
librt clock_gettime int ptr (int) clock_gettime

\g Returns real-time clock in nanoseconds
: nstime ( -- d )
   0 0 0 sp@ cell+ clock_gettime abort" Unable to get time" ;