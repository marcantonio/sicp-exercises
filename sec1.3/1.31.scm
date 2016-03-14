; 1

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (inc x) (+ x 1))

(define (identity x) x)

(define (factorial n)
  (product identity 1 inc n))

(define (approx-pi n)
  (define (term x)
    (if (= (modulo x 2) 0)
        (/ (+ x 2) (+ x 1))
        (/ (+ x 1) (+ x 2))))
  (define (inc x) (+ x 1))
  (* 4 (product term 1.0 inc n)))

; 2

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))
