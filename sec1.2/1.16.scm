(define (slow-expt b n)
  (define (iter a b n)
    (if (= n 0)
        a
        (iter (* a b) b (- n 1))))
  (iter 1 b n))

(define (fast-expt b n)
  (define (even? n)
    (= (remainder n 2) 0))

  (define (iter a b n)
    (cond ((= n 0) a)
          ((even? n)
           (iter a (square b) (/ n 2)))
          (else
           (iter (* a b) b (- n 1)))))
  (iter 1 b n))
