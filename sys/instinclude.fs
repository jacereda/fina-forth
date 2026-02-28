expose-module private

: pad' pad 256 + ;

\g Returns absolute program name
: dirname ( c-addr1 len1 -- c-addr2 len2 )
  pad place
  pad count bounds swap ?do
     i c@ [char] / = if  0 i c!  i pad - 1- pad c!  leave  then
  -1 +loop pad count ;

\g Determines existence of a file by opening it for read
: file-exists? ( addr len -- flag )
   r/o open-file unless close-file throw 1 then ;

: progname' ( -- c-addr len )
  0 arg s" /" search nip nip if
    s" realpath '"
  else
    s" which '"
  then
  pad place  0 arg pad append  s" '" pad append
  pad count pad 256 pipeto ;

\g Returns absolute program name
: progname ( -- c-addr len )
  exename0 dup if
     0count
  else
     drop progname'
  then ;

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
