
\g Initializer for deferred words
: initdefer -1 abort" deferred word not initialized" ;

\g Create a deferred word
: defer ( "<spaces>name" -- )
   create ['] initdefer , does> @execute ;

\g Assign xt to deferred word
: is ( xt "<spaces>name" -- )
   ' >body state @ if postpone literal postpone ! else ! then ; immediate

\g Get deferred word's current xt
: what's ( "<spaces>name" -- xt )
   ' >body @ ;

\g Compile xt of deferred word's current xt
: deferred ( "<spaces>name" -- )
   what's compile, ; immediate compile-only 
