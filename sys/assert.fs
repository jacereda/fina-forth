expose-module private
: assert( ; immediate
: .input ( -- )
    cr ." input: " sourcevar 2@ type ;
: (endassert)
    0= abort" assertion failed" ;
: ) 
    postpone (endassert) ; immediate
export assert( )
end-module
