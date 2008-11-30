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
