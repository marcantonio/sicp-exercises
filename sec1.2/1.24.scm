(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n)
         (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

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

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime (- (runtime)
                       start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;                              orig               next                fast
;10000000019 *** .06999999999999984 .03999999999999915 .010000000000000009
;10000000033 *** .06999999999999984 .05000000000000071 .020000000000000018
;10000000061 *** .07000000000000028 .03999999999999915 .010000000000000009

;100000000003 *** .24000000000000020 .14999999999999858 .019999999999999907
;100000000019 *** .22000000000000064 .14000000000000057 .010000000000000009
;100000000057 *** .21000000000000085 .14000000000000057 .010000000000000009

;1000000000039 *** .6699999999999999 .4299999999999997 .010000000000000009
;1000000000061 *** .6800000000000006 .4399999999999995 .010000000000000009
;1000000000063 *** .6699999999999999 .4400000000000013 .020000000000000018
;
; Much faster but almost no change as the numbers grow. I suspect this is due to
; the limited precision of the interpreter. This test will likely perform best
; with extremely large numbers.
