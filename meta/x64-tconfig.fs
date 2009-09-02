
64        constant tcellbits
8         constant /tcall

: .cell ."  .quad " ;
: .call" 
   s"  nop" postpone sliteral postpone type postpone cr
   s"  nop" postpone sliteral postpone type postpone cr
   s"  nop" postpone sliteral postpone type postpone cr
   s"  call XT_" postpone sliteral postpone type 
   [char] " parse postpone sliteral postpone type  
   postpone cr ; immediate

: .align ."  .p2align 3" cr ;

: .init
   ."  .globl Forth_Entry " cr 
   ."  .globl Forth_UserP" cr 
   ."  .globl Forth_Here" cr 
   ."  .globl _Forth_Entry " cr 
   ."  .globl _Forth_UserP" cr 
   ."  .globl _Forth_Here" cr 
   ."  .text" cr
   .align
   ."  .quad 0xfeedbabe, 0xdeadbeef" cr
   ." _Forth_Entry:" cr
   ." Forth_Entry:" cr
   ."  .quad XT_COLD" cr
   ." _Forth_UserP:" cr
   ." Forth_UserP:" cr
   ."  .quad XT_USERP" cr
   ." _Forth_Here:" cr
   ." Forth_Here:" cr
   ."  .quad XT_HERE" cr ;

: .end ;
