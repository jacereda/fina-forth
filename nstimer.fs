require ffi.fs
library librt rt.so.1
librt clock_gettime int ptr (int) clock_gettime
: sns ( -- seconds nanoseconds )
   0 0 sp@ 0 swap clock_gettime abort" Unable to get time" swap ;
