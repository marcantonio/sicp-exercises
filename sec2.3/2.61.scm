#lang racket

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((= x (car set)) set)
        ((> x (car set)) (cons (car set)
                               (adjoin-set x (cdr set))))
        ((< x (car set)) (cons x set))))

(adjoin-set 4 '(1 2 3 5))
;(1 2 3 4 5)
(adjoin-set 0 '(1 2 3 5))
;(0 1 2 3 5)
(adjoin-set 6 '(1 2 3 5))
;=> (1 2 3 5 6)
;
;>(adjoin-set 6 '(1 2 3 5))
;> (adjoin-set 6 '(2 3 5))
;> >(adjoin-set 6 '(3 5))
;> > (adjoin-set 6 '(5))
;> > >(adjoin-set 6 '())
;< < <'(6)
;< < '(5 6)
;< <'(3 5 6)
;< '(2 3 5 6)
;<'(1 2 3 5 6)
(adjoin-set 2 '(1 2 3 5))
;=> (1 2 3 5)
;
;>(adjoin-set 2 '(1 2 3 5))
;> (adjoin-set 2 '(2 3 5))
;< '(2 3 5)
;<'(1 2 3 5)

