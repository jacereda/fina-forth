
32        constant tcellbits
8         constant /tcall

: .cell ."  .long " ;
: .call"
   s"  bal XT_" postpone sliteral postpone type
   [char] " parse postpone sliteral postpone type 
   postpone cr 
   s"  nop " postpone sliteral postpone type 
   postpone cr ; immediate
: .align
   ."  .balign 4" cr ;
: .init
   ." .set noreorder" cr
   ." .set noat" cr
   ." .set nomacro" cr

   ."  .globl Forth_Entry " cr 
   ."  .globl Forth_UserP" cr 
   ."  .globl Forth_Here" cr 
   ."  .globl Forth_End" cr 

   ."  .data" cr
   .align
   ."  .long -17974594, -559038737" cr
   ." Forth_Entry: .long XT_COLD" cr
   ." Forth_UserP: .long XT_USERP" cr
   ." Forth_Here: .long XT_HERE" cr ;
   
: .end
   ." Forth_End:" cr 
   ." .set reorder" cr
   ." .set at" cr
   ." .set macro" cr ;


