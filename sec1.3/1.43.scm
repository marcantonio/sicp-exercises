(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f i)
    (if (= i 1)
        f
        (compose f (repeated f (- i 1)))))

((repeated square 2) 5)
