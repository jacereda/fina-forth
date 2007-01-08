\ AmigaOS-style lists
\ Node structure: succ|pred
\ List structure: head|tail|tailpred

\g allocate room for node and initialize it
: node ( -- node )  here 0 , 0 , ;

\g create node
: node: ( "name" -- )  create node drop ;

\g advance pointer to node data
: >data ( addr -- addr' )  cell+ cell+ ;

\g allocate room for list and initialize it
: list ( -- )  here cell+ , 0 , here [ 2 cells ] literal - , ;

\g create list
: list: ( "name" -- )  create list ;

\g obtain node succesor
: succ ( node -- node )  @ ;

\g set node succesor
: succ! ( node -- )  ! ;

\g obtain node predecesor
: pred ( node -- node )  cell+ @ ;

\g set node predecesor
: pred! ( node1 node2 -- )  cell+ ! ;

\g obtain list head address
: head ( list -- addr )  ; 

\g obtain list tail address
: tail ( list -- addr )  cell+ ;

\g obtain list tail predecessor address
: tailpred ( list -- addr ) cell+ cell+ ;

\g obtain first node
: first ( list -- node )  head @ ;

\g obtain last node
: last ( list -- node )  tailpred @ ;

\g insert free node after linked
: after ( free linked -- )
   2dup succ pred!  2dup succ swap succ!  2dup succ!  swap pred! ;

\g insert free node before linked
: before ( free linked -- )
   2dup pred succ!  2dup pred swap pred!  2dup pred!  swap 2dup succ! ;

\g remove node
: remove ( node -- node )
   dup pred  over succ pred!  dup succ  over pred succ!  
   0 over pred!  0 over succ! ; \ not really needed

\g insert node at head
: addhead ( node list -- )  head after ;

\g insert node at tail
: addtail ( node list -- )  tail before ;

\g remove first node
: remhead ( list -- node )  head succ remove ;

\g remove last node
: remtail ( list -- node )  tail pred remove ;

\g iterate over list forward applying xt ( node -- )
: forward ( xt list -- )
   head begin succ dup succ while 2dup swap execute repeat 2drop ;

\g iterate over list backwards applying xt ( node -- )
: backward ( xt list -- )
   tail begin pred dup pred while 2dup swap execute repeat 2drop ;

\g is list empty?
: empty? ( list -- flag )
   head @ @ 0= ;

\g push node into list treated as a stack
: spush ( item stack -- )  addhead ;

\g pop node from list treated as a stack
: spop ( item stack -- )  remhead ;

\g append node to list treated as a queue
: qappend ( item queue -- )  addtail ;

\g remove first node from list treated a a queue
: qremove ( queue -- item )  remhead ;

1 [if]
list: l
: .node >data ? ;
: .list 
   ." fw: " ['] .node l forward 
   ." bw: " ['] .node l backward cr ;
.list
\ Anonymous nodes
node 1 , l qappend .list
node 2 , l qappend .list
node 3 , l qappend .list
node 4 , l qappend .list

l qremove .node cr .list
l qremove .node cr .list
l qremove .node cr .list
l qremove .node cr .list

\ Named nodes
node: a 1 ,
node: b 2 ,
node: c 3 ,
node: d 4 ,
a l spush .list
b l spush .list
c l spush .list
d l spush .list
l first .node cr
l last .node cr
l spop .node cr .list
l spop .node cr .list
l spop .node cr .list
l spop .node cr .list
[then]
