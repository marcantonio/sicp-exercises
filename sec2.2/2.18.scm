(define (reverse a)
  (define (reverse-iter a b)
    (if (null? a)
        b
        (reverse-iter (cdr a) (cons (car a) b))))
  (reverse-iter a ()))

(define (reverse seq)
  (if (null? seq)
      ()
      (append (reverse (cdr seq)) (list (car seq)))))

(reverse (list 1 4 9 16 25))
