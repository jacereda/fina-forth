expose-module private
libc popen ptr ptr (ptr) popen
libc pclose ptr (int) pclose

create wfamtab
char r c, 0 c,
char r c, 0 c,
char w c, 0 c,
char w c, 0 c,
char w c, 0 c,
char w c, 0 c,

: wfam>str 2* wfamtab + ;
: open-pipe ( c-addr u wfam -- wfileid wior )
   >r 0term r> wfam>str popen dup 0= -32 and ;
: close-pipe ( wfileid -- wretval wior )
   pclose -1 = dup ;
: pipeto ( cmd cmdlen dst dstlen -- dst dstlen' )
   2swap r/o open-pipe throw >r
   over swap r@ read-file throw
   r> close-pipe throw abort" Unable to execute command" ;

export open-pipe close-pipe pipeto
end-module
