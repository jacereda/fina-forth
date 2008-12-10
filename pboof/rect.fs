object clone rect
rect extend
vector2 clone pos
vector2 clone dim
: print  print  pos print  dim print ;
: pack ( x y w h -- )  dim pack  pos pack ;
: unpack ( -- x y w h )  pos unpack  dim unpack ;
extended
