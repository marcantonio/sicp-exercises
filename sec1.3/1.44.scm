(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose (repeated f (- n 1)) f)))

(define (smooth f dx)
  (lambda (x)
    (/ (+
        (f (- x dx))
        (f x)
        (f (+ x dx)))
       3)))

(define (n-fold f dx n)
  (repeated (smooth f dx) n))

(define pi 3.1415926535897932384626433)

(sin (/ pi 2))
;1

((smooth sin 0.7) (/ pi 2))
;0.8432281248563256

((n-fold sin 0.7 2) (/ pi 2))
;0.6297176112540722
