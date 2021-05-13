module handler

0
1+ dup constant matchop
1+ dup constant openop
1+ dup constant closeop
1+ dup constant readop
1+ dup constant writeop
1+ dup constant seekop
1+ dup constant flushop
constant maxops

variable handlers  handlers off

: handler
   create handlers linked
   here maxops cells dup allot erase ;

export handler

: op: pad ! : pad @ cells postpone literal postpone + ;

matchop op: matches ! ;
openop  op: opens   ! ;
closeop op: closes  ! ;
readop  op: reads   ! ;
writeop op: writes  ! ;
seekop  op: seeks   ! ;
flushop op: flushes ! ;

export opens closes reads writes seeks flushes matches

matchop op: matcher @ ;
openop  op: opener  @ ;
closeop op: closer  @ ;
readop  op: reader  @ ;
writeop op: writer  @ ;
seekop  op: seeker  @ ;
flushop op: flusher @ ;

export opener closer reader writer seeker flusher matcher

: dispatch @ dup if  execute false else true then ;
matchop op: match dispatch abort" no matcher" ;
openop  op: rawopen dispatch if drop 2drop 0 -21 then ;
closeop op: close dispatch if drop -21 then ;
readop  op: read  dispatch if drop 2drop 0 -21 then ;
writeop op: write dispatch if drop 2drop -21 then ;
seekop  op: seek  dispatch if drop 2drop -21 then ;
flushop op: flush dispatch if drop -21 then ;

: open ( c-addr u fam -- handle handler ior)
   >r handlers begin @ >r r@ match r> swap until
   r> swap >r r@ rawopen  r> swap ;

export rawopen open close read write seek flush

end-module
