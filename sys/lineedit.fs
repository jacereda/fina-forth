variable echo  echo off
: cursor ( c-addr u -- c-addr u c-addr2 )
   over span @ + ;
: bell 7 emit ;
: bs 8 emit ;
: +span ( u offset -- u flag ) 
   span @ + >r 
   dup r@ -1 within dup if r@ span ! else bell then rdrop ;
: del -1 +span if bs space bs then ;
:noname ( c-addr u char -- c-addr u char )
   ekey>char case
      1 of  span @ 0 ?do bs loop span @ negate +span drop  1 endof
      2 of  -1 +span if bs then  2 endof
      6 of  1 +span if cursor 1- c@ emit then  6 endof
      8 of  del  8  endof
      127 of  del  127 endof
      printable echo @ if 
         dup if dup emit else bell then 
      then dup 
   endcase ; 'khan !
