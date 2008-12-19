task clone windowtask
windowtask extend
:noname drop
   window first @ begin
      dup as window tick  
      as window next @ 
      dup 0= 
   until drop ; ticker !
run
extended
