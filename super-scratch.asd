;;;; super-scratch.asd

(defpackage :super-scratch-system
  (:use :cl :asdf))
(in-package :super-scratch-system)

(defsystem :super-scratch
  :name "super-scratch"
  :serial t
  :components
  ((:static-file "super-scratch.asd")
   (:module :src
            :components ((:file "package")
                         (:file "readtable")
                         (:file "super-scratch"))
            :serial t))
  :depends-on (:named-readtables))
