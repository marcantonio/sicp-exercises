(define x
  (list (list 1 2) (list 3 4)))

(define (fringe items)
  (cond ((null? items) ())
        ((pair? items)
         (append (fringe (car items)) (fringe (cdr items))))
        (else
         (list items))))

(fringe x)
;(1 2 3 4)

(fringe (list x x))
;(1 2 3 4 1 2 3 4)
