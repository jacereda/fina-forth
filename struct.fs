\g Start structure definition
: struct ( -- sizeof )
   0 ;

\g Define structure field
: field ( prevsizeof size "name" -- sizeof )
   create over , + does> @ + ;

\g Terminate structure definition
: /struct ( sizeof "name" -- )
   create ,  does>  @ * ;

1 [if]

struct
   1 cells field x
   1 cells field y
   1 cells field z
/struct v3

struct ns 2dpoint
   1 cells field x
   1 cells field y
: init ( x y p -- )  tuck y ! x ! ;
: immtest ." Immediate word executed" ; immediate
/ns /struct 2dpoints

create p0 1 2dpoints allot
10 20  p0 2dpoint init
:noname 10 20  p0 2dpoint init ; execute
:noname 2dpoint immtest ; drop

struct ns area
   1 2dpoints field ul
   1 2dpoints field lr
: init ( x0 y0 x1 y1 p -- ) >r  r@ lr 2dpoint init  r> ul 2dpoint init ;
/ns /struct areas

create a0 1 areas allot
10 20 30 40  a0 area init
[then]
