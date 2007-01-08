
: .name ( nfa -- )
   namecount type space ;

\g @see anssearch
: also ( -- )
   get-order 1+ over swap set-order ;

\g @see anssearch
: forth ( -- )
   get-order nip forth-wordlist swap set-order ;

\g @see anssearch
: only ( -- )
   -1 set-order ;

\g @see anssearch.fs
: previous  ( -- )
   get-order nip 1- set-order ;

\g Go from XT to data part, safe for non-CREATEd words
: xt>body ( xt -- body )
   dup ?dodefine nip ['] docreate = if >body else ?dodefine drop then ;
   
\g Print wordlist name (or wordlist address if name cannot be found)
: .wid ( wid -- )
   dup [ 3 cells ] literal + name>xt xt>name if 
      dup [ 3 cells ] literal + name>xt xt>body @ over = if 
         [ 3 cells ] literal + .name exit 
      then
   then . ;

\g @see anssearch.fs
: order ( -- )
   get-order 0 do .wid loop  4 spaces  get-current .wid  cr ;

root-wordlist set-current
: order order ;
: forth forth ;
only forth definitions

env: seach-order-ext true ;env
