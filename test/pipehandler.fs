require pipehandler.fs
TESTING PIPEHANDLER
{ char " parse pipe://ls -l /" r/o open throw 2constant p -> }
{ pad 256 p read throw -> 256 }
pad 256 dump
{ p close throw -> }

