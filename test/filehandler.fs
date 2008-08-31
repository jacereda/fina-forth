require filehandler.fs
TESTING FILEHANDLER
{ char " parse handler.fs" r/o file rawopen throw constant rh -> }
{ pad 256 rh file read throw -> 256 }
pad 256 dump
{ rh file close throw -> }
{ char " parse handler.fs" r/o open throw 2constant h -> }
{ pad 256 h read throw -> 256 }
pad 256 dump
{ h close throw -> }

