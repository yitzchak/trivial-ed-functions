(in-package :trivial-ed-functions/test)


(define-test supported-implementation
  (let ((tef:*ed-functions* (list (lambda (x)
                                    (equal x "foo"))
                                  (lambda (x)
                                    (equal x "bar"))
                                  (lambda (x)
                                    (when (equal x "baz")
                                      (error 'file-error :pathname x))))))
    (true (featurep 'ed-functions))
    (true (ed "foo"))
    (true (ed "bar"))
    (fail (ed "qux") simple-error)
    (fail (ed "baz") file-error)))

