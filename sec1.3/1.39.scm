(define (cont-frac n d k)
  (define (descend i)
    (if (< i k)
        (/ (n i) (+ (d i) (descend (+ i 1))))
        (/ (n i) (+ (d i)))))
  (descend 1))

(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= i 1)
                   x
                   (- (* x x))))
             (lambda (i)
               (- (* 2 i) 1))
             k))

(tan 1.1)
;1.9647596572486523

(tan-cf 1.1 10)
;1.9647596572486525
