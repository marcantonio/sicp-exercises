(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
; The if form will return an operator depending on sign. The operator will be applied to a and b.
