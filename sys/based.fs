: bexecute ( i*x xt base -- j*x, execute xt with given base)
   base @ >r  base !  catch  r> base ! throw ;

: based ( base "word" -- , execute word with given base)
   @r+ swap bexecute ;

\g print number in base 16
: hex. ( n -- ) 16 based . ;

\ Usage: 16 based repr...
: repr
   0 <# #s #> ;

