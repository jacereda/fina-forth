
\g Begin namespace definition, leaves previously current wordlist on stack
: ns ( "name" -- wid )
   get-current  
   wordlist create immediate dup , 
   dup +order set-current does>
   get-order n>r
   @ 1 set-order  
   'nfa ['] doword catch
   nr> set-order  throw ;

\g End namespace definition and restore previously current wordlist
: /ns ( wid -- )
   previous  set-current  ;
