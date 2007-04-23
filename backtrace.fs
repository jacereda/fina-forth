: probablename ( xt -- name )
    dup xt? if 
        begin dup xt>name 0= while cell- repeat xt>name 
    else
	s" h# " pad place  16 based repr pad append  pad
    then ;
: rstack ( -- bottom top )
    rp0 @ rp@ ;
: .backtrace ( bottom top -- )
    swap cell+ swap
    ." backtrace: " do i @ probablename .name 1 cells +loop ;
: .stacks ( -- )
   .s rstack .backtrace cr ;
