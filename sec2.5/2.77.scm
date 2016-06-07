#lang racket

(require racket/include)
(include "../common/ddp.scm")
(include "numbers.scm")

(magnitude (make-complex-from-real-imag 10 20))
;22.360679774997898

;magnitude, as defined in the rectangular and polar packages, is
;indexed by '(rectangular) and '(polar).  The data structure in figure
;2.24 is tagged as '(complex).  The combination of magnitude and
;'(complex) doesn't exist.  Alyssa's solution creates this
;combination.
;
;(magnitude z)
;(apply-generic 'magnitude z)
;(get magnitude '(complex))
;(apply magnitude (contents z))
;(magnitude (contents z))
;(apply-generic 'magnitude (contents z))
;(get magnitude '(rectangular))
;(apply magnitude (contents (contents z)))
;(sqrt (+ (square (real-part z))
;         (square (imag-part z))))
;
;apply-generic is called twice.  First for '(complex) and second for
;'(rectangular).
