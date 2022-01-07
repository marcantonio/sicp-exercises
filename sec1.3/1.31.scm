(define (identity x) x)
(define (inc x) (+ x 1))

; recursive
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

; iterative
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))


(define (factorial n)
  (product identity 1 inc n))

; (factorial 4)
;24

(define (pi-product n)
  (define (pi-term i)
    (if (odd? i)
        (/ (+ i 1) (+ i 2))
        (/ (+ i 2) (+ i 1))))
  (product pi-term 1.0 inc n))

; (* (pi-product 1000.0) 4)
;3.143160705532257
