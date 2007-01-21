warnings off
: immediate
   lastname c@ 64 or lastname c! ;

: \ 
   source >in ! drop ; immediate

: \g postpone \ ; immediate

: compile-only
   lastname c@ 32 or lastname c! ;

: char  
   parse-word drop c@ ;

: [char] 
   char postpone literal ; immediate compile-only

: (  
   [char] ) parse 2drop ; immediate


\g @see anscore
\ immediate ( -- )

\g @see anscore
\ \  ( "ccc<eol>"-- )

\g Mark last word as compile-only
\ compile-only ( -- )

\g @see anscore
\ char  ( "<spaces>name" -- char )

\g @see anscore
\ [char]  ( ct: "<spaces>name" --  rt: -- char ) 

\g @see anscore
\ (  ( "ccc<paren>" -- )

\ Misc

\g Make last definition a compile-only word
\ compile-only ( -- )

\g @see anscore
: chars  ( n1 -- n2 )
   ; immediate

\g Convert address units to chars
: 1chars/  ( n1 -- n2 )
   ; immediate

\g @see anscore
: [']  ( "  xxx"" --  rt: -- xt )
   ' postpone literal ; immediate compile-only

\g Runtime for s" 
: dos"  ( -- c-addr u )
   r> count 2dup + aligned >r ; compile-only

\g @see ansstring
: sliteral ( c-addr u -- )
   postpone dos" s, align ; immediate compile-only 

\g @see anscore
: s"  ( "ccc<quote>" --  rt: -- c-addr u )
   [char] " parse   postpone sliteral ; immediate compile-only


\g @see anscore
: ."  ( "ccc<quote>" --  rt: -- )
   [char] " parse   postpone sliteral 
   postpone type ; immediate compile-only


\ Exceptions

\g Throw code if flag is true. Changes the runtime of the previous
\g literal to DO?THROW. 
\g Sample usage: "dup something <> -32 ?throw"
: ?throw ( -- )
   ['] do?throw here 2 cells - ! ; immediate compile-only

\ Flow control

\g Mark the start of a backwards jump
: bwmark
   here 1 bal +! -1 ;

\g Mark the start of a forward jump
: fwmark
   here -1414673666 , 1 bal +! 1 ;

\g Resolve backwards jump
: bwresolve
   -1 <> -22 ?throw  -1 bal +!
   here - , ;

\g Resolve forward jump
: fwresolve
   1 <> -22 ?throw  -1 bal +!
   here over - swap ! ;

\g @see anstools
: ahead  ( -- a-addr 1 )
   postpone branch   fwmark ;  immediate compile-only

\g @see anscore
: if  ( -- a-addr 1 )
   postpone 0branch   fwmark ; immediate compile-only

\g @see anscore
: then ( a-addr 1 -- )
   fwresolve ; immediate compile-only

\g @see anscore
: else ( a-addr1 1 -- a-addr2 1 )
   postpone ahead  2swap  postpone then ; immediate compile-only

\g @see anscore
: begin  ( -- a-addr -1 )
   bwmark ; immediate compile-only

\g @see anscore
: while ( a-addr1 -1 -- a-addr2 1 a-addr1 -1 )
   postpone if   2swap ; immediate compile-only 

\g @see anscore
: again ( a-addr -1 -- )
   postpone branch  bwresolve ; immediate compile-only

\g @see anscore
: repeat ( a-addr1 1 a-addr2 -1 -- )
   postpone again  postpone then ; immediate compile-only

\g @see anscore
: until ( a-addr -1 -- )
   postpone 0branch  bwresolve ; immediate compile-only

\ Definers

\g Check for compiler nesting
: nesting? ( -- )
   bal @ -29 ?throw ;

\g @see anscore
: constant ( x "<spaces>name" --  rt: -- x )
   nesting?  head,  ['] doconst xt, drop  , linklast ;


\g @see anscore
: value ( x "name" -- rt: -- x )
   nesting?  head,  ['] dovalue xt, drop  , linklast ;

\g @see anscore
: variable ( "<spaces>name" -- ) 
   nesting?  head, ['] dovar xt, drop  -559038737 , linklast ; 

variable leaves

\g Link item to list
: link ( item list -- )
    2dup @ swap ! ! ;

\g Allocate space for a link field and link it to list
: linked ( list -- , enlaza here a la lista)
    here 0 , swap link ;

\g Start for-next loop, will iterate count+1 times
: for ( ct: -- dest -1  rt: count -- r: u1 u1 )
   postpone dofor  bwmark  leaves off ; immediate compile-only

\g @see anscore
: do ( ct: -- dest -1  rt: end start -- r: -- start end )
   postpone dodo  bwmark   leaves off ; immediate compile-only

\g @see anscore
: ?do ( ct: -- dest -1  rt: end start -- r: -- start end )
   postpone do?do leaves off leaves linked bwmark ; immediate compile-only

\g @see anscore
: leave ( r: limit index -- )
   postpone branch  leaves linked ;  immediate compile-only

\g Apply xt to each element in list
: foreach ( xt list -- )
   swap >r @ >r 
   begin r@ while r> r@ over @ >r execute repeat
   rdrop rdrop ;

\g Syntactic sugar for FOREACH
: forall ( "list" "word" -- , azucar para foreach )
   @r+ execute @r+ swap foreach ; compile-only

: resolvleave ( a-addr -- )
   here over - swap ! ;

\g @see anscore
: loop ( ct: dest -1  rt:  --  r: limit index --  | limit index+1 )
   postpone doloop  bwresolve  
   forall leaves resolvleave
   postpone unloop ; immediate compile-only

\g Terminate for-next loop
: next ( ct: dest -1  rt: initial index --  | initial index-1 )
   postpone donext  bwresolve
   forall leaves resolvleave
   postpone unloop ; immediate compile-only

\g @see anscore
: +loop ( ct: dest -1  rt: n --  r: limit index --  | limit index+n )
   postpone do+loop  bwresolve
   forall leaves resolvleave
   postpone unloop ; immediate compile-only

\g @see anscore
: recurse ( ct: -- )
   bal @ 1- 2* pick -1 <> throw 
   bal @ 1- 2* 1+ pick compile, ; immediate compile-only

\g @see anscore
: abort ( i*x --  r: j*x -- )
   -1 throw ;

\g Runtime for ABORT"
: (abort")
   if r> count abort"msg 2! -2 throw else r> count + aligned >r then ;

\g @see anscore
: abort"
   postpone (abort") [char] " parse s, align ; immediate compile-only


\ Definers
' quit dup ?dodefine drop swap - constant /call

\g @see anscore
: to
   ' ?dodefine ['] dovalue <> -32 ?throw
   state @ if postpone doto /call - , else ! then ;  immediate

\g @see anscore
: create ( "<spaces>name" --  R: -- a-addr  )
   nesting?  head, ['] docreate xt, drop  ['] noop , linklast ;

\g @see anscore
: >body ( xt -- a-addr )
   ?dodefine ['] docreate <> -31 ?throw
   cell+ ; 

\g Connect latest word to the DOES> code
: pipe ( --  R: xt -- )
   lastname name>xt >body cell- r> swap ! ;

\g Compile call to inline xt into current colon def
: (xt,)  ( -- xt ) 
   @r+ xt, ;  

\g @see anscore
: does> ( C: colon-sys1 -- colon-sys2 )
   nip -1 <> bal @ 1 <> or -22 ?throw
   (compile) pipe (xt,) dolist -1 ; immediate compile-only

\ 

\g @see anscore
: c,  ( char -- )
   here c! 1 allot ;


\g @see anscore
: decimal  ( -- )
   10 base ! ;

\g @see anscore
: u.  ( u -- )
   0 d. ;

\g @see anscore
: evaluate  ( i*x c-addr u -- j*x )
   source >r >r >in @ >r source-id >r 
   -1 to source-id  sourcevar 2!  >in off 
   interpret
   r> to source-id  r> >in !  r> r> sourcevar 2! ;

\g @see anscore
: word  ( char "<chars>ccc<char>" -- c-addr )
   here swap skipparse s, dup to here ;

\g @see anscore
: find  ( a -- a 0 | xt 1 | xt -1 )
   count nfa if fxt fimmed else parsed cell+ @ -1 chars + 0 then ; 

\g @see anscore
: sm/rem  ( d n1 -- n2 n3 )
   2dup xor >r over >r >r dup 0< if dnegate then 
   r> abs um/mod
   r> 0< if swap negate swap then
   r> 0< if negate 0 over < -11 ?throw exit then
   dup 0< -11 ?throw ;

\g @see anscore
: */mod  ( n1 n2 n3 -- n4 n5 )
   >r m* r> fm/mod ;


\g @see anscore
: */  ( n1 n2 n3 -- n4 )
   */mod nip ;

\g @see ansfacility
: ekey>char
   255 and ;

\g @see anscore
: key  ( -- char )
   ekey ekey>char ;

\g @see anssearch
: set-current  ( wid -- )
   to get-current ;

create env-wordlist here forth-wordlist cell+ ! 0 , 0 , 0 ,

\g @see anssearch
: search-wordlist ( c-addr u wid -- 0 | xt 1 | xt -1 )
   nfain if  fxt fimmed  else 0 then ;

\g @see anscore
: environment? ( c-addr u -- false | i*x true )
   env-wordlist search-wordlist dup >r if execute then r> ;

\g Define a new environment query
: env: 
   get-current env-wordlist set-current : ;

: ;env
   postpone ; set-current ; immediate compile-only

env: /counted-string 255 ;env

env: /hold 255 ;env

env: /pad [ tib pad - ] literal ;env

env: address-units-bits 1 cells 8 * ;env

env: floored -1 2 / 0<> ;env

env: max-char 255 ;env

env: max-d -1. 1 rshift ;env

env: max-n -1 1 rshift ;env

env: max-u -1 ;env

env: max-ud -1. ;env

env: return-stack-cells [ rp0 @ sp0 @ - ] literal ;env

env: stack-cells [ sp0 @  pad -  tib pad -  - ] literal ;env

env: core -1 ;env
