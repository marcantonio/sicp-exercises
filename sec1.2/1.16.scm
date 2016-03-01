(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n a)
  (cond ((= n 0)
         a)
        ((even? n)
         (fast-expt-iter (square b) (/ n 2) a))
        (else
         (fast-expt-iter b (- n 1) (* a b)))))

(define (even? n)
  (= (remainder n 2) 0))

; ab^n
; O(n)
; 1 * 2^3 = 8
; 2 * 2^2 = 8
; 4 * 2^1 = 8
; 8 * 2^0 = 8
;
; O(logn)
; 1   *  8^3 = 512
; 8   *  8^2 = 512
; 8   * 64^1 = 512
; 512 * 64^0 = 512
