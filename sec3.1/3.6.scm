#lang racket

(define (rand-update x)
  (let ((a 27) (b 26) (m 127))
    (modulo (+ (* a x) b) m)))

(define random-init 1)
(define rand
  (let ((x random-init))
    (lambda (op . v)
      (cond ((eq? op 'generate)
             (set! x (rand-update x)) x)
            ((eq? op 'reset)
             (set! x (car v)))
            (else (error "Bad op"))))))

(rand 'generate)
;53
(rand 'generate)
;60
(rand 'generate)
;122
(rand 'reset 1)
(rand 'generate)
;53
(rand 'generate)
;60
(rand 'generate)
;122
