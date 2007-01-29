variable sourcename 0 ,  :noname s" *terminal*" ; execute sourcename 2!
0 value sourceline#
variable errorname 0 ,
0 value errorline#

: sourcefilename 
   sourcename 2@ ;

:noname ( throwcode -- throwcode )
   dup errorline# 0= and if 
      sourcefilename errorname 2!
      sourceline# to errorline# 
   then ; is .error!

:noname ( throwcode -- )
   dup 1 -1 within if 
      errorname 2@ type [char] : emit 
      errorline# 0 (d.) type ." : "
   then 0 to errorline#
   deferred .error ; is .error

:noname  ( 0 -- xn ... x1 n )
   sourceline# stksave
   sourcefilename 2stksave 
   deferred inputsaver ; is inputsaver


:noname  ( xn ... x1 n -- flag )
   deferred inputrestorer
   2stkrest sourcename 2! 
   stkrest to sourceline# ; is inputrestorer

:noname ( -- )
   s" *evaluate*" sourcename 2!  0 to sourceline# ; is evalhook 
