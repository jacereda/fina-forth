require handler.fs
handler file
:noname 
   2dup s" file://" beginswith? if 7 /string then 
   true ;          file matches
' open-file        file opens
' close-file       file closes
' read-file        file reads
' write-file       file writes
' reposition-file  file seeks
