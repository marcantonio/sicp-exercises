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

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n)
         (fast-prime? n (- times 1)))
        (else false)))

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
  (if (fast-prime? n 100)
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
        ((not (fast-prime? n 100))
         (search-for-primes-fast (+ n 2) count))
        (else
         (cond ((= count 1)
                (timed-prime-test-fast n))
               ((timed-prime-test-fast n)
                (search-for-primes-fast (+ n 2) (- count 1)))))))

(search-for-primes 10000000000 3)
10000000019 *** .09000000000000341
10000000033 *** .09000000000000341
10000000061 *** .09000000000000341
(search-for-primes-fast 10000000000 3)
10000000019 *** 1.0000000000005116e-2
10000000033 *** 1.0000000000005116e-2
10000000019 *** 1.0000000000005116e-2

(search-for-primes 100000000000 3)
100000000003 *** .2600000000000051
100000000019 *** .25
100000000057 *** .269999999999996
(search-for-primes-fast 100000000000 3)
100000000003 *** 0.
100000000019 *** 9.999999999990905e-3
100000000057 *** 0.

(search-for-primes 1000000000000 3)
1000000000039 *** .8499999999999943
1000000000061 *** .8199999999999932
1000000000063 *** .8399999999999892
(search-for-primes-fast 1000000000000 3)
1000000000039 *** 0.
1000000000061 *** 1.0000000000005116e-2
1000000000063 *** 9.999999999990905e-3

(search-for-primes 10000000000000 3)
10000000000037 *** 2.6400000000000006
10000000000051 *** 2.6500000000000057
10000000000099 *** 2.6400000000000006
(search-for-primes-fast 10000000000000 3)
10000000000037 *** 1.0000000000005116e-2
10000000000051 *** 0.
10000000000099 *** 1.0000000000005116e-2
