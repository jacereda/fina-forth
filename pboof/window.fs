ns aw
include aw.fs
/ns

aw awInit drop

object clone window
window extend
1 cells member handle
rect instance geom  0 0 256 256 geom pack
string instance title :noname s" no title" ; execute title set

0 cells member handlers
1 cells member unknownh  ' drop unknownh !
1 cells member noneh  ' drop noneh !
1 cells member resizeh  ' drop resizeh !
1 cells member downh  ' drop downh ! 
1 cells member uph  ' drop uph !
1 cells member motionh  ' drop motionh !
1 cells member closeh  ' drop closeh !
1 cells member drawh  ' noop drawh !

task instance t  o@ t data !
:noname ( win -- )
   >o handle @ aw awNextEvent ?dup if 
      dup cell+ swap @ cells handlers + @execute 
   else
      drawh @execute
      handle @ aw awSwapBuffers
   then odrop ; t ticker !

: open
   title 0get  geom unpack  aw awOpen handle !
   handle @ aw awPushCurrent  t run ;

: close
   t stop  handle @ aw awClose  handle off ;

:noname drop close ; closeh !

: apply handle @ if close open then ;

: cloned cloned o@ t data ! ;

extended
