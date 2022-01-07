(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k  0))

(define e (+ 2 (cont-frac (lambda (i) 1.0)
                          (lambda (i)
                            (if (= (remainder (+ i 1) 3) 0)
                                (* 2.0 (/ (+ i 1.0) 3.0))
                                1.0))
                          10)))

e
;2.7182817182817183
