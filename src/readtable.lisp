(in-package :super-scratch)

(defun let-package (stream char numarg)
  (declare (ignore char numarg))
  (let ((*package*
         (if *read-suppress*
             *package*
             (find-package
              (intern (symbol-name (read stream t nil t)) :keyword)))))
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
