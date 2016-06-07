#lang racket

(define *op-table* (make-hash))

(define (put op type proc)
  (hash-set! *op-table* (list op type) proc))

(define (get op type)
  (hash-ref *op-table* (list op type) false))

(define (attach-tag type-tag contents)
  (cons type-tag contents))

(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (error "Bad tagged datum:
              TYPE-TAG" datum)))

(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (error "Bad tagged datum:
              CONTENTS" datum)))

(include "numbers.scm")

(define *coercion-table* (make-hash))

(define (put-coercion type1 type2 proc)
  (hash-set! *coercion-table* (list type1 type2) proc))

(define (get-coercion type1 type2)
  (hash-ref *coercion-table* (list type1 type2) false))

(define (scheme-number->complex n)
  (make-complex-from-real-imag
   (contents n) 0))

(put-coercion 'scheme-number 'complex
              scheme-number->complex)

(define (scheme-number->rational n)
  (make-rational (contents n) 1))

(put-coercion 'scheme-number 'rational
              scheme-number->rational)

(define (scheme-number->scheme-number n) n)

(put-coercion 'scheme-number 'scheme-number
              scheme-number->scheme-number)

(define (rational->rational n) n)

(put-coercion 'rational 'rational
              rational->rational)

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (let ((coerced-args (coerce args)))
            (if coerced-args
                (let ((type-tags (map type-tag coerced-args)))
                  (apply-succ op coerced-args '()))
                (error
                 "No method for these types"
                 (list op type-tags))))))))

(define (coerce args . rest)
  (define (iter target vals results)
    (let ((c (get-coercion (type-tag (car vals)) (type-tag target))))
      (if c
          (if (= (length vals) 1)
              (cons (c (car vals)) results)
              (iter target (cdr vals) (cons (c (car vals)) results)))
          false)))

  (if (empty? args)
      false
      (let ((mess (append args rest)))
        (let ((res (iter (car mess) mess '())))
          (if res
              res
              (coerce (cdr args) (append rest (car args))))))))

(define (apply-succ op args . accum)
  (let ((total (car accum)))
    (cond ((null? args) total)
          ((null? total)
           (apply-succ op (cdr args) (car args)))
          (else
           (let ((arg-type (type-tag (car args))))
             (apply-succ op (cdr args)
                         ((get op (list arg-type arg-type))
                          (contents (car args))
                          (contents total))))))))

(add (make-rational 9 1) (make-scheme-number 9))
;'(rational 18 . 1)
(add (make-scheme-number 9) (make-rational 9 1))
;'(rational 18 . 1)
(apply-generic 'add
               (make-scheme-number 9)
               (make-rational 9 1)
               (make-rational 9 1))
;'(rational 27 . 1)
(apply-generic 'mul
               (make-scheme-number 9)
               (make-rational 9 1)
               (make-rational 9 1))
;'(rational 729 . 1)
