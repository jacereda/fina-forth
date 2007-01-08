require ffi.fs
library aw libaw

aw awInit (int) awInit
aw awEnd (void) awEnd
aw awOpen (ptr) awOpen
aw awClose ptr (void) awClose
aw awSwapBuffers ptr (void) awSwapBuffers
aw awMakeCurrent ptr (void) awMakeCurrent
aw awShow ptr (void) awShow
aw awHide ptr (void) awHide
aw awSetTitle ptr ptr (void) awSetTitle
aw awMove ptr int int (void) awMove
aw awResize ptr int int (void) awResize
aw awNextEvent ptr (ptr) awNextEvent

