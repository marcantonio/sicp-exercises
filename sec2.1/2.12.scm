(define (make-interval a b) (cons a b))

(define (lower-bound i) (car i))

(define (upper-bound i) (cdr i))

(define (center i)
  (/ (+ (lower-bound i)
        (upper-bound i))
     2))

; 6.8 10%
(define r1 (make-interval 6.12 7.48))

(define (make-center-percent c p)
  (let ((diff (* (/ p 100) c)))
    (make-interval (- c diff) (+ c diff))))

(define (percent i)
  (let ((c (center i)))
    (* (/ (- (upper-bound i) c)
       c) 100)))

(make-center-percent 6.8 10)
;(6.12 . 7.4799999999999995)
(percent (make-center-percent 6.8 10))
;9.999999999999996
