Readme.txt
Version 1.0, 4 Feb 1997
Andrew McKewan
mckewan@austin.finnigan.com

This is the first release of an object-oriented programming system for 
ANS Standard Forth. What I would like is for you to try this out on the 
Forth system you use and report any problems to me. Also any ideas on 
improvements to the code or documentation will be welcome.

I have compiled and run the code on Win32Forth and two personal Forth 
systems, one written in C++ and another a native-code compiler.

The following files are included in this release
 
   CLASS.FTH      main implementation file
   VAR.FTH        definition of cell-sized classes
   ARRAY.FTH      definition of basic array classes
   TESTER.FTH     John Hayes' automated testing program
   TEST.FTH       Class test suite
   CLASS.TXT      documentation
   ANS.TXT        ANS requirements
   README.TXT     this file

I hope you find this useful, and look forward to your feedback.

Andrew McKewan

======================================================================

02/04/97 version 1.0

  A little cleanup

08/14/96 Version 0.2

  Added definition for BOUNDS
  Removed debug routines
  Added TEST.FTH using John Hayes' TESTER program
  Fixed WIN32FOR.F for version 3.2 of Win32Forth

08/10/96 Version 0.1

  Initial release
