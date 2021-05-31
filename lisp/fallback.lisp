(in-package #:trivial-ed-functions)


(declaim (type list *ed-functions*))
(defvar *ed-functions* '()
  "See function documentation for ED.")


(defun ed-hook (&optional x)
  (dolist (fun *ed-functions* nil)
    (when (funcall fun x)
      (return t))))


#+ccl (setf ccl:*resident-editor-hook* #'ed-hook)
