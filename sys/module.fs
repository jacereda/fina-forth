
wordlist constant modules

\g Find module by name, returns it's wordlist
: find-module ( "name" -- wid )
   ['] ' modules with-wordlist execute ;

\g Expose module associated to wordlist, returns parent wordlist
\g (the wordlist that was current before the operation)
: exposed-module ( wid -- pwid )
   >r  get-current get-order 1+ r@ swap set-order  r> set-current ;

\g Expose module by name
: expose-module ( "name" -- )
   find-module exposed-module ;

\g Begin the definition of a module, returns parent wordlist
\g (the wordlist that was current before the operation).
\g This allows module nesting.
: module ( "name" -- pwid )
   get-current modules set-current
   wordlist >r r@ constant 
   set-current 
   r> exposed-module ;

\g Find a word in a wordlist, returning the previous word's NFA 
\g and the word's NFA.
: findprev ( c-addr u wid -- prevnfa nfa )
   0 2swap 2>r swap cell+ -1 begin
      over cell- @ and
   while
      nip dup cell- @
      dup namecount r@ = if 2r@ isame? 0<> else drop -1 then
   repeat rdrop rdrop ;

\g Unlink word from a wordlist, returns it's NFA
: unlink-word ( addr len wid -- nfa )
   findprev >r r@ cell- @ swap cell- ! r> ;

\g Export word to parent wordlist
: exported ( pwid addr len -- pwid )
   get-current unlink-word over @ over cell- ! over ! ;

\g Export to the parent wordlist the words in this line
: export ( pwid "name..." -- )
   begin parse-word dup while exported repeat 2drop ;

\g End module definition and return to parent wordlist
: end-module ( pwid -- )
   previous set-current ;


module private
end-module
