#lang racket

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2))
         '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1)
                                 set2)))
        (else (intersection-set (cdr set1)
                                set2))))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (cons (car set1)
              (union-set (cdr set1) set2)))))

(adjoin-set 0 '(1 2 2 3))
;(0 1 2 3)

(intersection-set '(1 2 2 3) '(4 4 3 3 2))
;(2 2 3)

(union-set '(1 2 2 3) '(4 4 3 3 2))
;(1 2 2 3 4 4 3 3 2)

; element-of-set? is the same: O(n)
; adjoin-set was O(n), is now O(1)
; intersection-set is the same: O(n^2)
; union-set was O(n^2), is now O(n)
;
; speed and more memory
