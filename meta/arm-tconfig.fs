
32        constant tcellbits
8         constant /tcall

: .cell ."  .long " ;
: .call"
   s"  bl XT_" postpone sliteral postpone type
   [char] " parse postpone sliteral postpone type 
   postpone cr ; immediate
: .align
   ."  .align 2" cr ;
: .init
   ."  .globl Forth_Entry " cr 
   ."  .globl _Forth_Entry " cr 
   ."  .globl Forth_UserP" cr 
   ."  .globl _Forth_UserP" cr 
   ."  .globl Forth_Here" cr 
   ."  .globl _Forth_Here" cr 
   ."  .globl Forth_End" cr 
   ."  .globl _Forth_End" cr 

   ."  .data" cr
   .align
   ."  .long -17974594, -559038737" cr
   ." Forth_Entry:" cr
   ." _Forth_Entry:" cr
   ."  .long XT_COLD" cr
   ." Forth_UserP:" cr
   ." _Forth_UserP:" cr
   ."  .long XT_USERP" cr
   ." Forth_Here:" cr
   ." _Forth_Here:" cr
   ."  .long XT_HERE" cr ;
   
: .end 
   ." _Forth_End:" cr
   ." Forth_End:" cr ;



