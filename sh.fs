expose-module private
libc system ptr (int) system
: (sh?) 0term system ;
: (sh) (sh?) throw ;
: sh"
   [char] " parse postpone sliteral postpone (sh) ; immediate compile-only
: sh?"
   [char] " parse postpone sliteral postpone (sh?) ; immediate compile-only
: sh 0 parse (sh) ;
export sh sh" sh?" (sh)
end-module
