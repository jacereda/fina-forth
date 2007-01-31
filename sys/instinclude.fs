libc 0dirname ptr (ptr) dirname

: dirname ( addr len -- addr' len' )
   0term 0dirname dup 0= -37 ?throw 0count ;

: file-exists? ( addr len -- flag )
   r/o open-file 0= if close-file throw 1 then ;

: progname ( -- addr len )
   s" which " pad place  0 arg pad append
   pad count pad 256 pipeto ;

: instpath ( -- addr len )
   progname dirname dirname pad place 
   s" /" pad append pad count ;

: >inst ( addr len -- addr' len' )
   instpath pad place pad append pad count ;

\ Convert relative path to installation-relative path
: >share ( addr len -- addr' len' )
   s" share/fina/" >inst pad place pad append pad count ;

:noname
   2dup file-exists? 0= if >share then deferred inchook0 ; is inchook0
