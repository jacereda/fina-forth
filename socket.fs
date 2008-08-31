require mod.fs
module socket

libc socket int int int (int) socket
libc 0gethostbyname ptr (ptr) gethostbyname
libc fdopen int ptr (ptr) fdopen
libc connect int ptr int (ptr) connect

create saddr 0 c, 2 c, 
here 0 c, 0 c,
here 0 , 0 , 0 ,
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
   gethostbyname 4 cells + @ @ @ ;

: (open-tcp) ( c-addr u port -- filenum ior )
   port bw! >ip addr !
   2 1 0 socket dup saddr /saddr connect -38 and ;

: >mode ( fam -- c-addr u)
   3 *  s" r  rb r+ r+b w  wb BAD" drop + 3 ;

: >port ( c-addr u -- port) 
   10 based s>unumber ;

: open-tcp ( c-addr u fam -- fileid ior )
   >r [char] : split 2swap 1 /string >port (open-tcp) 
   swap r> >mode 0term fdopen swap ;

export open-tcp 
end-module
