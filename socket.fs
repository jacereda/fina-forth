module socket

libc socket int int int (int) socket
libc 0gethostbyname ptr (ptr) gethostbyname
libc fdopen int ptr (ptr) fdopen
libc connect int ptr int (ptr) connect

create saddr
2 c, 2 c,
here 0 c, 0 c,
here 0 c, 0 c, 0 c, 0 c,
0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c,
here
saddr - constant /saddr
constant addr
constant port

: bw! ( n addr -- , store short in big-endian mode)
   >r dup 8 rshift r@ c! r> 1+ c! ;

: gethostbyname 0term 0gethostbyname ;

: split ( c-addr u c -- c-addr1 u1 c-addr2 u2 )
   >r 2dup r> scan 2swap 2 pick - ;

: >ip ( c-addr u -- ip )
   gethostbyname 1 cells 8 = if 3 else 4 then cells + @ @ @ ;

: addr! sp@ cell+ swap 4 move drop ;

: (open-con) ( c-addr u port type prot -- filenum ior )
   2>r port bw! >ip addr addr!
   2 2r> socket dup saddr /saddr connect -38 and ;

: (open-tcp) ( c-addr u port -- filenum ior )
   1 0 (open-con) ;

: (open-udp) ( c-addr u port -- filenum ior )
   2 0 (open-con) ;

: >mode ( fam -- c-addr u)
   3 *  s" r  rb r+ r+b w  wb BAD" drop + 3 ;

: >port ( c-addr u -- port)
   10 based s>unumber ;

: (open-net) ( c-addr u fam xt -- fileid ior )
   2>r  [char] : split 2swap 1 /string >port r> execute
   swap r> >mode 0term fdopen swap ;

: open-tcp ( c-addr u fam -- fileid ior )
   ['] (open-tcp) (open-net) ;

: open-udp ( c-addr u fam -- fileid ior )
   ['] (open-udp) (open-net) ;

export open-tcp open-udp
end-module
