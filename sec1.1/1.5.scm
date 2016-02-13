(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

; In a applicative-order evaluation, 'test' will resolve both operands before proceeding.  This will
; lead to an infinite expansion of '(test 0 (p))' to '(test 0 (p))'.  In normal-order evaluation,
; 'test' will only evaluate 'y' if necessary.  Since 'x' will always equal 0, 'y' (and thus 'p')
; will never be evaluated.
