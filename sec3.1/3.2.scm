#lang racket

(define (make-monitored f)
  (let ((how-many-calls? 0))
    (lambda (x)
      (cond ((eq? x 'how-many-calls?) how-many-calls?)
            ((eq? x 'reset-count)
             (set! how-many-calls? 0))
            (else
             (set! how-many-calls?
                   (+ how-many-calls? 1))
             (f x))))))


(define s (make-monitored sqrt))

(s 100)
;10
(s 9)
;3
(s 'how-many-calls?)
;2
(s 'reset-count)
(s 100)
;10
(s 'how-many-calls?)
;1
