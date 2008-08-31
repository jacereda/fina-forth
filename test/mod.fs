require mod.fs

module foo

module baz
: 1 ;
: 2 ;
: 3 ;
words
export 1 2
words
end-module
words
: a ;
: b ;
: c ;
words
export b c
words

module bar
: x ;
: y ;
: z ;
words
export y
words
end-module

words

end-module
