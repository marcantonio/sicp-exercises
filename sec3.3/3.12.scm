
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))
z

(cdr z)
;(b c d)

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

(define w (append! x y))

w
;(a b c d)


;(define x (list 'a 'b))
;(define y (list 'c 'd))
;(define z (append x y))
;
;x-->[o|o]-->[o|/]
;     |       |
;     v       v
;     a       b
;
;y-->[o|o]-->[o|/]
;     |       |
;     v       v
;     c       d
;
;z-->[o|o]-->[o|o]-->[o|o]-->[o|/]
;     |       |       |       |
;     v       v       v       v
;     a       b       c       d
;
;(define w (append! x y))
;
;     x               y
;     |               |
;     v               v
;w-->[o|o]-->[o|o]-->[o|o]-->[o|/]
;     |       |       |       |
;     v       v       v       v
;     a       b       c       d
