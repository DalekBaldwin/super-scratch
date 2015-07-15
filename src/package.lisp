(in-package :cl-user)

(defpackage :super-scratch
  (:use :cl :named-readtables))

(in-package :super-scratch)

(defparameter *system-directory*
  (make-pathname
   :directory 
   (pathname-directory
    (asdf:system-definition-pathname :super-scratch))))
