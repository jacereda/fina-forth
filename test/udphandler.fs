require udphandler.fs
TESTING UDPHANDLER
{ char " parse udp://industrial.api.ubidots.com:9012" r/w open throw 2constant p -> }
{ char " parse |end" p write throw -> }
{ pad 9 p read throw -> 9 }
pad 9 dump
{ p close throw -> }
