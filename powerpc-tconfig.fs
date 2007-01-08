
32        constant tcellbits
256       constant /pad
256       constant /tib
256       constant /hld
256       constant /user
512       constant /ds
512       constant /rs
256 1024 * constant /tdict
4         constant /tcall

: .call"
   s"  bl XT_" postpone sliteral postpone type 
   [char] " parse postpone sliteral postpone type  
   postpone cr ; immediate
: .align ."  .align 2" cr ;
: .init 
   ."  .globl _Forth_Entry " cr 
   ."  .globl Forth_Entry " cr 
   ."  .globl _Forth_UserP" cr 
   ."  .globl Forth_UserP" cr 
   ."  .globl _Forth_Here" cr 
   ."  .globl Forth_Here" cr 
   ."  .data" cr
   .align
   ."  .long 0xfeedbabe, 0xdeadbeef" cr
   ." _Forth_Entry:" cr
   ." Forth_Entry:" cr
   ."  .long XT_COLD" cr
   ." _Forth_UserP:" cr
   ." Forth_UserP:" cr 
   ."  .long XT_USERP" cr
   ." _Forth_Here:" cr
   ." Forth_Here:" cr
   ."  .long XT_HERE" cr
;

: .end ;
