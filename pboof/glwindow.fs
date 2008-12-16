window clone glwindow
glwindow extend
viewport instance vp
glcolor4 instance bg
:noname evxy 2dup geom dimpack  vp geom dimpack  vp apply ; resizeh !
:noname bg clear ; drawh !
extended
