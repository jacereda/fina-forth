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

\g returns true if the val could be a PC address
: pc? ( val -- flag )
   dup aligned over = swap dict? and ;

\g returs true if val could be an xt
: xt? ( val -- flag )
   dup pc? if ?dodefine nip 0<> else primxt? then ;

: primheader? ( val -- flag )
   dup pc? if 
      dup @ 3735928559 = if
         cell+ @ primxt? exit
      then
   then drop false ;

: nextxt ( xt1 -- xt2 true | here false )
   begin 
      cell+
      dup here = if false exit then 
      dup primheader? if cell+ @ true exit then
      dup xt? if true exit then 
   again ;

: /xt ( xt -- a-addr )
   dup primxt? if  
      xtend  
   else  
      nextxt if xt>name cell-  then  
   then ;

: type? ( addr <inline-doer> -- flag )
   ?dodefine nip @r+ = ;

: doersee ( xt -- )
   dup type? dolist if 
      ." :" dup xt>name if space then
   then
   dup type? dovar if ." variable " then
   dup type? doconst if ." constant " then
   dup type? douser if ." user " then
   dup type? dovalue if ." value " then
   dup primxt? if ." primitive " then
   drop ;

: safext>name ( xt -- name|0 )
   dup xt? if 
      xt>name dup 0= if drop s" noname" pad place pad then
   else 
      s" [ " pad place 
      0 (d.) pad append
      s"  , ] " pad append
      pad 
   then ;

: cellsee ( /xt a-addr1 -- /xt' a-addr2 )
   2dup cell+ = over @ ['] exit = and if 
      ." ;" 
   else
      dup @ safext>name .name 
   then cell+ ;

defer codesee  
:noname ( xt /xt -- )  over - dump ; is codesee

\g Examine code for xt
: (xtsee) ( xt -- )
   dup doersee 
   dup safext>name .name
   dup /xt 
   over primxt? if codesee exit then 
   swap ?dodefine drop 
   begin  2dup >  while  cellsee  repeat 2drop ;

: xtsee ( xt -- )
   dup (xtsee) xt>name ?dup if 
      dup 
      fimmed 0 > if ." immediate "  then   
      /fcompo unless ." compile-only" then
   then cr ;

\g @see anstools
: see  ( "<spaces>name" -- )
   ' xtsee ;

export see xtsee dump xt?
end-module
