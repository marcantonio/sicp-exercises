; recursive
(define (cont-frac n d k)
  (define (descend i)
    (if (< i k)
        (/ (n i) (+ (d i) (descend (+ i 1))))
        (/ (n i) (+ (d i)))))
  (descend 1))

; iterative
(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k  0))


(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)
;0.6179775280898876
