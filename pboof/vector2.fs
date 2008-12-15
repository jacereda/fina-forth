object clone vector2
vector2 extend
0 cells member xy
1 cells member y  y off
1 cells member x  x off
: pack ( x y -- ) xy 2! ;
: unpack ( -- x y ) xy 2@ ;
: -unpack ( -- -x -y ) x @ negate y @ negate ;
extended
