(define (add-interval x y)
  (make-interval (+ (lower-bound x)
                    (lower-bound y))
                 (+ (upper-bound x)
                    (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x)
               (lower-bound y)))
        (p2 (* (lower-bound x)
               (upper-bound y)))
        (p3 (* (upper-bound x)
               (lower-bound y)))
        (p4 (* (upper-bound x)
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (make-interval a b) (cons a b))

(define (lower-bound i) (car i))

(define (upper-bound i) (cdr i))

(define i1 (make-interval 2 4))

(define i2 (make-interval 3 7))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i))
     2))

;(a, b) + (c, d) = (a + c, b + d)
;width = ((b + d) - (a + c)) / 2
;width = ((b - a) / 2) + ((d - c) / 2)
;((b + d) - (a + c)) / 2 = ((b - a) / 2) + ((d - c) / 2)
(+ (width i1) (width i2))
;3
(width (add-interval i1 i2))
;3

(* (width i1) (width i2))
;2
(width (mul-interval i1 i2))
;11
