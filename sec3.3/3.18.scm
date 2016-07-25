(define (is-loop? x)
  (define seen '())

  (define (detect y)
    (if (null? y)
        #f
        (if (not (on-list? y seen))
            (begin
              (set! seen (cons y seen))
              (detect (cdr y)))
            #t)))
  (detect x))

(define (on-list? x seen)
  (cond ((null? seen) #f)
        ((eq? x (car seen)) #t)
        (else (on-list? x (cdr seen)))))

(define z '(1 2 3))
(is-loop? z)
; #f

(set-cdr! (cddr z) z)
(is-loop? z)
; #t
