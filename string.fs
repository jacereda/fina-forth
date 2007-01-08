
\g @see ansstring
: compare  ( c-addr1 u1 c-addr2 u2 -- n )
    rot 2dup swap - >r
    umin same? ?dup if rdrop exit then
    r> dup if 0< 2* 1+ then ;

\g @see ansstring
: -trailing ( a u1 -- a u2 )
   begin 2dup + 1- c@ bl = over and while 1- repeat ;

\g @see ansstring
: blank  ( c-addr u -- )
   bl fill ;

\g @see ansstring
: cmove>  ( c-addr1 c-addr2 u -- )
   move ;

\g @see ansstring 
: search  ( c-addr1 u1 c-addr2 u2 -- c-addr3 u3 flag )
   2over bounds do 
      2dup i swap same?  0= if 
         2drop + i swap over -  true unloop exit 
      then
   loop 2drop false ;

env: string true ;env
