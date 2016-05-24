#lang racket

(define *op-table* (make-hash))

(define (put op type proc)
  (hash-set! *op-table* (list op type) proc))

(define (get op type)
  (hash-ref *op-table* (list op type) '()))

(define (attach-tag type-tag contents)
  (cons type-tag contents))

(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (error "Bad tagged datum:
              TYPE-TAG" datum)))

(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (error "Bad tagged datum:
              CONTENTS" datum)))

;; division file
(define (make-div-file div-name db)
  (cons div-name db))

(define (div-name file)
  (car file))

(define (div-db file)
  (cdr file))

;; division dbs
(define divisionA '((GeorgeWashington
                    ((address "123 Main St") (salary 25000)))
                   (AbrahamLincoln
                    ((address "321 Broad St") (salary 35000)))
                   (JohnFKennedy
                    ((address "456 2nd St") (salary 45000)))
                   (RonaldRegan
                    ((address "654 3nd St") (salary 55000)))))

(define divisionB '((((address "123 Main St") (salary 25000))
                    LindenJohnson)
                   (((address "321 Broad St") (salary 35000))
                    HarryTruman)
                   (((address "456 2nd St") (salary 45000))
                    FranklenDRoosevelt)
                   (((address "654 3nd St") (salary 55000))
                    JohnAdams)))

;; division files
(define divisionA-file (make-div-file 'divisionA divisionA))
(define divisionB-file (make-div-file 'divisionB divisionB))

;; division A
(define (installDivisionA)
  ;; internal
  (define (find-attr attr attrs)
    (let ((cur (car attrs)))
      (if (eq? attr (car cur))
          (cadr cur)
          (find-attr attr (cdr attrs)))))

  (define (name rec) (car rec))

  (define (addr rec) (find-attr 'address (cadr rec)))

  (define (salary rec) (find-attr 'salary (cadr rec)))

  (define (get-record empl-name db)
    (if (null? db)
        '()
        (let ((cur-empl (car db)))
          (if (eq? empl-name (name cur-empl))
              cur-empl
              (get-record empl-name (cdr db))))))

  (define (get-salary empl) (salary empl))

  ;; external
  (put 'get-record 'divisionA get-record)
  (put 'get-salary 'divisionA get-salary)
  'done)

(installDivisionA)

;; division B
(define (installDivisionB)
  ;; internal
  (define (find-attr attr attrs)
    (let ((cur (car attrs)))
      (if (eq? attr (car cur))
          (cadr cur)
          (find-attr attr (cdr attrs)))))

  (define (name rec) (cadr rec))

  (define (addr rec) (find-attr 'address (car rec)))

  (define (salary rec) (find-attr 'salary (car rec)))

  (define (get-record empl-name db)
    (if (null? db)
        '()
        (let ((cur-empl (car db)))
          (if (eq? empl-name (name cur-empl))
              cur-empl
              (get-record empl-name (cdr db))))))

  (define (get-salary empl) (salary empl))

  ;; external
  (put 'get-record 'divisionB get-record)
  (put 'get-salary 'divisionB get-salary)
  'done)

(installDivisionB)

(define (get-record empl-name file)
  ((get 'get-record (div-name file)) empl-name (div-db file)))

(define (get-salary empl-name file)
  ((get 'get-salary (div-name file))
   (get-record empl-name file)))

(define (find-employee-record empl-name files)
  (if (null? files)
      (error "Employee not found:" empl-name)
      (let ((record (get-record empl-name (car files))))
        (if (not (null? record))
            record
            (find-employee-record empl-name (cdr files))))))

;1.
(get-record 'JohnFKennedy divisionA-file)
;'(JohnFKennedy ((address "456 2nd St") (salary 45000)))

(get-record 'FranklenDRoosevelt divisionB-file)
;'(((address "456 2nd St") (salary 45000)) FranklenDRoosevelt)

;2.
(get-salary 'JohnFKennedy divisionA-file)
;45000

(get-salary 'FranklenDRoosevelt divisionB-file)
;45000

;3.
(find-employee-record 'AbrahamLincoln (list divisionA-file divisionB-file))
;(AbrahamLincoln ((address "321 Broad St") (salary 35000)))

(find-employee-record 'JohnAdams (list divisionA-file divisionB-file))
;(((address "654 3nd St") (salary 55000)) JohnAdams)

;4.
;A new division module will be needed as well as a new division file.
