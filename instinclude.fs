libc _realpath ptr ptr (ptr) realpath

: realpath ( addr len -- )
   0term pad _realpath dup 0= -37 ?throw 0count ;

: file-exists? ( addr len -- flag )
   r/o open-file 0= if close-file throw 1 then ;

\ Convert relative path to installation-relative path
: >inst ( addr len -- addr' len' )
   0 arg pad place s" /../../share/fina/" pad append
   pad append pad count realpath ;

:noname
   2dup file-exists? 0= if >inst then deferred inchook0 ; is inchook0
