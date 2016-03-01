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

(define (smallest-divisor-fast n)
  (find-divisor-fast n 2))

(define (find-divisor-fast n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor-fast
               n
               (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (prime-fast? n)
  (= n (smallest-divisor-fast n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime)
                       start-time))))

(define (timed-prime-test-fast n)
  (newline)
  (display n)
  (start-prime-test-fast n (runtime)))

(define (start-prime-test-fast n start-time)
  (if (prime-fast? n)
      (report-prime (- (runtime)
                       start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (next n)
  (if (= n 2) 3 (+ n 2)))

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

(define (search-for-primes-fast n count)
  (cond ((even? n)
         (search-for-primes-fast (+ n 1) count))
        ((not (prime-fast? n))
         (search-for-primes-fast (+ n 2) count))
        (else
         (cond ((= count 1)
                (timed-prime-test-fast n))
               ((timed-prime-test-fast n)
                (search-for-primes-fast (+ n 2) (- count 1)))))))

(search-for-primes 10000000000 3)
10000000019 *** .0799999999999983
10000000033 *** .08999999999999986
10000000061 *** .08999999999999986
(search-for-primes-fast 10000000000 3)
10000000019 *** .05999999999999872
10000000033 *** .05000000000000071
10000000061 *** .05000000000000071

(search-for-primes 100000000000 3)
100000000003 *** .26000000000000156
100000000019 *** .26000000000000156
100000000057 *** .259999999999998
(search-for-primes-fast 100000000000 3)
100000000003 *** .16999999999999815
100000000019 *** .1700000000000017
100000000057 *** .16999999999999815

(search-for-primes 1000000000000 3)
1000000000039 *** .8400000000000034
1000000000061 *** .8400000000000034
1000000000063 *** .8399999999999963
(search-for-primes-fast 1000000000000 3)
1000000000039 *** .5300000000000011
1000000000061 *** .5300000000000011
1000000000063 *** .5300000000000011

(search-for-primes 10000000000000 3)
10000000000037 *** 2.6099999999999994
10000000000051 *** 2.5999999999999943
10000000000099 *** 2.6499999999999986
(search-for-primes-fast 10000000000000 3)
10000000000037 *** 1.6599999999999966
10000000000051 *** 1.6599999999999966
10000000000099 *** 1.7000000000000028

; Improvement was not quite 2x.  Most like due to the user defined (next) with a call to (if) as
; opposed to the primitive (+).
