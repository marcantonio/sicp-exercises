(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define printer (lambda (x)
                  (display x) (newline)
                  x))

((zero printer) "foo")
(((add-1 zero) printer) "foo")

;(((add-1 zero) printer) "foo")
;(((add-1 zero) printer) "foo")
;((((lambda (f) (lambda (x) (f ((n f) x)))) zero) printer) "foo")
;(((lambda (f) (lambda (x) (f ((zero f) x)))) printer) "foo")
;((lambda (printer) (lambda (x) (printer ((zero printer) x)))) "foo")
;(lambda ("foo") (printer ((zero printer) "foo")))
;(printer ((zero printer) "foo"))
;(printer (((lambda (f) (lambda (x) x))) printer) "foo")
;(printer ((lambda (printer) (lambda (x) x))) "foo")
;(printer ((lambda (x) x)) "foo")
;(printer (lambda ("foo") "foo"))
;(printer "foo")
;"foo"

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

((one printer) "foo")
foo

((two printer) "foo")
foo
foo

(define (add m n)
  (lambda (f) (lambda (x) (m f) (f ((n f) x)))))

(((add one two) printer) "foo")
foo
foo
foo
