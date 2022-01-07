(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

; (+ 4 3)
; (inc (+ (dec 4) 3))
; (inc (+ 3 3))
; (inc (inc (+ (dec 3) 3)))
; (inc (inc (+ 2 3)))
; (inc (inc (inc (+ (dec 2) 3))))
; (inc (inc (inc (+ 1 3))))
; (inc (inc (inc (inc (+ (dec 1) 3)))))
; (inc (inc (inc (inc (+ 0 3)))))
; (inc (inc (inc (inc 0)))
; (inc (inc (inc 1)))
; (inc (inc 2))
; (inc 3)
; 4
; recursive

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

; (+ 4 3)
; (+ (dec 4) (inc 3))
; (+ 3 4)
; (+ (dec 3) (inc 4))
; (+ 2 5)
; (+ (dec 2) (inc 5))
; (+ 1 6)
; (+ (dec 1) (inc 6))
; (+ 0 7)
; 7
; iterative
