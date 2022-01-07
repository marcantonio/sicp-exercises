; given:
; C(n, k) = C(n-1, k-1) + C(n-1, k)
; C(n, 0) = C(n, n) = 1
(define (C n k)
  (if (or (= k 0) (= k n))
      1
      (+ (C (- n 1) (- k 1))
         (C (- n 1) k))))

; print out; in reverse
(define (pascals-triangle d)
  (define (line n)
    (define (output k)
      (display (C n k)) (display " ")
      (if (not (= n k))
          (output (+ k 1))))
    (output 0))

  (line d)
  (display "\n")
  (if (not (= d 0))
      (pascals-triangle (- d 1))))
