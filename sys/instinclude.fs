libc 0dirname ptr (ptr) dirname
libc 0realpath ptr ptr (ptr) realpath

\g Returns directory part of a path
: dirname ( addr len -- addr' len' )
   0term 0dirname dup 0= -37 ?throw 0count ;

\g Determines existence of a file by opening it for read
: file-exists? ( addr len -- flag )
   r/o open-file 0= if close-file throw 1 then ;

\g Returns absolute program name
: progname ( -- addr len )
   0 arg drop 0buffer 0realpath \ args are already 0-terminated
   s" which " pad place  0buffer 0count pad append
   pad count pad 256 pipeto ;

\g Returns absolute installation path
: instpath ( -- addr len )
   progname dirname dirname pad place 
   s" /" pad append pad count ;

\g Convert installation-relative path to absolute path
: >inst ( addr len -- addr' len' )
   instpath pad place pad append pad count ;

\g Convert share-relative path to absolute path
: >share ( addr len -- addr' len' )
   s" share/fina/" >inst pad place pad append pad count ;

\ If included file doesn't exist, we lookup in share dir
:noname
   2dup file-exists? 0= if >share then deferred inchook0 ; is inchook0
