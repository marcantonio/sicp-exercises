(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; Normal
; (gcd 206 40)
; (if (= 40 0)
;     206
;     (gcd 40
;          (remainder 206 40)))
;
; (if (= (remainder 206 40) 0) ; 1
;     40
;     (gcd (remainder 206 40)
;          (remainder 40 (remainder 206 40))))
;
; (if (= 6 0)
;     40
;     (gcd (remainder 206 40)
;          (remainder 40 (remainder 206 40))))
;
; (if (= (remainder 40 (remainder 206 40)) 0) ; 3
;     (remainder 206 40)
;     (gcd (remainder 40 (remainder 206 40))
;          (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;
; (if (= 4 0)
;     (remainder 206 40)
;     (gcd (remainder 40 (remainder 206 40))
;          (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;
; (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) ; 7
;     (remainder 40 (remainder 206 40))
;     (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;          (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;
; (if (= 2 0)
;     (remainder 40 (remainder 206 40))
;     (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;          (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;
; (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
;     (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;     (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;          (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;          (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;
; (if (= 0 0) ; 14
;     (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;     (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;          (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;          (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;
; (if (= 0 0)
;     2 ; 18
;     (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;          (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;          (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
; 2
;
; 18 times

; Applicative
; (gcd 206 40)
; (gcd 40 (remainder 206 40)) ; 1
; (gcd 40 6)
; (gcd 6 (remainder 40 6)) ; 2
; (gcd 6 4)
; (gcd 4 (remainder 6 4)) ; 3
; (gcd 4 2)
; (gcd 2 (remainder 4 2)) ; 4
; (gcd 2 0)
; 2
;
; 4 times
