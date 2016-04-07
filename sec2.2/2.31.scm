(define (tree-map proc tree)
  (map (lambda (st)
         (if (pair? st)
             (tree-map proc st)
             (proc st)))
       tree))

(define (square-tree tree)
  (tree-map square tree))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;(1 (4 (9 16) 25) (36 49))
