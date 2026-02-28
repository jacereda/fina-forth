WHAT IS FINA?
=============

FINA (FINA Is Not ANS) is a small, fast, direct-threaded Forth
compiler/interpreter designed to be:

- Easy to port and embed in other applications.
- Compliant with the ANS Forth standard.
- Compatible with many architectures.


ROOTS
=====

FINA takes some inspiration from:

- hForth ( http://www.taygeta.com/hforth.html )
- Gforth ( http://www.gnu.org/software/gforth/ ).


BUILDING
========

Assuming you have Nix installed ( https://nixos.org/ ), enter the
development environment:

$ nix develop .#x86_64

The following command will build and install FINA under a directory called "inst":

$ make install

To start the interpreter:

$ inst/bin/fina

To pass some regression tests, build with:

$ make check

To perform some benchmarks, build with:

$ make bench

To compile a call profiling version (for using prof.fs):

$ make PROF=1

To build a slow version with a minimal set of primitives:

$ make MOREPRIMS=0

To avoid building the memory allocation words (ALLOCATE/FREE/RESIZE):

$ make ALLOCATE=0

Clean the built objects if you change the Makefile with

$ make clean


INSTALLATION
============

To install, just build passing a prefix argument:

$ make install PREFIX=$HOME/fina


HELP
====

To read the documentation for a word, type:

help <word>


STATUS
======

To generate a report on implemented/missing words, run:

$ inst/bin/fina test/checkans.fs


INTERNALS
=========

FINA doesn't use an image file. The image is contained in the
executable. That's the reason for the big size of the binary, it will
be as big as your desired dictionary size. This isn't as bad as it
might sound, since you can compress the executable with gzexe.
Compiling FINA with a dictionary size of 16 Mb will result in an
executable of ~16800000 bytes, but the stripped executable compressed
with gzexe will only take ~41000 bytes.

The default dictionary size is set to 512K. This and several other
values can be tweaked in meta/tconfig.fs

Wordlists have the following structure:

first-word-nfa|next-wordlist

NFA points to the LEN+FLAGS field of a word header. That is, the
following would inspect the first NFA in FORTH-WORDLIST

forth-wordlist @ 40 dump

Word headers have the following structure:

next-nfa|len+flags|name|(padding)|(body)

So, you can inspect the NFA of the word defined before DUP as follows:

' dup xt>name cell- @ 40 dump


THANKS
======

Thanks to the authors of hForth and Gforth for building those great
pieces of software.
