(define (loop? pipe)
  (define (race tortoise hare)
    (cond ((null? hare) #f)
          ((eq? tortoise hare) #t)
          (else
           (race (cdr tortoise)
                 (cddr hare)))))
  (race pipe (cdr pipe)))

(define z '(1 2 3))
(loop? z)
; #f

(set-cdr! (cddr z) z)
(loop? z)
; #t
