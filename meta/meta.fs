\ Helpers
char ' parse #include "asmarch.h"' type cr
: .call ."  ASMCALL XT_" ;
: .cell ."  ASMCELL " ;
: .align ."  ASMALIGN" cr ;
: global
   ."  .globl " 2dup type cr
   type ." :" cr ;

: literal postpone literal ; immediate compile-only
: under+ rot + swap ;
: 2>r postpone swap postpone >r postpone >r ; immediate compile-only
: 2r> postpone r> postpone r> postpone swap ; immediate compile-only
: [char] bl parse drop c@ postpone literal ; immediate compile-only
: h# ( <hexnum> -- u )
    0 0 bl parse
    16 based >number
    0= invert -24 and throw 2drop
    state @ if  postpone literal  then
    ; immediate
: c+!  ( n addr -- )
   >r r@  c@ +  r> c! ;
: append ( str len addr -- )
   2dup 2>r  count chars +  swap chars move ( ) 2r> c+! ;
: len c@ 31 and ;
: lex c@ 127 and ;
: namecount count 31 and ;
variable options
: case options off ; immediate compile-only
: of
   1 options +!
   postpone over postpone =
   postpone if postpone drop ; immediate compile-only
: endof
   postpone else ; immediate compile-only
: endcase
   postpone drop options @ 0 ?do postpone then loop ; immediate compile-only
: align begin here aligned 0= while 0 c, repeat ;
: ,"
   [char] " parse here over 1 chars + allot place align ;
: asmtype
   bounds do
      i c@ toupper case
        [char] @ of ." FETCH"    endof
        [char] ! of ." STORE"    endof
        [char] > of ." GT"       endof
        [char] < of ." LT"       endof
        [char] ? of ." Q"        endof
        [char] + of ." PLUS"     endof
        [char] - of ." MINUS"    endof
        [char] * of ." STAR"     endof
        [char] / of ." SLASH"    endof
        [char] \ of ." BSLASH"   endof
        [char] = of ." EQUALS"   endof
        [char] # of ." NUMBER"   endof
        [char] [ of ." LBRACKET" endof
        [char] ] of ." RBRACKET" endof
        [char] ( of ." LPAREN"   endof
        [char] ) of ." RPAREN"   endof
        [char] . of ." DOT"      endof
        [char] , of ." COMMA"    endof
        [char] " of ." QUOTE"    endof
        [char] 0 of ." ZERO"     endof
        [char] 1 of ." ONE"      endof
        [char] 2 of ." TWO"      endof
        [char] 3 of ." THREE"    endof
        [char] 4 of ." FOUR"     endof
        [char] 6 of ." SIX"      endof
        [char] 8 of ." EIGHT"    endof
        [char] ' of ." TICK"     endof
        [char] $ of ." DOLLAR"   endof
        [char] : of ." COLON"    endof
        [char] ; of ." SEMI"     endof
        [char] & of ." AND"      endof
        dup emit
      endcase
   loop ;
: xttype ." XT_" asmtype ;
: asm. . ; \ ." 0x" 16 based repr type ;

\ Metacompiler constants
32 constant compo
64 constant immed


\ Target dictionary
0 value tlastname

: taligned ( u1 -- u2, align value to target cells )
   1 tcells 1- + 1 tcells negate and ;

variable size
5 tcells size ! \ For the header in *-tconfig.fs
variable fsize fsize off
variable msize msize off
variable ffsize ffsize off
variable fxsize fxsize off
variable psize psize off
variable altpsize altpsize off
size value selsize

: +body
   here lastbody -  1 cells / tcells selsize +! ;
: +bytes
   align here lastbody - taligned selsize +! ;

: .name
   namecount type ;
0 value link
: .link ( -- , emit link field)
   .cell link if ." 1b" else ." 0" then cr
   ." 1:" cr
   link 1+ to link ;
variable underscore  underscore off
: name>t ( -- )
   .align
   .link
   ."   .byte " lastname lex asm.
   lastname namecount
   bounds do ." ," i c@ asm. loop cr
   .align
   underscore @ if [char] _ emit then
   lastname namecount xttype ." :" cr
   lastname namecount nip 1+  taligned 1 tcells + selsize +! ;
: body>t
   lastbody here = if exit then
   .cell
   lastbody begin
      dup here <>
   while
      dup @ asm.
      cell+
      dup here <> if ." ," then
   repeat drop
   +body ;
: bytes>t
   align
   lastbody begin
      dup here <>
   while
      dup c@ asm.
      1+
      dup here <> if ." ," then
   repeat drop cr
   +bytes ;
: create>t ( -- )
   name>t .call ." DOCREATE" cr
   .cell ." XT_NOOP" cr body>t
   /tcall 1 tcells + selsize +! ;
: defer>t ( -- )
   name>t .call ." DOCREATE" cr
   .cell ."  XT_FETCHEXECUTE" cr body>t
   /tcall 1 tcells + selsize +! ;
: var>t ( -- )
   name>t .call ." DOVAR" cr body>t
   /tcall selsize +! ;
: bytevar>t ( -- )
   name>t .call ." DOVAR" cr ."   .byte " bytes>t
   /tcall selsize +! ;
: val>t ( -- )
   name>t .call ." DOVALUE" cr body>t
   /tcall selsize +! ;
: const>t ( -- )
   name>t .call ." DOCONST" cr body>t
   /tcall selsize +! ;

0 tcells value useroffset
: nextuser useroffset dup 1- to useroffset ;
: user>t ( -- )
   name>t
   .call ." DOUSER" cr
   .cell nextuser asm.
   /tcall 1 tcells + selsize +! ;

:noname ( a-addr1 -- a-addr2 )
   dup @ asm. cell+ ; is lit>t
:noname ( addr -- addr' , move normal cell to target)
   dup @ xt>name namecount xttype cell+ ; is ncell>t
: list>t ( -- )
   lastbody begin
      dup here <>
   while
      cell>t
      dup here <> if ." ," then
   repeat drop
   +body cr ;

: col>t ( -- )
   name>t
   .call ." DOLIST" cr
   .cell list>t
   /tcall selsize +! ;
: prim>t ( -- )
   underscore on name>t underscore off
   .cell ."  -559038737," lastname namecount xttype cr
   2 tcells selsize +! ;

: both>t ( -- )
   psize to selsize
   prim>t
   ." #else" cr
   altpsize to selsize
   col>t ;

:noname ; value type>t

0 value conditional

: forgetit
   s" forget-previous marker forget-previous" evaluate cr ;
: >t
   type>t execute
   conditional if ." #endif" cr then
   forgetit
   false to conditional
   size to selsize ;

: ?stack
   depth abort" stack error" ;

: constant' constant ;
: to' postpone to ;
: value' value ;

: cond ( c-addr len sizevar -- )
   to selsize
   ." #if " type cr true to conditional ;


: prim
   >t ?stack ['] prim>t to type>t create ;
: fprim
   prim s" BUILD_FILES" fsize cond ;
: mprim
   prim s" BUILD_ALLOCATE" msize cond ;
: ffprim
   prim s" BUILD_FFI" ffsize cond ;
: fxprim
   prim s" BUILD_FIXED" fxsize cond ;
: p:
   >t ?stack ['] both>t to type>t : s" BUILD_MOREPRIMS" 0 cond ;
: bcreate
   >t ?stack ['] bytevar>t to type>t create ;
: defer
   >t ?stack ['] defer>t to type>t create 0 , ;
: create
   >t ?stack ['] create>t to type>t create ;
: user
   >t ?stack ['] user>t to type>t user ;
: variable
   >t ['] var>t to type>t variable ;
: constant
   >t ['] const>t to type>t constant ;
: value
   >t ['] val>t to type>t value ;

: to postpone doto ; immediate compile-only

: bye
   >t
   ."  .fill " /tdict .
   ." ,1,0" cr
   .cell -892679478 . cr
   ." #if BUILD_PROFILE" cr
   s" Forth_Prof" global
      ."  .fill " /tdict 2* . ." ,1,0" cr
   ." #endif" cr
   s" Forth_End" global cr
   bye ;

: :
   >t ?stack ['] col>t to type>t : ;

marker forget-previous

:noname
   ."  .data" cr
   .init
   .cell ." -17974594, -559038737" cr
   s" Forth_Entry" global .cell ." XT_COLD" cr
   s" Forth_UserP" global .cell ." XT_USERP" cr
   s" Forth_Here" global .cell ." XT_HERE" cr
   ; execute
