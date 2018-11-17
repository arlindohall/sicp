;; Exercise 1.29

;; PROVIDED
(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))

;; A
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cadr mobile))

(define (branch-length branch) (car branch))
(define (branch-structure branch) (cadr branch))

;; B
(define (total-weight structure)
  (if (list? structure) ;; Structure is a sub-mobile
      (+ (total-weight (branch-structure (left-branch structure)))
         (total-weight (branch-structure (right-branch structure))))
      structure))

(define submobile
  (make-mobile (make-branch 3 4)
               (make-branch 6 2)))
(define test
        (make-mobile (make-branch 3 10)
                     (make-branch 5 submobile)))

(total-weight submobile) ;; 6
(total-weight test) ;; 16

(define (balanced mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (= (* (branch-length left) (total-weight (branch-structure left)))
       (* (branch-length right) (total-weight (branch-structure right))))))

(balanced submobile) ;; true
(balanced test) ;; true

(assert (balanced submobile))
(assert (balanced test))
