(in-package #:trivial-ed-functions)


(defvar *ed-functions* '()
  "If supported by the current lisp implementation then functions from the
list TRIVIAL-ED-FUNCTIONS:*ED-FUNCTIONS* are called in order by ED with X
as an argument until one of them returns non-NIL; these functions are
responsible for signalling a FILE-ERROR to indicate failure to perform an
operation on the file system.")


(defun ed-hook (&optional x)
  (dolist (fun *ed-functions*
           (error "Do not know how to ED ~a." x))
    (when (funcall fun x)
      (return t))))


#+(or abcl allegro ccl clasp ecl mezzano sbcl)
(let ((sym (find-symbol #+(or abcl clasp ecl sbcl) "*ED-FUNCTIONS*"
                        #+(or allegro mezzano) "*ED-HOOK*"
                        #+ccl "*RESIDENT-EDITOR-HOOK*"
                        ; Package name
                        #+sbcl "SB-EXT"
                        #+(or abcl clasp ecl) "EXT"
                        #+allegro "SCM"
                        #+ccl "CCL"
                        #+mezzano "MEZZANO.EXTENSIONS")))
  (when sym
    #+(or abcl clasp ecl sbcl) ; implementations that have a native *ed-functions*
    (progn
      (setf (documentation sym 'variable) (documentation '*ed-functions* 'variable))
      (shadowing-import sym "TRIVIAL-ED-FUNCTIONS")
      (export (find-symbol "*ED-FUNCTIONS*" "TRIVIAL-ED-FUNCTIONS")))
    #+(or allegro ccl mezzano) ; implementations that have a single hook
    (setf (symbol-value sym) #'ed-hook)
    (pushnew :ed-functions *features*)))

