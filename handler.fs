module handler

variable handlers  handlers off

: handler
   create handlers linked 0 , 0 , 0 , 0 , 0 , 0 , ;

export handler


variable handles  handles off

:noname 
   16 0 do 
     ['] docreate xt, postpone 2@ postpone exit handles linked , 
   loop ; execute
: newhandle handles begin @ dup cell- @execute or 0= until cell- @ ;


1 constant matchop
2 constant openop
3 constant closeop
4 constant readop
5 constant writeop
6 constant seekop


: op: pad ! : pad @ cells postpone literal postpone + ;

matchop op: matches ! ;
openop  op: opens   ! ;
closeop op: closes  ! ;
readop  op: reads   ! ;
writeop op: writes  ! ;
seekop  op: seeks   ! ;

export matches opens closes reads writes seeks

matchop op: matcher @ ;
openop  op: opener  @ ;
closeop op: closer  @ ;
readop  op: reader  @ ;
writeop op: writer  @ ;
seekop  op: seeker  @ ;

export matcher opener closer reader writer seeker


: dispatch @ dup if  execute false else true then ;
matchop op: match dispatch abort" no matcher" ;
openop  op: _open dispatch if drop 2drop 0 -21 then ;
closeop op: close dispatch if drop -21 then ;
readop  op: read  dispatch if drop 2drop 0 -21 then ;
writeop op: write dispatch if drop 2drop -21 then ;
seekop  op: seek  dispatch if drop 2drop -21 then ;

: open ( c-addr u fam -- fileid ior)
   >r handlers begin @ >r r@ match r> swap until ( handler)
   ." Attempting to open " >r 2dup type r> cr
   r> swap >r r@ _open r> over if 
      swap >r newhandle >body 2! r> 
   else drop then ;

export open close read write seek

end-module
