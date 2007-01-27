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
   source-id -1 1 within if  
      deferred refill
   else  line>source then ;

\g @see ansfile
is refill ( -- flag )


env: file-ext true ;env
