(define (set-to-wow! x)
  (set-car! (car x) 'wow)
  x)

(define x (list 'a 'b))
(define z1 (cons x x))

z1
;((a b) a b)

;z1-->[o|o]
;      | /
;      v
; x-->[o|o]-->[o|/]
;      |       |
;      v       v
;      a       b

(set-to-wow! z1)
;((wow b) wow b)

;z1-->[o|o]
;      | /
;      v
; x-->[o|o]-->[o|/]
;      |       |
;      v       v
;     wow      b

(define z2
  (cons (list 'a 'b) (list 'a 'b)))

z2
;((a b) a b)

;z2-->[o|o]-->[o|o]-->[o|/]
;      |       |       |
;      |       v       v
;      |       a       b
;      |       ^       ^
;      |       |       |
;       ----->[o|o]-->[o|/]

(set-to-wow! z2)
;((wow b) a b)

;z2-->[o|o]-->[o|o]-->[o|/]
;      |       |       |
;      |       v       v
;      |       a       b
;      |               ^
;      |               |
;       ----->[o|o]-->[o|/]
;              |
;              v
;             wow
