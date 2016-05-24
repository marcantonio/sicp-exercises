#lang racket

(define (make-from-mag-ang r a)
  (define (dispatch op)
    (cond ((eq? op 'magnitude) r)
          ((eq? op 'angle) a)
          ((eq? op 'real-part)
           (* r (cos a)))
          ((eq? op 'imag-part)
           (* r (sin a)))
          (else
           (error "Unknown op:
            MAKE-FROM-MAG-ANG" op))))
  dispatch)

((make-from-mag-ang 10 20) 'imag-part)
;9.129452507276277
