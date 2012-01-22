object clone rect
rect extend
vector2 instance pos
vector2 instance dim
: pospack pos pack ;
: dimpack dim pack ;
: pack ( x y w h -- )  dimpack  pospack ;
: unpack ( -- x y w h )  pos unpack  dim unpack ;
extended
