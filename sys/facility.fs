
\g @see ansfacility
: key?  ( -- flag )
   ekey? ;

\g @see ansfacility
: at-xy ( x y -- )
  27 emit [char] [ emit 1+ 0 .r [char] ; emit  1+ 0 .r [char] H emit ;

\g @see ansfacility
: page ( -- )
   27 emit ." [2J" 0 0 at-xy ;
