
64        constant tcellbits
8         constant /tcall

: .cell ."  .quad " ;
: .call ."  nop" cr ."  nop" cr ."  nop" cr ."  call XT_" ;
: .align ."  .p2align 3" cr ;
: .init ;
: .end ;
