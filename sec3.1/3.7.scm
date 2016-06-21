#lang racket

(define (make-account balance passwd)
  (define passwd-list '())
  (define (add-passwd p)
    (set! passwd-list (cons p passwd-list)))
  (add-passwd passwd)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance
                     (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (good-passwd? p passwd-list)
    (cond ((null? passwd-list) false)
          ((eq? p (car passwd-list)) true)
          (else (good-passwd? p (cdr passwd-list)))))
  (define (dispatch p m)
    (if (good-passwd? p passwd-list)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              ((eq? m 'add-passwd) add-passwd)
              (else (error "Unknown request: MAKE-ACCOUNT" m)))
        (error "Incorrect password")))
  dispatch)

(define (make-joint acc passwd new-passwd)
  ((acc passwd 'add-passwd) new-passwd)
  acc)

(define peter-acc (make-account 1000 'open-sesame))

(define paul-acc
  (make-joint peter-acc
              'open-sesame
              'rosebud))

((peter-acc 'open-sesame 'withdraw) 100)
;900
((paul-acc 'rosebud 'deposit) 200)
;1100
