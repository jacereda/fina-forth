
32        constant tcellbits
8         constant /tcall

: .cell ."  .long " ;
: .call" 
   s"  nop" postpone sliteral postpone type postpone cr
   s"  nop" postpone sliteral postpone type postpone cr
   s"  nop" postpone sliteral postpone type postpone cr
   s"  call XT_" postpone sliteral postpone type 
   [char] " parse postpone sliteral postpone type  
   postpone cr ; immediate

: .align ."  .p2align 2" cr ;

: .init
   ."  .globl Forth_Entry " cr 
   ."  .globl Forth_UserP" cr 
   ."  .globl Forth_Here" cr 
   ."  .globl Forth_End" cr 
   ."  .globl _Forth_Entry " cr 
   ."  .globl _Forth_UserP" cr 
   ."  .globl _Forth_Here" cr 
   ."  .globl _Forth_End" cr 
   ."  .data" cr
   .align
   ."  .long -17974594, -559038737" cr
   ." _Forth_Entry:" cr
   ." Forth_Entry:" cr
   ."  .long XT_COLD" cr
   ." _Forth_UserP:" cr
   ." Forth_UserP:" cr
   ."  .long XT_USERP" cr
   ." _Forth_Here:" cr
   ." Forth_Here:" cr
   ."  .long XT_HERE" cr ;

: .end 
   ." _Forth_End:" cr
   ." Forth_End:" cr ;
