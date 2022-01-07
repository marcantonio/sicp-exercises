(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (good-enough-alt? guess new-guess)
  (< (abs(- new-guess guess)) 0.001))

(define (sqrt-iter-alt guess last-guess x)
  (if (good-enough-alt? guess last-guess)
      guess
      (sqrt-iter-alt (improve guess x) guess
                 x)))

(define (sqrt x)
  (sqrt-iter-alt 1.0 0 x))


; The 'good-enough?' test fails for small numbers because of the limited precision given by using
; 0.001. For example, the square root of 0.0009 is 0.003, whereas the original function gives us
; 0.04030062264654547. For numbers such as 1000000000000001 we never get a result because of the
; loss of precision on large numbers. With the new method we get 31622776.60168381.
