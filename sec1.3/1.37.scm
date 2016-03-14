(define (cont-frac n d k)
  (define (cf i)
    (if (= i k) (/ (n i) (d i))
        (/ (n i)
           (+ (d i)
              (cf (+ i 1))))))
  (cf 1))

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11)
;Value: .6180555555555556

(define (cont-frac n d k)
  (define (cf-iter i total)
    (cond ((= i 0) total)
          ((= i k)
           (cf-iter (- i 1) (/ (n i) (d i))))
          (else
           (cf-iter (- i 1) (/ (n i) (+ (d i) total))))))
  (cf-iter k 0))

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11)
;Value: .6180555555555556
