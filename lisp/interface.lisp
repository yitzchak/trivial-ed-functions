(in-package #:trivial-ed-functions)


#-(or clasp ecl sbcl)
(declaim (type list *ed-functions*))
#-(or clasp ecl sbcl)
(defvar *ed-functions* '()
  "See function documentation for ED.")


(defun ed-hook (&optional x)
  (dolist (fun *ed-functions*
           (error "Do not know how to ED ~a." x))
    (when (funcall fun x)
      (return t))))


(defun initialize ()
  "Initialize any needed hook functions to make *ed-functions* actually work."
  #+allegro (setf scm::*ed-hook* #'ed-hook)
  #+ccl (setf ccl:*resident-editor-hook* #'ed-hook)
  (values))


(initialize)

