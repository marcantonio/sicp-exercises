(define (fast-mult x y)
  (define (double x) (+ x x))
  (define (halve x) (/ x 2))
  (define (even? n)
    (= (remainder n 2) 0))

  (define (iter a x y)
    (cond ((= y 0) a)
          ((even? y)
           (iter a (double x) (halve y)))
          (else
           (iter (+ a x) x (- y 1)))))
  (iter 0 x y))
