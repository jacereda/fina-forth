expose-module private
: 'cold!
   dict0 cell+ cell+ ! ;

\g Deferred word for building the startup execution chain
defer coldchain  ' noop is coldchain

:noname 
   rp0 @ rp!  sp0 @ sp!  coldchain ; 'cold!

: mark ( a1 -- a2 )
   begin cell+ dup 2@ -559038737 -17974594 d= until ;

: hdrsize ( src -- size )
   dup mark swap - ;

: dictsize ( -- size )
   memtop dict0 - ;

: exesize ( -- size )
   0 arg r/o open-file throw >r
   r@ file-size throw drop
   r> close-file throw ;

: savehdr ( src dstfile )
   >r dup hdrsize r> write-file throw ;

: savedict ( dstfile )
   dict0 dictsize rot write-file throw ;

: saveftr ( srcmem dstfile )
   >r exesize over hdrsize dictsize + /string r> write-file throw ;

: savefile' ( dstfile srcfile -- )
   mmap-file throw swap  ( srcmem dstfile )
   2dup savehdr ( srcmem dstfile )
   dup savedict ( srcmem dstfile )
   saveftr ;

: savefile ( dstfile -- )
   0 arg r/o open-file throw >r
   r@ ['] savefile' catch
   r> close-file throw throw ;

: save ( a u -- )
   w/o open-file throw >r   
   r@ ['] savefile catch 
   r> close-file throw throw ;


: save"
   [char] " parse save ;

export save" save coldchain
end-module

