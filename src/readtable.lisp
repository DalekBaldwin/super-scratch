(in-package :super-scratch)

(defun let-package (stream char numarg)
  (declare (ignore char numarg))
  (let ((*package* (find-package (read stream t nil t))))
    (read stream t nil t)))

(defreadtable :super-scratch
  (:merge :standard)
  (:dispatch-macro-char #\# #\! #'let-package))
