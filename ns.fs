
\g Begin namespace definition
: ns ( "name" -- )
   wordlist create immediate dup , 
   +order definitions does>
   get-order n>r
   @ 1 set-order  
   'nfa ['] doword catch
   nr> set-order  throw ;

\g End namespace definition
: /ns ( -- )
   previous definitions ;
