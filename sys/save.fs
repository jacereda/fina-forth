: mark ( a1 -- a2 )
   begin cell+ dup 2@ [ hex ] feedbabe.deadbeef [ decimal ]  d= until ;

: 'cold!
   dict0 cell+ cell+ ! ;

\g Deferred word for building the startup execution chain
defer coldchain

\g Deferred word, prints the startup banner
defer banner

:noname banner quit ; is coldchain

:noname 
   rp0 @ rp!  sp0 @ sp!  coldchain ; 'cold!

: save ( a u -- )
   w/o open-file throw >r   0 arg r/o open-file throw
   dup mmap-file throw
   dup dup mark over - dup pad ! r@ write-file throw 
   dict0 memtop over - dup pad +! r@ write-file throw
   dup pad @ + >r ( handle addr r: start)
   over file-size throw drop + ( handle end r: start )
   r@ - r> swap  r@ write-file throw 
   close-file throw  r> close-file throw ;

: save"
   [char] " parse save ;
