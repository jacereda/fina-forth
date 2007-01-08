: 0count dup -1 0 scan drop over - ;

\g Returns number of command-line arguments
: #args argc ;

\g Returns command-line argument
: arg ( n -- c-addr u )  cells argv + @ 0count ;
