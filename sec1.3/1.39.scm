(define (cont-frac n d k)
  (define (cf i)
    (if (= i k) (/ (n i) (d i))
        (/ (n i)
           (+ (d i)
              (cf (+ i 1))))))
  (cf 1))

(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= i 1)
                   x
                   (- (* x x))))
             (lambda (i) (- (* 2 i) 1))
             k))

(tan-cf 2.0 12)
;Value: -2.185039863261519

(tan 2)
;Value: -2.185039863261519
