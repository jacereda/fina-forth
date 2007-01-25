libc _realpath ptr ptr (ptr) realpath
libc _dirname ptr (ptr) dirname

: realpath ( addr len -- addr' len' )
   0term pad _realpath dup 0= -37 ?throw 0count ;

: dirname ( addr len -- addr' len' )
   0term _dirname dup 0= -37 ?throw 0count ;

: file-exists? ( addr len -- flag )
   r/o open-file 0= if close-file throw 1 then ;

: instpath ( -- addr len )
   0 arg realpath dirname dirname pad place 
   s" /" pad append pad count ;

: >inst ( addr len -- addr' len' )
   instpath pad place pad append pad count ;

\ Convert relative path to installation-relative path
: >share ( addr len -- addr' len' )
   s" share/fina/" >inst pad place pad append pad count ;

:noname
   2dup file-exists? 0= if >share then deferred inchook0 ; is inchook0
