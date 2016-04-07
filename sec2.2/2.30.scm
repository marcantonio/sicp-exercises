(define (square-tree tree)
  (cond ((null? tree) ())
        ((pair? tree)
         (cons (square-tree (car tree)) (square-tree (cdr tree))))
        (else
         (* tree tree))))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;(1 (4 (9 16) 25) (36 49))

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (square-tree tree)
  (map (lambda (st)
         (if (pair? st)
             (square-tree st)
             (* st st)))
       tree))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;(1 (4 (9 16) 25) (36 49))
