\ All these values are expressed in bytes

256        constant /pad     \ Pad size
256        constant /tib     \ Terminal Input Buffer size
256        constant /hld     \ HOLD buffer size
256        constant /user    \ Space reserved for user variables
1024       constant /ds      \ Data stack size
1024       constant /rs      \ Return stack size
256 1024 * constant /tdict   \ Dictionary size

\ These should be tweakable, but the sad truth is they aren't
-1 constant has-ffi
-1 constant has-files
-1 constant has-allocate
-1 constant more-prims
