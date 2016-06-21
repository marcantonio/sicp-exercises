#lang racket

(define (make-account balance passwd)
  (define attempts 0)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance
                     (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (call-the-cops)
    (error "Calling cops"))
  (define (bad-password amount)
    (set! attempts (+ attempts 1))
    (if (>= attempts 7)
        (call-the-cops)
        (begin (display "Incorrect password") (newline))))
  (define (dispatch p m)
    (if (eq? p passwd)
        (begin (set! attempts 0)
               (cond ((eq? m 'withdraw) withdraw)
                     ((eq? m 'deposit) deposit)
                     (else (error "Unknown request: MAKE-ACCOUNT" m))))
        bad-password))
  dispatch)

(define acc (make-account 100 'secret))
((acc 'secret 'deposit) 40)
;140
((acc 'sekret 'withdraw) 100)
;Incorrect password
((acc 'sekret 'withdraw) 100)
;Incorrect password
((acc 'secret 'withdraw) 100)
;40
((acc 'sekret 'withdraw) 100)
;Incorrect password
((acc 'sekret 'withdraw) 100)
;Incorrect password
((acc 'sekret 'withdraw) 100)
;Incorrect password
((acc 'sekret 'withdraw) 100)
;Incorrect password
((acc 'sekret 'withdraw) 100)
;Incorrect password
((acc 'sekret 'withdraw) 100)
;Incorrect password
((acc 'sekret 'withdraw) 100)
;Calling cops
