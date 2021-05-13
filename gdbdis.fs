require pipehandler.fs
expose-module private
libc getpid (ptr) getpid
2variable script
: >s ( a u -- ) script 2@ write throw ;
: n>s 0 (d.) ;
: (seecode) ( start end -- )
   s" /tmp/gdbcmds" w/o open throw script 2!
   s" attach " >s  getpid 0 (d.) >s  newline >s
   s" disassemble " >s  swap n>s >s  s" ," >s  n>s >s  newline >s
   script 2@ close throw
   s" pipe://gdb --batch --command=/tmp/gdbcmds" r/o open throw
   here 4096 2over read drop here swap type close throw ;
: seecode 10 based (seecode) ;
' seecode is codesee
end-module
