(asdf:defsystem #:trivial-ed-functions
  :description "A simple compatibility layer for *ed-functions*"
  :author "Tarn W. Burton"
  :license "MIT"
  :components
    ((:module lisp
      :serial t
      :components
        ((:file "packages")
         (:file "interface"))))
  . #+asdf3
      (:version "0.1"
       :homepage "https://yitzchak.github.io/trivial-ed-functions/"
       :bug-tracker "https://github.com/yitzchak/trivial-ed-functions/issues")
    #-asdf3 ())

