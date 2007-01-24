\g @see ansfile
: file-status ( c-addr u -- x ior )
   statf ;

\g @see ansfile
: rename-file ( c-addr1 u1 c-addr2 u2 -- ior )
   renf ;

\g @see ansfile
: flush-file  ( fileid -- ior )
   flushf ;

:noname ( -- flag )
   source-id -1 = if 0 exit then
   source-id 0= if deferred refill exit then
   line /line source-id read-line throw if
         line swap sourcevar 2!  >in off  true 
   else 2drop false then ; 

\g @see ansfile
is refill ( -- flag )


env: file-ext true ;env
