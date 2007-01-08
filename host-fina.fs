warnings off

: lastxt ( -- xt)
   lastname name>xt ;
: lasthead ( -- addr)
   lastname ;
defer lit>t defer ncell>t
: special+lit ( "word" -- )
   ' postpone literal postpone over postpone = postpone if 
      postpone drop postpone ncell>t 
      [char] , postpone literal postpone emit
      postpone lit>t postpone exit 
   postpone then ; immediate
: special+xt
   ' postpone literal postpone over postpone = postpone if
      postpone drop postpone ncell>t 
      [char] , postpone literal postpone emit
      postpone ncell>t postpone exit  
   postpone then ; immediate
: cell>t ( a-addr1 -- a-addr2 )
   dup @   
   special+lit dolit
   special+lit do?do
   special+lit doloop
   special+lit do+loop
   special+lit donext
   special+lit 0branch
   special+lit branch
   special+lit do?throw
   special+xt (compile)
   special+xt xtof
   drop ncell>t ;
: type? 
   postpone name>xt postpone ?dodefine postpone nip
   ' postpone literal postpone = ; immediate compile-only
: colon? ( nfa -- flag)
   type? dolist ;
: var? ( nfa -- flag)
   type? dovar ;
: con? ( nfa -- flag)
   type? doconst ;
: user? ( nfa -- flag)
   type? douser ;
: val? ( nfa -- flag)
   type? dovalue ;
: lastbody ( -- addr)
   lasthead var?
   lasthead user? or 
   lasthead con? or 
   lasthead var? or 
   lasthead colon? or
   lasthead val? or 
   if lastxt ?dodefine drop else lastxt >body then ;
: marker ( "name" -- , simplified marker word, enough for our purposes)
   here get-current @ create , , 
does> 
   dup @ get-current ! cell+ @ to here ;
: user variable ;

\ Undefined
create dummy2

