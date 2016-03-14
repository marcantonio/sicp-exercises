(define (f g) (g 2))

(f square)

(f (lambda (z) (* z (+ z 1))))

(f f)
;The object 2 is not applicable.

; f applies f to 2, which then attempts to call (2 2)
