require handler.fs
require filehandler.fs
require socket.fs
handler tcp
:noname
   2dup s" tcp://" beginswith? if
      6 /string true
   else
      false
   then ;    tcp matches
' open-tcp   tcp opens
file closer  tcp closes
file reader  tcp reads
file writer  tcp writes
file flusher tcp flushes
