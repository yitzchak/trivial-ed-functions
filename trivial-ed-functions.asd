(asdf:defsystem #:trivial-ed-functions
  :description "A simple compatibility layer for *ed-functions*"
  :author "Tarn W. Burton"
  :license "MIT"
  :in-order-to ((asdf:test-op (asdf:test-op #:trivial-ed-functions/test)))
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


(asdf:defsystem #:trivial-ed-functions/test
  :description "Test suite for trivial-ed-functions"
  :author "Tarn W. Burton"
  :license "MIT"
  :depends-on
    (:trivial-ed-functions :parachute)
  :perform (asdf:test-op (op c) (uiop:symbol-call :parachute :test :trivial-ed-functions/test))
  :components
    ((:module lisp
      :components
      ((:module test
        :serial t
        :components
          ((:file "packages")
           (:file "test")))))))
        
