(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list
         (left-branch tree)
         (cons (entry tree)
               (copy-to-list
                (right-branch tree)
                result-list)))))
  (copy-to-list tree '()))

(define (key rec) (car rec))

(define (lookup given-key tree-of-records)
  (define (lookup-recur given-key set-of-records)
    (cond ((null? set-of-records) false)
          ((= given-key (key (car set-of-records)))
           (car set-of-records))
          (else
           (lookup-recur given-key
                         (cdr set-of-records)))))
  (lookup-recur given-key
                (tree->list-2 tree-of-records)))
