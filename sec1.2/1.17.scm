(define (double x) (+ x x))
(define (halve x) (/ x 2))
(define (even? n)
  (= (remainder n 2) 0))

(define (fast-mult x y)
  (cond ((= y 0) x)
        ((even? y)
         (fast-mult (double x) (halve y)))
        (else
         (fast-mult (+ x y) (- y 1)))))
