(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(count-pairs '(1 2 3))
; 3
;
; [o|o]-->[o|o]-->[o|/]
;  |       |       |
;  v       v       v
;  1       2       3


(define z '(1 2 3))
(set-car! z (cddr z))
(count-pairs z)
; 4
;
;   _______________
;  |               |
;  |               v
; [o|o]-->[o|o]-->[o|/]
;          |       |
;          v       v
;  1       2       3


(define z '(1 2 3))
(set-car! z (cdr z))
(set-cdr! z (cdr z))
(set-car! (cdr z) (cddr z))
(set-cdr! (cdr z) (cddr z))
(count-pairs z)
; 7
;
;   _______
;  |  _____|       3
;  | |     |       ^
;  | |     v       |
; [o|o]-->[o|o]-->[o|/]
;          | |     ^
;          | |_____|
;          |_______|
;
;  1       2


(define z '(1 2 3))
(set-cdr! (cddr z) z)
(count-pairs z)
;
;   _________________
;  |                 |
;  v                 |
; [o|o]-->[o|o]-->[o|o]
;  |       |       |
;  v       v       v
;  1       2       3
