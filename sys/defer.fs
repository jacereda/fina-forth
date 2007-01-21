:noname -1 abort" deferred word not initialized" ; pad !

: defer ( "<spaces>name" -- )
   create [ pad @ ] literal , does> @ execute ;

: is ( xt "<spaces>name" -- )
   ' >body state @ if postpone literal postpone ! else ! then ; immediate

: what's ( "<spaces>name" -- )
   ' >body @ ;

: deferred ( "<spaces>name" -- )
   what's compile, ; immediate compile-only 
