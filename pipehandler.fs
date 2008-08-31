handler pipe
:noname 
   2dup s" pipe://" beginswith? if 
      7 /string true 
   else 
      false 
   then ;    pipe matches
' open-pipe  pipe opens
' close-pipe pipe closes
file reader  pipe reads
file writer  pipe writes
