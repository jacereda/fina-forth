object clone vector2
vector2 extend
1 cells member x  x off
1 cells member y  y off
: pack ( x y -- ) x ! y ! ;
: unpack ( -- x y ) x @ y @ ;
: -unpack ( -- -x -y ) x @ negate y @ negate ;
: print  print  .attr x  .attr y ;
extended
