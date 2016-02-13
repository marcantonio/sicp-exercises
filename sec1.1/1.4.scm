(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; if will test that 'b' is greater or less than 0 and evaluate to the operator + or -, respectively.
; In either case, 'a' will be added to the absolute value of 'b'.
