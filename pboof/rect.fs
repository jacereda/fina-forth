object clone rect
rect extend
vector2 instance pos
vector2 instance dim
: pack ( x y w h -- )  dim pack  pos pack ;
: unpack ( -- x y w h )  pos unpack  dim unpack ;
extended
