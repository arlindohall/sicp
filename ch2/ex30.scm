;; Exercise 1.30
(load "util/math.scm")

;; No higher-order procedures
(define (square-tree tree)
  (cond ((not (list? tree))
         (error "Unable to process non-tree --- SQUARE-TREE" tree))
        ((null? tree) '())
        ((list? (car tree))
         (cons (square-tree (car tree))
               (square-tree (cdr tree))))
        (else
         (cons (square (car tree))
               (square-tree (cdr tree))))))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
             (list 6 7)))
;; (1 (4 (9 16) 25) (36 49))

;; Higher-order procedures
(define (square-tree tree)
  (if (not (list? tree))
      (square tree)
      (map square-tree tree)))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
             (list 6 7)))
;; (1 (4 (9 16) 25) (36 49))

(assert (equal? '(1 (4 (9 16) 25) (36 49))
                (square-tree '(1 (2 (3 4) 5) (6 7)))))
