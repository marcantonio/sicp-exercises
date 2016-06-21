#lang racket

(define f
  (let ((i 1))
    (lambda (x)
      (if (= x 0)
          (set! i 0)
          (set! i (* i x)))
      i)))


(+ (f 0) (f 1))
;0
;reset
(+ (f 1) (f 0))
;1
