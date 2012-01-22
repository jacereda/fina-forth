expose-module private
: nearestname ( xt -- c-addr )
  begin dup xt>name 0= while cell- repeat xt>name ;   
create nbuf 20 chars allot
: numrepr ( u -- c-addr )
  s" h# " nbuf place  16 based repr nbuf append  nbuf ;
: probablename ( xt -- name )
    dup aligned over =  over dict? and if nearestname else numrepr then ;
: .backtrace ( -- )
    rstack swap ?do i @ probablename .name 1 cells +loop ;
: (~~) 
   type [char] : emit .
   ." data:" .s ." return:" .rs ." backtrace:" .backtrace cr ;
: ~~ 
   state @ if
      sourceline# postpone literal sourcefilename postpone sliteral
      postpone (~~)
   else 
      sourceline# sourcefilename (~~)
   then ; immediate
export ~~
end-module
