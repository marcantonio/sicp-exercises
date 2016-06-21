#lang racket

(define (make-accumulator value)
  (lambda (inc)
    (set! value (+ value inc))
    value))

(define A (make-accumulator 5))

(A 10)
;15
(A 10)
;25
