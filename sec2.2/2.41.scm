(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op
                      initial
                      (cdr sequence)))))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1)
            (append (cdr list1)
                    list2))))

(define (flatmap proc seq)
  (accumulate append () (map proc seq)))

(define (filter predicate sequence)
  (cond ((null? sequence) ())
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate
                       (cdr sequence))))
        (else  (filter predicate
                       (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      ()
      (cons low
            (enumerate-interval
             (+ low 1)
             high))))

(define (list-sum triple)
  (accumulate + 0 triple))

(define (uniq-triples n)
  (flatmap
   (lambda (i)
     (flatmap (lambda (j)
            (map (lambda (k)
                   (list i j k))
                 (enumerate-interval 1 (- j 1))))
          (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

(define (triple-sum n s)
   (filter (lambda (triple)
             (= (list-sum triple) s))
           (uniq-triples n)))

(triple-sum 5 9)
;((4 3 2) (5 3 1))
