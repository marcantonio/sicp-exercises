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

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (if (equal? type1 type2)
                    (error "Same types can't be coerced:" type1)
                    (let ((t1->t2
                           (get-coercion type1
                                         type2))
                          (t2->t1
                           (get-coercion type2
                                         type1)))
                      (cond (t1->t2
                             (apply-generic
                              op (t1->t2 a1) a2))
                            (t2->t1
                             (apply-generic
                              op a1 (t2->t1 a2)))
                            (else
                             (error
                              "No method for these types"
                              (list
                               op
                               type-tags)))))))
              (error
               "No method for these types"
               (list op type-tags)))))))

; 1. apply-generic apply complex->complex to the first argument.  The
; type will not change and when apply-generic is called again it will
; perform the same action.  It will recurse forever.
;
; 2. apply-generic is fine if the operation is known.  Otherwise it
; will attempt coercion.
;
; 3. Above
(exp (make-complex-from-real-imag 2 4) (make-complex-from-real-imag 4 4))
;Same types can't be coerced: complex
