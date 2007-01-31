libc 0dirname ptr (ptr) dirname
libc 0getenv ptr (ptr) getenv
libc 0setenv ptr ptr int (int) setenv

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

: 0+path ( val var -- )
   >r  r@ 0getenv ?dup if 0count else s" " then pad place
   s" :" pad append
   0count pad append
   r> pad count 0term 1 0setenv ;

\ Add our lib path to lib search path
:noname
\   s" lib/fina/" >inst 0term 0s" LD_LIBRARY_PATH" 0+path
\   s" lib/fina/" >inst 0term 0s" DYLD_LIBRARY_PATH" 0+path
   deferred coldchain ; is coldchain
