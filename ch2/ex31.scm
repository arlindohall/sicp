;; Exercise 1.31
(load "util/math.scm")

(define (tree-map proc tree)
  (if (not (list? tree))
      (proc tree)
      (map (lambda (t) (tree-map proc t))
           tree)))
(define (square-tree tree) (tree-map square tree))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
             (list 6 7)))
;; (1 (4 (9 16) 25) (36 49))

(assert (equal? '(1 (4 (9 16) 25) (36 49))
                (square-tree '(1 (2 (3 4) 5) (6 7)))))
