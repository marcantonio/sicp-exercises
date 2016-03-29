(define (div-interval x y)
  (let ((yp (* (upper-bound y)
               (lower-bound y))))
    (if (< yp 0)
        (error "interval spans zero")
        (mul-interval x
                      (make-interval
                       (/ 1.0 (upper-bound y))
                       (/ 1.0 (lower-bound y)))))))

(define (make-interval a b) (cons a b))

(define (lower-bound i) (car i))

(define (upper-bound i) (cdr i))

(define i1 (make-interval 2 4))

(define i2 (make-interval 3 7))

(define i3 (make-interval -3 3))

(div-interval i1 i2)
;(.2857142857142857 . 1.3333333333333333)
(div-interval i1 i3)
;interval spans zero
;To continue, call RESTART with an option number:
; (RESTART 1) => Return to read-eval-print level 1.
