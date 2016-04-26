(define (memq item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))

(list 'a 'b 'c)
;Value 15: (a b c)
(list (list 'george))
;Value 16: ((george))
(cdr '((x1 x2) (y1 y2)))
;Value 17: ((y1 y2))
(cadr '((x1 x2) (y1 y2)))
;Value 18: (y1 y2)
(pair? (car '(a short list)))
;Value: #f
(memq 'red '((red shoes) (blue socks)))
;Value: #f
(memq 'red '(red shoes blue socks))
;Value 19: (red shoes blue socks)
