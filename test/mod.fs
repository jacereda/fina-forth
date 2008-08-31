TESTING MOD
require mod.fs
{ -> }

2variable ctx
: save ctx ! ;
: restore ctx @ ;
: 2save ctx 2! ;
: 2restore ctx 2@ ;

module foo
save { (words) -> 0 } restore
module baz
2save { (words) -> 0 } 2restore
: d ;
: e ;
: f ;
2save { (words) -> 3 } 2restore
export 1 2
2save { (words) -> 1 } 2restore
end-module

save { (words) -> 2 } restore

: a ;
: b ;
: c ;
save { (words) -> 5 } restore
export b c
save { (words) -> 3 } restore

module bar
: x ;
: y ;
: z ;
2save { (words) -> 3 } 2restore
export y
2save { (words) -> 2 } 2restore
end-module

save { (words) -> 4 } restore

end-module
