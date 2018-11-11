;; Exercise 2.18

(define (reverse xs)
  (define (iter ys acc)
    (if (null? ys)
        acc
        (iter (cdr ys) (cons (car ys) acc))))
  (iter xs '()))

(reverse '(1 4 9 16 25))
(assert (equal? (reverse (list 1 4 9 16 25)) '(25 16 9 4 1)))
