(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;===1===
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (length branch)
  (car branch))

(define (structure branch)
  (cadr branch))

;===2===
(define (total-weight mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (+ (if (pair? left)
           (total-weight left)
           0)
       (if (pair? right)
           (total-weight right)
           right))))

(define m1 (make-mobile
            (make-branch 1 2)
            (make-branch 3 4)))

(total-weight m1)
;6

(define m2 (make-mobile
            (make-branch 1 (make-branch 5 (make-branch 5 6)))
            (make-branch 3 4)))

(total-weight m2)
;10

;===3===
(define (balanced? mobile)
  (let ((left-length (length (left-branch mobile)))
        (right-length (length (right-branch mobile))))
    (= (* left-length (total-weight (left-branch mobile)))
       (* right-length (total-weight (right-branch mobile))))))

(define m3 (make-mobile
            (make-branch 1 (make-branch 5 (make-branch 5 6)))
            (make-branch 2 3)))

(total-weight m3)
;9
(balanced? m3)
;#t
(balanced? m2)
;#f

;===4===
(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

; I needed to change the right node selectors.

(define (right-branch mobile)
  (cdr mobile))

(define (structure branch)
  (cdr branch))
