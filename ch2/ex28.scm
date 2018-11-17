;; Exercise 1.28

(define test (list (list 1 2) (list 3 4)))

(define (fringe tree)
  (cond ((not (list? tree))
         (error "Invalid argument, list required --- FRINGE" tree))
        ((null? tree) '())
        ((and (list? (car tree)) (list? (cdr tree)))
         (append (fringe (car tree)) (fringe (cdr tree))))
        ((not (list? (car tree)))
         (cons (car tree) (fringe (cdr tree))))))

(fringe test)
