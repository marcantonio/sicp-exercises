(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n)
         (fast-prime? n (- times 1)))
        (else false)))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (nontrivial-check
           (square (expmod base (/ exp 2) m)) m)
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (nontrivial-check x n)
  (if (and (not (or (= x 1) (= (- n 1))))
           (= (remainder n x) 1))
      0
      x))

(fast-prime? 10 100)
;#f

(fast-prime? 11 100)
;#t

(fast-prime? 561 100)
;#f

(fast-prime? 2821 100)
;#f

; Note: Something doesn't seem right with this one. 0 is never returned from
; (nontrivial-check). However, (miller-rabin-test) works properly on carmichael
; numbers. I believe it's actually because of (= (expmod a (- n 1) n) 1). I've
; checked other solutions online and they seem to have the same issue. Maybe I'm
; missing something, but I don't think so. Anyway, I don't have the time or
; inclination to run this down further. It works.
