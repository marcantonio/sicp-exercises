(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))

(define v (list 'a 'b 'c 'd))

(define w (mystery v))

; It creates a new list which is the reverse of x.

v
;(a)
w
;(d c b a)

;                             v
;                             |
;                             v
;w-->[o|o]-->[o|o]-->[o|o]-->[o|/]
;     |       |       |       |
;     v       v       v       v
;     d       c       b       a
