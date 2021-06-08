(defpackage #:trivial-ed-functions
  (:use #:common-lisp)
  (:nicknames :tef)
  (:documentation "A simple compatibility layer for *ed-functions*")
  #+(or clasp ecl) (:import-from #:ext #:*ed-functions*)
  #+sbcl (:import-from #:sb-ext #:*ed-functions*)
  (:export
    #:*ed-functions*
    #:initialize))

