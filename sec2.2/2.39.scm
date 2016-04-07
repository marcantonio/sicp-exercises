(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op
                      initial
                      (cdr sequence)))))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1)
            (append (cdr list1)
                    list2))))

(define (reverse sequence)
  (fold-right
   (lambda (x y)
     (append y (list x)))
     () sequence))

(reverse (list 1 2 3))

(define (reverse sequence)
  (fold-left
   (lambda (x y)
     (append (list y) x))
     () sequence))

(reverse (list 1 2 3))
