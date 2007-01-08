: probablename ( xt -- name )
    dup xt? if 
        begin dup xt>name 0= while cell- repeat xt>name 
    else
        s" h# " pad char+ swap move 
        0 base @ >r hex <# #s #> r> base ! dup 3 chars + pad c! 
        pad 4 chars + swap move pad 
    then ;
: rstack ( -- bottom top )
    rp0 @ rp@ ;
: .backtrace ( bottom top -- )
    swap cell+ swap
    ." backtrace: " do i @ probablename .name 1 cells +loop ;
: .stacks ( -- )
   .s rstack .backtrace cr ;
