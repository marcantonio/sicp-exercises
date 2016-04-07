(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items ()))

(square-list (list 1 2 3 4))
;(16 9 4 1)
;
; answer starts empty.  He is using cons to successively store the
; car of things onto the head of the list.

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square
                     (car things))))))
  (iter items ()))

(square-list (list 1 2 3 4))
;((((() . 1) . 4) . 9) . 16)
;
; This successively creates a pair who's first element is answer.

; Correct:

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1)
            (append (cdr list1)
                    list2))))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer
                      (list (square (car things)))))))
  (iter items ()))

(square-list (list 1 2 3 4))
