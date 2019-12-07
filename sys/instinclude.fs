expose-module private
libc 0dirname ptr (ptr) dirname

\g Returns directory part of a path
: dirname ( addr len -- addr' len' )
   0term 0dirname dup 0= -37 ?throw 0count ;

\g Determines existence of a file by opening it for read
: file-exists? ( addr len -- flag )
   r/o open-file unless close-file throw 1 then ;

\g Returns absolute program name
: progname ( -- addr len )
  s" realpath " pad place  0 arg pad append
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
   2dup file-exists? unless  >share  then
   deferred inchook0 ; is inchook0

export >share

end-module
