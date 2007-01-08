
: c+! ( n addr -- )
   >r r@  c@ +  r> c! ;

: append ( str len cstr -- )
    2dup 2>r  count chars +  swap chars move  2r> c+! ;

\ Does str1 begin with str2?)
: beginswith? ( c-addr1 u1 c-addr2 u2 -- flag )
   2>r r@ umin 2r> compare 0= ;

variable requested 0 ,

: nextword ( c-addr1 u1 -- c-addr2 u2 )
   2dup bl scan nip - ;

\ Did we find a matching line?
: matches? ( c-addr u -- flag )
   bl scan bl skip nextword requested 2@ compare 0= ;

0 value helpstatus 
0 value '@see
0 value level

\ XXX
: 0> 0 > ;

: ?type level 0> and type ;
: ?cr level 0> if cr then ;

: .line? ( c-addr u -- )
   2dup s" ====" beginswith? if  0 to helpstatus  then
   helpstatus 1 = if  2dup matches?  if  -1000 to helpstatus  then  then
   helpstatus 0< if
      2dup s" @see" beginswith? if  
         2dup bl scan  bl skip helpstatus >r '@see execute r> to helpstatus
      else 2dup s" @also" beginswith? if
         ." See also: " 2dup bl scan  bl skip ?type ?cr
      else
         2dup ?type ?cr
      then then
   then
   helpstatus 1+ to helpstatus
   2drop ;

: @see ( c-addr u -- )
   level 1+ to level
   s" <<" ?type 2dup ?type s" >>" ?type ?cr
   s" @HLPDIR@/" pad place
   pad append
   s" .help" pad append 
   pad count r/o open-file throw >r
   2 to helpstatus
   r@ ['] .line? foreachline
   r> close-file throw ;  ' @see to '@see

\g Display word documentation
: help ( "word" -- )
   -1 to level
   parse-word requested 2! s" toc" cr @see ;
