#lang racket

(define (make-account balance passwd)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance
                     (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch p m)
    (if (eq? p passwd)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request: MAKE-ACCOUNT" m)))
        (error "Incorrect password")))
  dispatch)

(define acc (make-account 100 'secret))
((acc 'secret 'deposit) 40)
;140
((acc 'sekret 'withdraw) 100)
;Incorrect password
