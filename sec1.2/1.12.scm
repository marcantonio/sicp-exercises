(define (pascal x y)
  (cond ((or (= x 0) (= x y)) 1)
        ((or (> x y) (< x 0) (< y 0)) 0)
        (else (+ (pascal (- x 1) (- y 1))
                 (pascal x (- y 1))))))
