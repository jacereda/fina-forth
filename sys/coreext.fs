-1 
\g @see anscore
constant true ( -- -1 )

0
\g @see anscore
constant false ( -- 0 )


\g @see anscore
: hex ( -- )
   16 base ! ;

\g @see anscore 
: unused ( -- u )
   pad here - ;

\g @see anscore
: 2>r  ( d --  r: -- d )
   swap r> swap >r swap >r >r ;

\g @see anscore
: 2r>  ( -- d  r: d -- )
   r> r> swap r> swap >r swap ;

\g Runtime for C"
: doc" ( -- c-addr )
   r> count over + aligned >r [ -1 chars ] literal + ; compile-only

\g Compile a counted string literal
: csliteral ( c-addr u -- )
   postpone doc" s, align ; immediate compile-only 

\g #see anscore    
: c"  ( <string>" --  rt: -- c-addr )
   [char] " parse   postpone csliteral ; immediate compile-only

\g @see anscore
: query ( -- )
   source-id 0 to source-id refill drop to source-id ;

\g @see anscore
: #tib ( -- a-addr )
   source nip ;

\g @see anscore
: .(  ( -- )
   [char] ) parse type ; immediate

\g @see ansdouble
: d.r ( d n -- )
   >r (d.)  r> over - spaces  type ;

\g @see anscore
: .r ( n1 n2 -- )
   >r s>d r> d.r ;

\g @see anscore
: u.r ( u n -- )
   >r 0 r> d.r ;

\g @see anscore
: 2r@ ( -- x1 x2  r: x1 x2 -- x1 x2 )
   r> rp@ swap >r 2@ ;

\g @see anscore
: case ( ct: -- 0 3 )
   0 3  1 bal +! ; immediate compile-only

\g @see anscore
: of  ( ct: -- orig 2 )
   postpone over postpone = 
   postpone if postpone drop 1+ ; immediate compile-only

\g @see anscore
: endof ( ct: orig 2 -- orig 2 )
   1- postpone else 1+ ; immediate compile-only

\g @see anscore
: endcase ( ct: 0 3 orig1 2 orig2 2 ... orign 2 -- )
   postpone drop begin
      dup 2 =
   while
      1- postpone then
   repeat  3 <> -22 ?throw drop  
   -1 bal +! ; immediate compile-only

\g @see anscore
: convert  ( ud1 c-addr1 -- ud2 c-addr2 )
   char+ true >number drop ;

\g @see anscore
: erase ( c-addr u -- )
   0 fill ;

\g @see anscore
: expect ( c-addr +n -- )
   accept ;

\g @see anscore
: roll ( xu xu-1 ... x0 u -- xu-1 ... x0 xu )
    depth dup 2 < -4 ?throw
    2 - over u< -4 ?throw
    dup 1+ pick >r >r
    sp@ dup cell+ r> cells move drop r> ;

\g @see anscore
: tuck ( x1 x2 -- x2 x1 x2 )
   swap over ;

\g @see anscore
: marker
    here
    create , get-current ,
    forth-wordlist                        \ start of wordlist link
    begin cell+ dup @ while @ repeat      \ find end of wordlist link
    , get-order dup , 0 do , loop
does>     dup @ to here
    cell+ dup @ set-current
    cell+ dup @ 0 swap !                  \ restore end of wordlist link
    cell+ dup @ dup >r cells + r@ 0 do dup @ swap cell- loop
    drop r> set-order     \ restore search order
    forth-wordlist    \ start of wordlist link
    begin dup @       \ last word name field of wordlist
        begin  dup here u>
        while  cell- @
        repeat over !       \ restore search order pointer
        cell+ @ ?dup 0=     \ repeat to next wordlist
    until ;

\g @see anscore
: [compile]  ( "<spaces>name" -- )
   ' compile, ; immediate compile-only

\g @see anscore
defer save-input  ( -- xn ... x1 n )
:noname
   source  >in @  source-id 4 ; is save-input

\g @see anscore
defer restore-input  ( xn ... x1 n -- flag )
:noname
   dup 4 = if
      drop to source-id >in ! sourceVar 2!  0
   else 
      0 ?do drop loop  -1 
   then ; is restore-input


env: core-ext true ;env

