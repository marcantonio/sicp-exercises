(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (iter n c d)
  (if (= (modulo n d) 0)
      (iter (/ n d) (+ c 1) d)
      c))

(define (car c)
  (iter c 0 2))

(define (cdr c)
  (iter c 0 3))

(car (cons 3 4))
;Value: 3
(cdr (cons 3 4))
;Value: 4
