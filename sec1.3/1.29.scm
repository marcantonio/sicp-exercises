(define (even? n)
  (= (remainder n 2) 0))

(define (cube x)
  (* x x x))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (inc x) (+ x 1))
  (define (calc-y f k)
    (f (+ a (* k h))))
  (define (calc-yk k)
    (cond ((= k 0)
           (f a))
          ((= k n)
           (calc-y f k))
          ((even? k)
           (* 2 (calc-y f k)))
          (else
           (* 4 (calc-y f k)))))
  (* (/ h 3) (sum calc-yk 0.0 inc n)))

;(integral cube 0 1 0.01)
;.24998750000000042
;(integral cube 0 1 0.001)
;.249999875000001
;(simpson cube 0 1 100)
;.24999999999999992
;(simpson cube 0 1 1000)
;.2500000000000003
