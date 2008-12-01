expose-module private
libc system ptr (int) system
: (sh) 0term system throw ;
: sh" 
   [char] " parse postpone sliteral postpone (sh) ; immediate compile-only
: sh 0 parse (sh) ;
export sh sh" (sh)
end-module
