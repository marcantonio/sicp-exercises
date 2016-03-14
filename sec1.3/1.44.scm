(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f i)
    (if (= i 1)
        f
        (compose f (repeated f (- i 1)))))

(define (smooth f)
  (let ((dx 0.00001))
    (lambda (x)
      (/ (+ (f x)
            (f (- x dx))
            (f (+ x dx)))
         3))))

((smooth sin) 1)
; Value: .8414709847798475

(define (nfold-smooth f i)
  (repeated (smooth f) i))

((nfold-smooth sin 3) 1)
;Value: .6784304773061348
