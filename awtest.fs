require aw.fs
create buffer 256 allot
: 0term buffer place 0 buffer count + c! buffer 1+ ;

hex
00004000 constant GL_COLOR_BUFFER_BIT
00000100 constant GL_DEPTH_BUFFER_BIT
decimal
library GL libGL
GL glViewport int int int int  (void) glViewport
GL glClear int  (void) glClear

:noname awInit 0= abort" Unable to initialize" ; execute
awOpen value aw
aw char " parse Mi titulo" 0term awSetTitle
aw 100 100 awResize
aw 100 100 awMove
aw awShow

: unknown ." unknown" cr drop ;
: resize ." resize" 2@ . . cr ;
: moveh ." move" 2@ . . cr ;
: close drop aw awClose ." Goodbye" cr bye ;
: down ." down " @ . ;
: up ." up " @ . ;
: motion ." motion " 2@ . . cr ;

create handlers 
' unknown , ' moveh , ' resize , ' close , ' down , ' up , ' motion ,

: evloop
   begin 
      aw awNextEvent ?dup if 
         dup cell+ swap @ cells handlers + @execute 
      else
         GL_COLOR_BUFFER_BIT GL_DEPTH_BUFFER_BIT or glClear aw awSwapBuffers
      then 
      pause
   again ;

64 64 64 task: evtask
evtask build
:noname evtask activate evloop ; execute
