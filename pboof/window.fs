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
1 cells member unknown  ' drop unknown !
1 cells member none  ' drop none !
1 cells member resize  ' drop resize !
1 cells member down  ' drop down ! 
1 cells member up  ' drop up !
1 cells member motion  ' drop motion !
1 cells member close  ' drop close !
1 cells member draw  ' noop draw !

task instance t  o@ t data !
:noname ( win -- )
      >o
      handle @ aw awNextEvent ?dup if 
         dup cell+ swap @ cells handlers + @execute 
      else
         draw @execute
         handle @ aw awSwapBuffers
      then odrop ; t ticker !

: open 
   title 0get  geom unpack  aw awOpen handle !
   handle @ aw awPushCurrent  t run ;

: close
   t stop  handle @ aw awClose  handle off ;

extended
