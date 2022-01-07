(define (f g) (g 2))
(f f)

; The interpreter would eventually call (2 2), which fail to apply.
