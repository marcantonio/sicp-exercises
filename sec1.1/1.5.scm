(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

; Applicative: The program will recure infinitely because x and y will be evaluated immediately and
; y (p) will expand forever.
;
; Normal: Will not recurse indefinitely because (= x 0) will evaluate to true and y will never be
; evaluated.
