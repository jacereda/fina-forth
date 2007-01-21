require ffi.fs
library libc c
create 0buffer 256 allot
: 0term 0buffer place 0 0buffer count + c! 0buffer 1+ ;
