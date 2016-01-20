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

(defun let-readtable (stream char numarg)
  (declare (ignore char numarg))
  (let ((*readtable*
         (if *read-suppress*
             *readtable*
             (let ((readtable-name
                    (read stream t nil t)))
               (or
                (named-readtables:find-readtable readtable-name)
                (error "No readtable designated by ~A." readtable-name))))))
    (read stream t nil t)))

(defun ignore-form (stream char numarg)
  (declare (ignore char numarg))
  (let ((*read-suppress* t))
    (read stream t nil t))
  (values))

(defreadtable super-scratch
  (:merge :standard)
  (:dispatch-macro-char #\# #\@ #'let-package)
  (:dispatch-macro-char #\# #\^ #'let-readtable)
  (:dispatch-macro-char #\# #\! #'ignore-form))
