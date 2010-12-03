
32        constant tcellbits
8         constant /tcall

: .cell ."  .long " ;
: .call ."  nop" cr ."  nop" cr ."  nop" cr ."  call XT_" ;
: .align ."  .p2align 2" cr ;
: .init ;
: .end ;
