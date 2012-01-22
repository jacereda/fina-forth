: c+! ( n addr -- )
   >r r@  c@ +  r> c! ;

: append ( str len cstr -- )
    2dup 2>r  count chars +  swap chars move  2r> c+! ;

