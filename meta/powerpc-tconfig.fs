32 constant tcellbits
4 constant /tcall

: .cell ."  .long " ;
: .call ."  bl XT_" ;
: .align ."  .p2align 2" cr ;
: .init ;
: .end ;
