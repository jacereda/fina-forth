
wordlist constant modules

: find-module ( "name" -- wid )
   get-order 1+ modules swap set-order ' execute previous ;

: exposed-module ( wid -- pwid )
   >r  get-current get-order 1+ r@ swap set-order  r> set-current ;

: expose-module ( "name" -- )
   find-module exposed-module ;

\g Begin module definition
: module ( "name" -- pwid )
   get-current modules set-current
   wordlist >r r@ constant 
   set-current 
   r> exposed-module ;

: findprev ( c-addr u wid -- prevnfa nfa )
   0 2swap 2>r swap cell+ -1 begin
      over cell- @ and
   while
      nip dup cell- @
      dup namecount r@ = if 2r@ isame? 0<> else drop -1 then
   repeat rdrop rdrop ;

: unlink-word ( addr len wid -- nfa )
   findprev >r r@ cell- @ swap cell- ! r> ;

: exported ( pwid addr len -- pwid )
   get-current unlink-word over @ over cell- ! over ! ;

\g Export symbols from module
: export ( pwid "name..." -- )
   begin parse-word dup while exported repeat 2drop ;

\g Terminate module definition
: end-module ( pwid -- )
   previous set-current ;
