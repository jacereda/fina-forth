variable sizeof
\g Start structure definition
: structure ( "name" -- )
   get-current  wordlist dup (namespace) set-current 
   get-current +order
   sizeof off ;

\g Define structure field
: field ( size "name" -- )
   create sizeof @ , sizeof +! does> @ + ;

\g Terminate structure definition
: /structure ( "name" -- )
   previous
   set-current  create  sizeof @ ,  does>  @ * ;

1 [if]
structure 2dpoint
   1 cells field x
   1 cells field y
: init ( x y p -- )  tuck y ! x ! ;
: immtest ." Immediate word executed" ; immediate
/structure 2dpoints

create p0 1 2dpoints allot
10 20  p0 2dpoint init
:noname 10 20  p0 2dpoint init ; execute
:noname 2dpoint immtest ; drop

structure area
   1 2dpoints field ul
   1 2dpoints field lr
: init ( x0 y0 x1 y1 p -- ) >r  r@ lr 2dpoint init  r> ul 2dpoint init ;
/structure areas

create a0 1 areas allot
10 20 30 40  a0 area init
[then]
