require tcphandler.fs
TESTING OPEN
{ char " parse tcp://ftp.netbsd.org:21" r/o open throw 2constant p -> }
TESTING READ
{ pad 10 p read throw -> 10 }
pad 10 dump
TESTING CLOSE
{ p close throw -> }

