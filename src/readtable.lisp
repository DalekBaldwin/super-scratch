(in-package :super-scratch)

(defun let-package (stream char numarg)
  (declare (ignore char numarg))
  (let ((*package*
         (if *read-suppress*
             *package*
             (let ((package-name
                    (intern (symbol-name (read stream t nil t)) :keyword)))
               (or
                (find-package package-name)
                (error "No package named ~A." package-name))))))
    (read stream t nil t)))

(defun ignore-form (stream char numarg)
  (declare (ignore char numarg))
  (let ((*read-suppress* t))
    (read stream t nil t))
  (values))

(defreadtable :super-scratch
  (:merge :standard)
  (:dispatch-macro-char #\# #\@ #'let-package)
  (:dispatch-macro-char #\# #\! #'ignore-form))
