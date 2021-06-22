(in-package #:trivial-ed-functions)


(defvar *ed-functions* '()
  "If supported by the current lisp implementation then functions from the
list EXT:*ED-FUNCTIONS* are called in order with X as an argument until one
of them returns non-NIL; these functions are responsible for signalling a
FILE-ERROR to indicate failure to perform an operation on the file system.")


(defun ed-hook (&optional x)
  (dolist (fun *ed-functions*
           (error "Do not know how to ED ~a." x))
    (when (funcall fun x)
      (return t))))


; Support implementations that have an existing *ED-FUNCTIONS*, but only add feature if actually present.
#+(or abcl clasp ecl sbcl)
(let ((sym (find-symbol "*ED-FUNCTIONS*" #+sbcl "SB-EXT" #+(or abcl clasp ecl) "EXT")))
  (when sym
    (shadowing-import sym "TRIVIAL-ED-FUNCTIONS")
    (export (find-symbol "*ED-FUNCTIONS*" "TRIVIAL-ED-FUNCTIONS"))
    (pushnew :ed-functions *features*)))


; Support implementations that have a single hook, but only add feature if actually present.
#+(or allegro ccl mezzano)
(let ((sym (find-symbol #+(or allegro mezzano) "*ED-HOOK*" #+ccl "*RESIDENT-EDITOR-HOOK*"
                        #+allegro "SCM" #+ccl "CCL" #+mezzano "MEZZANO.EXTENSIONS")))
  (when sym
    (setf (symbol-value sym) #'ed-hook)
    (pushnew :ed-functions *features*)))

