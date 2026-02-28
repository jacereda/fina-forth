64 constant tcellbits
8 constant /tcall

: .cell ."  .xword " ;
: .call ."  nop; bl XT_" ;
: .align ."  .p2align 3" cr ;
: .init ;
: .end ;
