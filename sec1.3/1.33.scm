; 1

(define (prime? n)
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

  (= n (smallest-divisor n)))

(define (filtered-accumulate predicate combiner null-value term a next b)
  (cond ((predicate a)
         (if (> a b)
             null-value
             (combiner (term a)
                       (filtered-accumulate predicate combiner null-value term (next a) next b))))
        (else
         (filtered-accumulate predicate combiner null-value term (next a) next b))))

(define (sum-prime-squared a b)
  (define (term a)
    (* a a))

  (define (next a) (+ a 1))

  (filtered-accumulate prime? + 0 term a next b))

; 2

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (pos-product n)
  (define (relatively-prime? i)
    (= (gcd i n) 1))

  (define (identity x) x)

  (define (inc x) (+ x 1))

  (filtered-accumulate relatively-prime? * 1 identity 1 inc ( - n 1)))
