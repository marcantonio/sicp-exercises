; The 'good-enough?' test fails for small numbers because of the limited precision given by using
; 0.001.  For example, the square root of .0009 is 0.003, where this function gives us
; 0.04030062264654547.  For numbers such as 1000000000000001 we never get a result because of the
; loss of precision on large numbers.

(define (sqrt-iter guess last-guess x)
  (if (good-enough? guess last-guess)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? improved-guess guess)
  (< (abs (- improved-guess guess)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 0 x))

; This technique does improve accuracy.
; (sqrt 1000000000000001) was undefined and is now 31622776.60168381
; (sqrt 0.0009) was 0.04030062264654547 is 0.030000012746348552
