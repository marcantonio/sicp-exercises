(define (identity x) x)
(define (inc x) (+ x 1))

(define (prime? n)
  (define (smallest-divisor n)
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
    (find-divisor n 2))
  (= n (smallest-divisor n)))

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (filtered-accumulate combiner null-value
                             term a next b predicate)
  (define (iter a result)
    (if (> a b)
        result
        (if (predicate a)
            (iter (next a) (combiner (term a) result))
            (iter (next a) result))))
  (iter a null-value))

(define (sum-square-primes a b)
  (filtered-accumulate + 0 square a inc b prime?))

(sum-square-primes 1 10)
;88

(define (product-relprimes n)
  (define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))
  (define (relprime? i)
    (= 1 (gcd i n)))
  (filtered-accumulate * 1 identity 1 inc n relprime?))

(product-relprimes 10)
;189
