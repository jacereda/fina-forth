require handler.fs
require filehandler.fs
handler pipe
:noname 
   2dup s" pipe://" beginswith? if 
      7 /string true 
   else 
      false 
   then ;    pipe matches
' open-pipe  pipe opens
:noname close-pipe nip ; pipe closes
file reader  pipe reads
file writer  pipe writes

