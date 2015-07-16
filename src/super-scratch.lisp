(in-package :super-scratch)
(in-readtable :super-scratch)

#! ;; don't actually load your scratch code when loading super-scratch
(progn
  ;; C-x C-e will read a form starting from the opening paren,
  ;; so wrap your top-level package binding in a progn
  #@some-package
  (your code to evaluate in :some-package goes here
        #@some-other-package
        (and your sub-expressions to evaluate in :some-other-package go here)))
