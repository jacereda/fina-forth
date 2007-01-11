require ffi.fs
library librt rt
librt clock_gettime int ptr (int) clock_gettime

: sns ( -- seconds nanoseconds )
   0 0 0 sp@ cell+ clock_gettime abort" Unable to get time" ;
\g Returns real-time clock in nanoseconds
: nstime ( -- d )
   sns 1000000000 m* rot m+ ;