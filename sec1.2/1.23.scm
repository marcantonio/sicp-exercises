(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
               n
               (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime)
                       start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (next n)
  (if (= n 2) 3 (+ n 2)))

;                               old                new
;10000000019 *** .06999999999999984 .03999999999999915
;10000000033 *** .06999999999999984 .05000000000000071
;10000000061 *** .07000000000000028 .03999999999999915

;100000000003 *** .24000000000000020 .14999999999999858
;100000000019 *** .22000000000000064 .14000000000000057
;100000000057 *** .21000000000000085 .14000000000000057

;1000000000039 *** .6699999999999999 .4299999999999997
;1000000000061 *** .6800000000000006 .4399999999999995
;1000000000063 *** .6699999999999999 .4400000000000013
;
; It's close to 2 but not quite there. Likely the discrepancy is due to (next)
; being more complex than a primitive (+).
