require tcphandler.fs
TESTING TCPHANDLER
{ char " parse tcp://ftp.netbsd.org:21" r/o open throw 2constant p -> }
{ pad 10 p read throw -> 10 }
pad 10 dump
{ p close throw -> }

