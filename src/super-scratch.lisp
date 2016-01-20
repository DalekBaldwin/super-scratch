(in-package :super-scratch)
(in-readtable super-scratch)

#! ;; don't actually load your scratch code when loading super-scratch
(progn
  ;; C-x C-e will read a form starting from the opening paren,
  ;; so wrap your top-level package/readtable binding in a progn
  ;; if you want to bind stuff right away
  #@some-package
  (your code to evaluate in :some-package goes here
        #@some-other-package
        (and your sub-expressions to evaluate in :some-other-package go here
             #^:common-lisp
             (and now you can't use the sharp-at or the sharp-carrot
                  reader-macros anymore so I guess you're stuck in the
                  :common-lisp readtable for the rest of this s-expression which
                  ends riiiiiiiiiiiiiiiiiight here)
             (just don't bind any readtables that break the delimiter characters
                   of the surrounding readtable binding because that would
                   obviously be really bad))))

#! ;; eval me!
(list #.*package* #.*readtable*
      #@common-lisp (list #.*package* #.*readtable*
                          #^:common-lisp
                          (list #.*package* #.*readtable*))
      #^:common-lisp (list #.*package* #.*readtable*))
