(use-modules (guix)
	     (guix build-system gnu)
	     ((guix licenses) #:prefix license:)
	     (gnu packages python)
	     )

(package
 (name "fina-forth")
 (version "git")
 (source (local-file (dirname (current-filename))
                     #:recursive? #t
		     ))
 (build-system gnu-build-system)
 (native-inputs
  (list
   python-2
   ))
 (arguments
  (list
   #:phases
   #~(modify-phases %standard-phases
       (delete 'configure)
       (replace 'install
	 (lambda* (#:key outputs #:allow-other-keys)
           (invoke "make" "install" (string-append "PREFIX=" #$output)))))))
 (description "Direct-threaded Forth interpreter/compiler")
 (license license:bsd-3)
 (home-page "https://github.com/jacereda/fina-forth")
 (synopsis "FINA (FINA Is Not ANS) is a small direct-threaded Forth
compiler/interpreter. Should be easy to port and embed in other
applications. Tries to follow the ANS Forth '94 standard.
"))
