(define (fermat-test n a)
  (= (expmod a n n) a))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-all n)
  (define (iter a)
    (cond ((= a n) #t)
          ((not (fermat-test n a)) #f)
          (else (iter (+ a 1)))))
  (iter 2))

; (fermat-all 8)
;#f
; (fermat-all 11)
;#t
; (fermat-all 2821)
;#t
; (prime? 2821)
;#f
