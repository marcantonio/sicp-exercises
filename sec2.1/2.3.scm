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

; rectangle w/ points
(define (make-rect-p nw se)
  (cons nw se))

(define (nw-corner r) (car r))

(define (se-corner r) (cdr r))

(define (rect-w r)
  (- (x-point (se-corner r))
     (x-point (nw-corner r))))

(define (rect-h r)
  (- (y-point (nw-corner r))
     (y-point (se-corner r))))

(define (area r)
  (* (rect-h r)
     (rect-w r)))

(define (perimeter r)
  (+ (* (rect-w r) 2)
     (* (rect-h r) 2)))

(define rp (make-rect-p (make-point 0 5) (make-point 10 0)))
(area rp)
;Value: 50
(perimeter rp)
;Value: 30

; rectangle w/ lines
(define (make-rect-l n e)
  (cons n e))

(define (n-line r) (car r))

(define (e-line r) (cdr r))

(define (rect-w r)
  (- (x-point (end-segment (n-line r)))
     (x-point (start-segment (n-line r)))))

(define (rect-h r)
  (- (y-point (start-segment (e-line r)))
     (y-point (end-segment (e-line r)))))


(define rl (make-rect-l (make-segment (make-point 0 5)
                                      (make-point 10 5))
                        (make-segment (make-point 10 5)
                                      (make-point 10 0))))
(area rl)
;Value: 50
(perimeter rl)
;Value: 30
