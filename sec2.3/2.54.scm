(define (equal? list1 list2)
  (cond ((and (null? list1) (null? list2)) true)
        ((or (null? list1) (null? list2)) false)
        ((and (pair? list1) (pair? list2))
         (and (equal? (car list1) (car list2))
              (equal? (cdr list1) (cdr list2))))
        ((or (pair? list1) (pair? list2)) false)
        (else (eq? list1 list2))))


(equal? '(this is a list)
        '(this is a list))
;#t

(equal? '(this is a list)
        '(this is b list))
;#f

(equal? '(this (is a) list)
        '(this (is a) list))
;#t

(equal? '(this (is a) list)
        '(this (is b) list))
;#f

(equal? '(this (is a) list)
        '(this is a list))
;#f

(equal? '(this (is) list)
        '(this (is b) list))
;#f

(equal? '(this (is a) list)
        '(this (is) list))
;#f

(equal? 123 123)
;#t

(equal? '(wt f) 'wtf)
;#f
