require aw.fs
require cce.fs

:noname awInit 0= abort" Unable to initialize" ; execute
char " parse AW test" 0term 
100 200 300 400 awOpen value aw
aw awPushCurrent

: unknown ." unknown" cr drop ;
: none drop ;
defer resize  ' drop is resize
defer down  ' drop is down
defer up  ' drop is up
defer motion  ' drop is motion
: close drop aw awClose ." Goodbye" cr bye ;

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

16 16 16 task: evtask
evtask build
:noname evtask activate evloop ; execute
