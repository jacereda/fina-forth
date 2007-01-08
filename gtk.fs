\ Sample gtk application using gtk-server
\ Written by Jorge Acereda ( jacereda@users.sourceforge.net )

require sh.fs
sh gtk-server fifo gtkserver.fifo &
sh sleep 2

create buf 256 allot
0 value pbuf 
: gtkemit 
   pbuf c! pbuf 1+ to pbuf ;
: gtk{ ( -- , send subsequent output to gtk-server)
   buf to pbuf
   ['] gtkemit 'emit ! ;
: }gtknores
   cr
   ['] tx! 'emit !
   s" gtkserver.fifo" w/o open-file throw >r
   buf  pbuf buf -  r@ write-file throw
   r> close-file throw ;
: }gtk ( -- , finish output to gtk-server, receive response)
   }gtknores
   buf 1+ 255 
   s" gtkserver.fifo" r/o open-file throw >r
   r@ read-line throw drop buf c!
   r> close-file throw ;
: gtkres ( -- x, evaluate gtk-server response )
   buf count evaluate ;
: s ( "delimiter" "string" -- , compile string with strange delimiter)
   char parse postpone sliteral ; immediate compile-only
: init ( -- , init connection with gtk-server)
   gtk{ ." gtk_init NULL NULL" }gtk ;
: show ( widget -- )
   gtk{ ." gtk_widget_show " . }gtk ;
: window" ( "title" -- win )
   gtk{ ." gtk_window_new 0" }gtk gtkres
   gtk{ ." gtk_window_set_title " dup . [char] " parse type }gtk ;
: table ( homogeneous colums rows -- widget )
   gtk{ ." gtk_table_new " . . . }gtk gtkres ;
: add ( widget container -- )
   gtk{ ." gtk_container_add " .  . }gtk ;
: label" ( "label" -- widget )
   gtk{ s ' gtk_label_new "' type
        [char] " parse type [char] " emit }gtk gtkres ;
: attach ( bot top right left widget table -- )
   gtk{ ." gtk_table_attach_defaults " . . . . . . }gtk ;
: button" ( "name" -- widget )
   gtk{ s ' gtk_button_new_with_label "' type
         [char] " parse type [char] " emit }gtk gtkres ;
: iteration ( -- , perform mainloop iteration )
   gtk{ ." gtk_main_iteration" }gtk ;
: check ( -- widget , check for activity )
   gtk{ ." gtk_server_callback 0" }gtk gtkres ;
: done ( -- , disconnect from gtk-server )
   gtk{ ." gtk_exit 0" }gtknores 
   s" rm gtkserver.fifo" (sh) ;

init
window" title" constant win
1 30 30 table constant tab
tab win add
label" Hello world" constant lab
7 3 29 1 lab tab attach
button" exit" constant but
button" nothing" constant but0
27 23 28 20 but tab attach
lab show  but show  tab show  win show 
: loop  begin  iteration check but =  until done ;
loop
bye

