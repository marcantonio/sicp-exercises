(define (cubert-iter guess last-guess x)
  (if (good-enough? guess last-guess)
      guess
      (cubert-iter (improve x guess) guess x)))

(define (improve x y)
  (/ (+ (/ x (* y y)) (* 2 y)) 3))

(define (good-enough? improved-guess guess)
  (< (abs (- improved-guess guess)) 0.001))

(define (cubert x)
  (cubert-iter 1.0 0 x))
