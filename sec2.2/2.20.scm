(define (same-parity a . b)
  (let ((op (if (odd? a) odd? even?)))
    (define (recur items)
      (if (null? items)
          items
          (if (op (car items))
              (cons (car items) (recur (cdr items)))
              (recur (cdr items)))))
    (cons a (recur b))))


(same-parity 1 2 3 4 5 6 7)
;(1 3 5 7)

(same-parity 2 3 4 5 6 7)
;(2 4 6)
