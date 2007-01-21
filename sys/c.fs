library libc c
create 0buffer 256 allot
: 0term 0buffer place 0 0buffer count + c! 0buffer 1+ ;
: 0count 0 over begin dup c@ while 1 under+ 1+ repeat drop ;
