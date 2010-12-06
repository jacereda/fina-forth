: nearestname ( xt -- c-addr )
  begin dup xt>name 0= while cell- repeat xt>name ;   
: numrepr ( u -- c-addr )
  s" h# " pad place  16 based repr pad append  pad ;
: probablename ( xt -- name )
    dup aligned over =  over dict? and if nearestname else numrepr then ;
: rstack ( -- bottom top )
    rp0 @ rp@ ;
: .backtrace ( bottom top -- )
    swap cell+ swap
    ." backtrace: " 2dup - 1 cells / .depth
    do i @ probablename .name 1 cells +loop ;
: .stacks ( -- )
   .s rstack .backtrace cr ;
: (~~) type [char] : emit . .stacks cr ;
: ~~ 
   state @ if
      sourceline# postpone literal sourcefilename postpone sliteral
      postpone (~~)
   else 
      sourceline# sourcefilename (~~)
   then ; immediate
