(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))


(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ (* k h) a)))
  (define (term k)
    (* (cond ((or (= k 0) (= k n)) 1)
             ((even? k) 2)
             (else 4))
       (y k)))
  (define (inc x) (+ x 1))
  (* (/ h 3) (sum term 0 inc n)))

(integral cube 0 1 0.01)
;0.24998750000000042

(integral cube 0 1 0.001)
;0.249999875000001

(simpson cube 0 1 100.0)
;0.24999999999999992

(simpson cube 0 1 1000.0)
;0.2500000000000003
