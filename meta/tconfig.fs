\ Convert target cells to bytes
: tcells ( u -- u')
   tcellbits 8 / * ;

256        constant /pad     \ Pad size
256        constant /tib     \ Terminal Input Buffer size
256        constant /hld     \ HOLD buffer size
64         constant /user    \ cells reserved for user variables
256        constant /ds      \ Data stack size in cells
256        constant /rs      \ Return stack size in cells
256 1024 * constant /tdict   \ Dictionary size in bytes
