\ XXX
require backtrace.fs

variable assert-level 
1 assert-level !
: assertn 
    assert-level @ > if postpone ( then ;
: assert0( 
    0 assertn ; immediate 
: assert1(
    1 assertn ; immediate
: assert2(
    2 assertn ; immediate
: assert3(
    3 assertn ; immediate
: assert(
    postpone assert1( ; immediate
: .input ( -- )
    cr ." input: " sourcevar 2@ type ;
: (endassert)
    0= if 
        cr ." ERROR: assertion failed" .input .stacks abort 
    then ;
: ) 
    postpone (endassert) ; immediate
