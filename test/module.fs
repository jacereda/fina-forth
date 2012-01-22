expose-module private
: modwords topmost-wordlist (.wordsin) ;
export modwords
end-module

TESTING MOD
{ -> }

2variable ctx
: save ctx ! ;
: restore ctx @ ;
: 2save ctx 2! ;
: 2restore ctx 2@ ;


module foo
save { modwords -> 0 } restore
module baz
2save { modwords -> 0 } 2restore
: d ;
: e ;
: f ;
2save { modwords -> 3 } 2restore
export 1 2
2save { modwords -> 1 } 2restore
end-module

save { modwords -> 2 } restore

: a ;
: b ;
: c ;
save { modwords -> 5 } restore
export b c
save { modwords -> 3 } restore

module bar
: x ;
: y ;
: z ;
2save { modwords -> 3 } 2restore
export y
2save { modwords -> 2 } 2restore
end-module

save { modwords -> 4 } restore

end-module
