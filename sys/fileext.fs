expose-module private
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
   filesource? if  line>source  else  deferred refill  then ;

\g @see ansfile
is refill ( -- flag )

env: file-ext true ;env

export : file-status rename-file flush-file

end-module
