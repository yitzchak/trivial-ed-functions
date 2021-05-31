(defpackage #:trivial-ed-functions
  (:use #:common-lisp)
  (:import-from :shasht #:make-object)
  (:nicknames :tef)
  (:documentation "Core package for Jupyter support including kernel and installer abstract classes.")
  #+clasp (:import-from #:ext #:*ed-functions*)
  #+sbcl (:import-from #:sb-ext #:*ed-functions*)
  (:export
    #:*ed-function*))
