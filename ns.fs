: ns ( "name" -- )
   wordlist create , immediate does>
   get-order n>r  
   1 set-order  
   'nfa ['] doword catch
   nr> set-order 
   throw ;
0 [if]   

: (namespace) ( wid "name" -- )
   create , immediate does> @  
   get-order n>r  
   1 set-order  
   'nfa ['] doword catch
   nr> set-order 
   throw ;

\ Create a namespace for the current wordlist
: namespace: ( "name" -- )
   get-current (namespace) ;

\g Start namespace definition
: ns ( "name" -- )
   get-current  wordlist dup (namespace) set-current 
   get-current +order ;
[then]

\g End namespace definition
: /ns ( -- )
   previous  set-current  ;

