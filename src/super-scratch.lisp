(in-package :super-scratch)
(in-readtable :super-scratch)

#!
(progn
  #@some-package
  (your code to evaluate in :some-package goes here
        #@some-other-package
        (and your sub-expressions to evaluate in :some-other-package go here)))
