\g @see anssearch 
: wordlist ( -- wid )
   forth-wordlist begin cell+ dup @ while @ repeat
   here swap !  here 0 , 0 , ;

wordlist constant root-wordlist

\g @see anssearch
: get-order  ( -- widn ... wid1 n )
   0 #order @ 1- do i cells #order cell+ + @ -1 +loop #order @ ;

\g @see anssearch
: set-order  ( widn ... wid1 n -- )
   dup -1 = if drop root-wordlist dup 2 recurse exit then
   dup #order !  0 do i cells #order cell+ + ! loop ;

\g @see anssearch
: definitions ( -- )
   #order cell+ @ set-current ;

root-wordlist set-current
: set-order set-order ; 
: forth-wordlist forth-wordlist ;
root-wordlist forth-wordlist 2 set-order
forth-wordlist set-current

env: search-order -1 ;env
