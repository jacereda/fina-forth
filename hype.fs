\ HYPE - a simple OOF implementation
\ by Helge Horch <heho@gmx.de>
\ See http://home.netsurf.de/helge.horch/hype.html

: lit, ( x) postpone literal ;
0 value self
: self+ ( n - a) self + ;
: send ( a xt) self >r  swap to self execute  r> to self ;
variable cls ( contains ta -> |size|wid|super|)
: size^ ( - aa) cls @ ?dup 0= abort" scope?" ;
: mfind ( ta ca u - xt n) 2>r begin dup while cell+ dup @ 2r@
   rot search-wordlist ?dup if rot drop 2r> 2drop exit then
   cell+ @ repeat -1 abort" can't?" ;
: send' ( a ta "m ") bl word count mfind 0< state @ and
   if swap lit, lit, postpone send else send then ;
: super ( "m ") size^ cell+ cell+ @ bl word count mfind 0<
   if compile, else execute then ; immediate
: defs ( n "f ") create size^ @ , size^ +! immediate
   does> @ state @ if lit, postpone self+ else self+ then ;
: methods ( ta) dup cls ! cell+ @ dup set-current
   >r get-order r> swap 1+ set-order ; ( also context !)
: class ( "c ") create here 0 , 0 , 0 ,
   wordlist over cell+ ! methods ;
: subclass ( ta "c ") class size^ over @ over ! cell+ cell+ ! ;
: end ( ) size^ drop previous definitions 0 cls ! ;
: instance ( ta) dup , @ allot does> dup cell+ swap @ send' ;
: new ( ta "name ") create instance immediate ;

: var 1 cells defs ;
: iv ( ta "name " ) dup @ defs , does> 2@ self+ swap send' ;
: ref var , does> 2@ self+ @ swap send' ;

0 [if]
1 cells constant cell

class button
   cell defs text
   cell defs len
   cell defs x
   cell defs y
: draw ( )   x @ y @ at-xy  text @ len @ type ;
: init ( ca u)   0 x ! 0 y ! len ! text ! ;
end

: bold   27 emit ." [1m" ;
: normal 27 emit ." [0m" ;

button subclass bold-button
: draw ( )   bold super draw normal ;
end

button new foo
bold-button new bar
:noname s" thin foo" foo init ; execute
:noname s" fat bar" bar init ; execute

10 foo x !  1 foo y !
1 bar x !  10 bar y !
 
page  foo draw  bar draw  cr  bye
[then]
