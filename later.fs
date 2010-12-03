: later r> r> 2>r ;
: now 2r> r> 2>r >r ;

0 [if]
: t1 later ." attrib1 " ;
: t2 later ." attrib2 " ;
:noname t1 t2 ." attribs: " ; execute cr
:noname t1 t2 ." attribs: " now ." done " ; execute cr
[then]
