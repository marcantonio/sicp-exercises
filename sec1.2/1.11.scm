; recursive
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

; iterative
(define (f n)
  (define (f-iter t1 t2 t3 count)
    (if (= n count)
        (+ t1 (* t2 2) (* t3 3))
        (f-iter (+ t1 (* t2 2) (* t3 3))
                t1
                t2
                (+ count 1))))

  (if (< n 3)
      n
      (f-iter 2 1 0 3)))
