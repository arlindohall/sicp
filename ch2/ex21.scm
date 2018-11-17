;; Exercise 2.21
(load "util/math.scm")

(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list (cdr items)))))

(define nil '())
(define test '(1 2 3 4 5 6 7 8))
(define test-result '(1 4 9 16 25 36 49 64))
(assert (equal? test-result (square-list test)))

(define (square-list items)
  (map square items))

(assert (equal? test-result (square-list test)))
