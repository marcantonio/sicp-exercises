(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; (gcd 206 40)
; (if (= 40 0))
; (gcd 40 (remainder 206 40))
; (if (= (remainder 206 40) 0))*
; (if (= 6 0))
; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
; (if (= (remainder 40 (remainder 206 40)) 0))*
; (if (= (remainder 40 6) 0))*
; (if (= 4 0))
; (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
; (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0))*
; (if (= (remainder (remainder 206 40) (remainder 40 6)) 0))*
; (if (= (remainder (remainder 206 40) 4) 0))*
; (if (= (remainder 6 4) 0))*
; (if (= 2 0))
; (gcd  (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0))*
; (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 6))) 0))*
; (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) 4)) 0))*
; (if (= (remainder (remainder 40 (remainder 206 40)) (remainder 6 4)) 0))*
; (if (= (remainder (remainder 40 (remainder 206 40)) 2) 0))*
; (if (= (remainder (remainder 40 6) 2) 0))*
; (if (= (remainder 4 2) 0))*
; (if (= 0 0))
; (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))*
; (remainder (remainder 206 40) (remainder 40 6))*
; (remainder (remainder 206 40) 4)*
; (remainder 6 4)*
; 2
; Normal order: 18 times

; (gcd 206 40)
; (if (= 40 0))
; (gcd 40 (remainder 206 40))*
; (gcd 40 6)
; (if (= 6 0))
; (gcd 6 (remainder 40 6))*
; (gcd 6 4)
; (if (= 4 0))
; (gcd 4 (remainder 6 4))*
; (gcd 4 2)
; (if (= 2 0))
; (gcd 2 (remainder 4 2))*
; (gcd 2 0)
; (if (= 0 0))
; 2
; Applicative order: 4

; * (remainder) called
