32 constant tcellbits
8 constant /tcall

: .cell ."  .long " ;
: .call ."  bal XT_" ;
: .align ."  .p2align 2" cr ;
: .init
   ." .set noreorder" cr
   ." .set noat" cr
   ." .set nomacro" cr ;
: .end
   ." .set reorder" cr
   ." .set at" cr
   ." .set macro" cr ;
