(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (make-rat n d)
  (let ((g (abs (gcd n d))))
    (cond ((and (< n 0) (< d 0))
           (cons (/ (abs n) g)
                 (/ (abs d) g)))
          ((or (< n 0) (< d 0))
           (cons (/ (* -1 (abs n)) g)
                 (/ (abs d) g)))
          (else (cons n d)))))

(print-rat (make-rat 2 4))
; 2/4
(print-rat (make-rat -2 4))
; -1/2
(print-rat (make-rat 2 -4))
; -1/2
(print-rat (make-rat -2 -4))
; 1/2
