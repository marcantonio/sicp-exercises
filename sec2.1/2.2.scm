(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;point
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

;segment
(define (make-segment p q)
  (cons p q))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (midpoint-segment s)
  (let ((mx (/ (+ (x-point (start-segment s))
                  (x-point (end-segment s)))
               2))
        (my (/ (+ (y-point (start-segment s))
                  (y-point (end-segment s)))
               2)))
    (make-point mx my)))

(define s (make-segment (make-point 2 4) (make-point 4 6)))
(print-point (midpoint-segment s))
;(3,5)
