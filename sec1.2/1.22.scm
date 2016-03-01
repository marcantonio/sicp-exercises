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

(define (even? n)
  (= (remainder n 2) 0))

(define (search-for-primes n count)
  (cond ((even? n)
         (search-for-primes (+ n 1) count))
        ((not (prime? n))
         (search-for-primes (+ n 2) count))
        (else
         (cond ((= count 1)
                (timed-prime-test n))
               ((timed-prime-test n)
                (search-for-primes (+ n 2) (- count 1)))))))

; 10,000,000,000
(search-for-primes 10000000000 3)

10000000019 *** .08000000000000007
10000000033 *** .08999999999999997
10000000061 *** .08000000000000007

; 100,000,000,000
(search-for-primes 100000000000 3)

100000000003 *** .25
100000000019 *** .27000000000000024
100000000057 *** .2599999999999998

; 1,000,000,000,000
(search-for-primes 1000000000000 3)

1000000000039 *** .8200000000000003
1000000000061 *** .8100000000000005
1000000000063 *** .8200000000000003

; 10,000,000,000,000
(search-for-primes 10000000000000 3)

10000000000037 *** 2.5500000000000007
10000000000051 *** 2.549999999999999
10000000000099 *** 2.5500000000000007
