#lang racket

(define *op-table* (make-hash))

(define (put op type proc)
  (hash-set! *op-table* (list op type) proc))

(define (get op type)
  (hash-ref *op-table* (list op type) '()))

(define (deriv exp var)
   (cond ((number? exp) 0)
         ((variable? exp)
           (if (same-variable? exp var)
               1
               0))
         (else ((get 'deriv (operator exp))
                (operands exp)
                var))))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

(define (operator exp) (car exp))

(define (operands exp) (cdr exp))

(define (install-deriv)
  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2))
           (+ a1 a2))
          (else (list '+ a1 a2))))

  (define (=number? exp num)
    (and (number? exp) (= exp num)))

  (define (addend s) (car s))

  (define (augend s) (cadr s))

  (define (make-product m1 m2)
    (cond ((or (=number? m1 0)
               (=number? m2 0))
           0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2))
           (* m1 m2))
          (else (list '* m1 m2))))

  (define (multiplier p) (car p))

  (define (multiplicand p) (cadr p))

  (define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))

  (define (deriv-product exp var)
    (make-sum
     (make-product
      (multiplier exp)
      (deriv (multiplicand exp) var))
     (make-product
      (deriv (multiplier exp) var)
      (multiplicand exp))))

  (define (base e) (car e))

  (define (exponent e) (cadr e))

  (define (make-exponentiation b e)
    (cond ((=number? e 0) 1)
          ((=number? e 1) b)
          ((and (number? b) (number? e)) (expt b e))
          (else (list '** b e))))

  (define (deriv-exponentiation exp var)
    (make-product
     (exponent exp)
     (make-product
      (deriv (base exp) var)
      (make-exponentiation
       (base exp)
       (make-sum (exponent exp) -1)))))

  (put 'deriv '+ deriv-sum)
  (put 'deriv '* deriv-product)
  (put 'deriv '** deriv-exponentiation)
  'done)

(install-deriv)

(deriv '(* x y) 'x)
;y

(deriv '(** x 3) 'x)
;(* 3 (** x 2))

;1. They have no operators which is how we tag this data.

;2. Above

;3. Above

;4. You would need to swap op and type in put.
