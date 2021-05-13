require handler.fs
require filehandler.fs
require socket.fs
handler udp
:noname
   2dup s" udp://" beginswith? if
      6 /string true
   else
      false
   then ;    udp matches
' open-udp   udp opens
file closer  udp closes
file reader  udp reads
file writer  udp writes
file flusher udp flushes
