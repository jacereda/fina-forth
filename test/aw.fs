require aw.fs
require cce.fs
create buffer 256 allot
: 0term buffer place 0 buffer count + c! buffer 1+ ;

:noname awInit 0= abort" Unable to initialize" ; execute
char " parse AW test" 0term 
100 200 300 400 awOpen value aw
aw awPushCurrent

: unknown ." unknown" cr drop ;
defer resize :noname ." resize " 2@ . . cr ; is resize
: close drop aw awClose ." Goodbye" cr bye ;
: down ." down " @ . ;
: up ." up " @ . ;
: motion ." motion " 2@ . . cr ;
: none abort ;

create handlers 
' unknown , ' none , ' resize , ' down , ' up , ' motion , ' close ,

defer draw ' noop is draw

: evloop
   begin 
      aw awNextEvent ?dup if 
         dup cell+ swap @ cells handlers + @execute 
      else
         draw
         aw awSwapBuffers
      then 
      pause
   again ;

64 64 64 task: evtask
evtask build
:noname evtask activate evloop ; execute
