(define (last-pair a)
  (if (null? (cdr a))
      a
      (last-pair (cdr a))))

(last-pair (list 23 72 149 34))
