(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
               n
               (+ test-divisor 1)))))

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

(define (search-for-primes start end)
  (if (not (>= start end))
      (cond ((even? start) (search-for-primes (+ start 1) end))
            (else
             (timed-prime-test start)
             (search-for-primes (+ start 2) end)))))

(define (search-for-primes start end)
  (if (even? start)
      (search-for-primes (+ start 1) end)
      (cond ((<= start end)
             (timed-prime-test start)
             (search-for-primes (+ start 2) end)))))

; (search-for-primes 10000000000 10000000070)
;10000000019 *** .06999999999999984
;10000000033 *** .06999999999999984
;10000000061 *** .07000000000000028

; (search-for-primes 100000000000 100000000070)
;100000000003 *** .2400000000000002
;100000000019 *** .22000000000000064
;100000000057 *** .21000000000000085

; (search-for-primes 1000000000000 1000000000070)
;1000000000039 *** .6699999999999999
;1000000000061 *** .6800000000000006
;1000000000063 *** .6699999999999999

; Yes. For example, 0.24 * (sqrt 10) is ~0.75 which is
; on the order of the reported ~0.66.
