(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

; Because without the special form, and with applicative-ordering, all of the clauses in (new-if
; predicate then-clause else-clause) are evaluated before cond is used.
