object clone buffer
buffer extend
1 cells member name
1 cells member size
1 cells member type
1 cells member atype
1 cells member dtype
1 cells member baseaddr
1 cells member olddict0
1 cells member olddicttop
1 cells member oldhere
1 cells member blobstart
: getname 0 sp@ 1 swap glGenBuffers name ! ;  getname
: cloned cloned getname ;
: savedict
   dict0 olddict0 !  dicttop olddicttop !  here oldhere !  ;
: setdict
   baseaddr @ to here  here to dict0  size @ here + to dicttop ;
: restdict
   olddict0 @ to dict0  olddicttop @ to dicttop  oldhere @ to here ;
: >rel ( addr -- addr' )  baseaddr @ - ;
: bind  type @ name @ glBindBuffer ?err ;
: data  type @  size @  0  dtype @  glBufferData ?err ;
: map ( -- prevhere prevtop )
   type @  atype @  glMapBuffer ?err baseaddr ! ;
: blob  savedict setdict  here blobstart ! ;
: /blob ( -- offset len )
   blobstart @ >rel  here >rel restdict ;
: unmap ( prevhere buffer -- )
   type @ glUnmapBuffer GL_TRUE <> abort" Unable to unmap" ;
extended
