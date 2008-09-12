expose-module private

\g @see anstools
: ?  ( a-addr -- )
   @ . ;

\g Type name of word at NFA
: .name ( nfa -- )
   namecount type space ;

: (.name) ( nfa -- nfa )
   dup .name 
   1 pad +! ;

: topmost-wordlist
   get-order over >r set-order r> ;

: (.wordsin) ( wordlist -- n )
   pad off
   ['] (.name) forwordsin cr
   pad @ ;
   
: wordsin ( wordlist -- )
   (.wordsin) . ." words" cr ;

\g @see anstools
: words ( -- )
   topmost-wordlist wordsin ;

: .modules modules wordsin ;

export wordlist-words words ? .name .modules
end-module

root-wordlist set-current
: words words ; 
forth-wordlist set-current

expose-module private
: dumprow ( addr u -- addr' )
  swap dup 0 <#  # # # # # # # #  #> type space
  16 0 do
     over i 1+ < if 2 spaces else dup c@ 0 <# # # #> type then space char+ 
  loop 2 spaces 16 chars - 
  16 0 do 
     over i 1+ < if  bl  else 
        dup c@ 127 and dup 0 bl within over 127 = or if 
           drop [char] .
        then
     then emit char+
  loop nip cr ;

: (dump)
   16 /mod swap >r
   0 ?do 16 dumprow loop
   r> dumprow drop ;

\g @see anstools
: dump  ( addr u -- )
   16 based (dump) ;

: (next?)
   2dup cell- @ = over and to found ;

: nextnfa ( nfa1 -- nfa2 )
   ['] (next?) forwords drop found if found else here cell+ then ;

: /xt ( xt -- a-addr )
   dup primxt? if exit then  \ XXX
   xt>name nextnfa cell- ;

: type? ( addr <inline-doer> -- flag )
   ?dodefine nip @r+ = ;

: doersee ( xt -- )
   dup type? dolist if ." : " then
   dup type? dovar if ." variable " then
   dup type? doconst if ." constant " then
   dup type? douser if ." user " then
   dup type? dovalue if ." value " then
   dup primxt? if ." primitive " then
   drop ;

\g returns true if the val could be a PC address
: pc? ( val -- flag )
   dup aligned over = swap dict? and ;

\g returs true if val could be an xt
: xt? ( val -- flag )
   dup pc? if ?dodefine nip 0<> else primxt? then ;

: safext>name ( xt -- name|0 )
   dup xt? if xt>name else 0 (d.) pad place pad then ;

: cellsee ( a-addr1 -- a-addr2 )
   dup @ safext>name .name 
   cell+ ;

\g Examine code for xt
: xtsee ( xt -- )
   dup doersee 
   dup xt>name .name
   dup primxt? if dup else dup ?dodefine nip then xt>name .name
   dup /xt swap ?dodefine drop 
   begin  2dup >  while  cellsee  repeat 2drop ;

\g @see anstools
: see  ( "<spaces>name" -- )
   ' /fcompo fimmed rot xtsee 
   0 > if ." immediate "  then    0= if ." compile-only" then cr ;

export see xtsee dump
end-module
