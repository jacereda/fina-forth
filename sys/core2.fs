\g @see anscore
: 2>r  ( d --  r: -- d )
   swap r> swap >r swap >r >r ;

\g @see anscore
: 2r>  ( -- d  r: d -- )
   r> r> swap r> swap >r swap ;

: stksave ( n*x n val -- n*x+1 n+1 )
   swap 1+ ;

: 2stksave 
   >r stksave r> stksave ;

: stkrest ( n*x+1 n+1 -- n*x n val )
   1- swap ;

: 2stkrest
  stkrest >r stkrest r> ;

defer inputsaver
:noname
   source 2stksave
   >in @ stksave 
   source-id stksave ; is inputsaver

defer inputrestorer
:noname
   stkrest to source-id 
   stkrest >in ! 
   2stkrest sourcevar 2! ; is inputrestorer

\g @see anscore
defer save-input  ( -- xn ... x1 n )
: save-input
   0 inputsaver ;

\g @see anscore
: restore-input  ( xn ... x1 n -- flag )
   inputrestorer ;

\g Save n items to return stack
: n>r ( n1 .. nn n -- )
   0 begin 2dup <> while rot r> 2>r 1+ repeat drop r> swap >r >r ;

\g Restore n items from return stack
: nr> ( -- n1 .. nn n )
   r> r> swap >r 0 begin 2dup <> while 2r> >r -rot 1+ repeat drop ;

:noname source-id if  0  else  deferred refill  then ;

\g @see anscore
is refill

defer evalhook ( -- ) 
' noop is evalhook

\g @see anscore
: evaluate  ( i*x c-addr u -- j*x )
   save-input n>r
   -1 to source-id  sourcevar 2!  >in off 
   evalhook
   ['] interpret catch .error!
   nr> restore-input -37 ?throw 
   throw ;
