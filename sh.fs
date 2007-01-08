require ffi.fs
library libc libc
libc system ptr (int) system
libc popen ptr ptr (ptr) popen
libc pclose ptr (int) pclose
create buffer 256 allot
: 0term buffer place 0 buffer count + c! buffer 1+ ;
: (sh) 0term system throw ;
: sh" 
   [char] " parse postpone sliteral postpone (sh) ; immediate compile-only
: sh 0 parse (sh) ;

create wfamtab
char r c, 0 c, 0 c, 0 c,
char r c, 0 c, 0 c, 0 c,
char w c, 0 c, 0 c, 0 c,
char w c, 0 c, 0 c, 0 c,
char w c, 0 c, 0 c, 0 c,
char w c, 0 c, 0 c, 0 c,

: wfam>str cells wfamtab + ;
: open-pipe ( c-addr u wfam -- wfileid wior )
   >r 0term r> wfam>str popen dup 0= -32 and ;
: close-pipe ( wfileid -- wretval wior )
   pclose -1 = dup ;

0 [if]
sh ls
:noname s" ls" r/o open-pipe throw ; execute constant ls
pad 256 ls read-file drop . cr pad 256 dump 
ls close-pipe throw drop
:noname s" echo foo" r/o open-pipe throw ; execute constant echo
pad 256 echo read-file drop . cr pad 256 dump 
echo close-pipe 2drop
[then]
