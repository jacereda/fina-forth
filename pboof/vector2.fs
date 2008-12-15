object clone vector2
vector2 extend
1 cells member x  x off
1 cells member y  y off
: pack ( x y -- ) y ! x ! ;
: unpack ( -- x y ) x @ y @ ;
: -unpack ( -- -x -y ) x @ negate y @ negate ;
extended
