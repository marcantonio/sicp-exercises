(define (fast-mult a b)
  (fast-mult-iter a b 0))

(define (fast-mult-iter a b p)
  (cond ((= b 0) p)
        ((even? b)
         (fast-mult-iter (double a) (halve b) p))
        (else
         (fast-mult-iter a (- b 1) (+ a p)))))

(define (double x) (+ x x))

(define (halve x) (/ x 2))

(define (even? n)
  (= (remainder n 2) 0))
