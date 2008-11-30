require struct.fs
require ns.fs

{ -> }

struct
   1 cells field x
   1 cells field y
   1 cells field z
/struct v3
{ -> }
{ here x -> here }
{ here y -> here cell+ }
{ here z -> here cell+ cell+ }

struct ns 2dpoint
   1 cells field x
   1 cells field y
: init ( x y p -- )  tuck y ! x ! ;
: immtest ." Immediate word executed" ; immediate
/ns /struct 2dpoints

{ -> }
{ here 2dpoint x -> here }
{ here 2dpoint y -> here cell+ }
{ 2dpoint immtest -> }

{ create p0 1 2dpoints allot -> }
{ 10 20  p0 2dpoint init -> }
{ :noname 10 20  p0 2dpoint init ; execute -> }
{ :noname 2dpoint immtest ; drop -> }

struct ns area
   1 2dpoints field ul
   1 2dpoints field lr
: init ( x0 y0 x1 y1 p -- ) >r  r@ lr 2dpoint init  r> ul 2dpoint init ;
/ns /struct areas

{ create a0 1 areas allot -> }
{ 10 20 30 40  a0 area init -> }
{ a0 area ul 2dpoint x @ -> 10 }
{ a0 area ul 2dpoint y @ -> 20 }
{ a0 area lr 2dpoint x @ -> 30 }
{ a0 area lr 2dpoint y @ -> 40 }
