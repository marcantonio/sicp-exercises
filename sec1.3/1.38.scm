; (i - 2) mod 3 is a "special" number.  All other numbers
; in the sequence are 1.
;
; 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, 1, 1, 10
; 1  2        5        8       11        14
;    0        1        2        3         4

(define (cont-frac n d k)
  (define (cf i)
    (if (= i k) (/ (n i) (d i))
        (/ (n i)
           (+ (d i)
              (cf (+ i 1))))))
  (cf 1))

; this is a terrible way to do this...
(define (d i)
  (define (special? x)
    (if (= (modulo (- x 2) 3) 0) #t #f))
  (define (d-iter n t)
    (cond ((> n i)
           (if (special? (- n 1)) t))
          ((special? n) (d-iter (+ n 1) (+ t 2)))
          (else (d-iter (+ n 1) t))))
  (if (special? i)
      (d-iter 1 0)
      1))

(define e
  (+ 2 (cont-frac (lambda (i) 1.0) d 20)))

e
;Value: 2.718281828459045
