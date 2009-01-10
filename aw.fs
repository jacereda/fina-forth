\ require ffi.fs
library aw aw
aw awInit (int) awInit
aw awEnd (void) awEnd
aw awOpen ptr int int int int (ptr) awOpen
aw awClose ptr (void) awClose
aw awSwapBuffers ptr (void) awSwapBuffers
aw awPushCurrent ptr (void) awPushCurrent
aw awPopCurrent ptr (void) awPopCurrent
aw awNextEvent ptr (ptr) awNextEvent
1 constant AW_KEY_MOUSEWHEELUP
2 constant AW_KEY_MOUSEWHEELDOWN
3 constant AW_KEY_MOUSELEFT
4 constant AW_KEY_MOUSEMIDDLE
5 constant AW_KEY_MOUSERIGHT
6 constant AW_KEY_SHIFT
7 constant AW_KEY_ALT
8 constant AW_KEY_CONTROL
9 constant AW_KEY_META
