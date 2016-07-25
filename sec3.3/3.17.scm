(define count 0)
(define seen '())

(define (count-pairs x)
  (if (null? x)
      count
      (cond ((not (on-list? x seen))
             (set! seen (cons x seen))
             (set! count (+ count 1))
             (count-pairs (cdr x)))
            (not (pair? x) count)
            (else (count-pairs (cdr x))))))

(define (on-list? x seen)
  (cond ((null? seen) #f)
        ((eq? x (car seen)) #t)
        (else (on-list? x (cdr seen)))))

(define (reset!)
  (set! count 0)
  (set! seen '())
  '())

(count-pairs '(1 2 3))
; 3
(reset!)

(define z '(1 2 3))
(set-car! z (cddr z))
(count-pairs z)
; 3
(reset!)

(define z '(1 2 3))
(set-car! z (cdr z))
(set-cdr! z (cdr z))
(set-car! (cdr z) (cddr z))
(set-cdr! (cdr z) (cddr z))
(count-pairs z)
; 3
(reset!)

(define z '(1 2 3))
(set-cdr! (cddr z) z)
(count-pairs z)
;3
(reset!)
