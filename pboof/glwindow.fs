window extend
viewport instance vp
color4 instance bg
1 cells member scene  ' noop scene !
:noname evxy 2dup geom dimpack  vp geom dimpack  vp apply ; resizeh !
:noname bg clear scene @execute ; drawh !
extended
