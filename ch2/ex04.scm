;; Exercise 2.4

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

;; Solution
(define (cdr z)
  (z (lambda (p q) q)))

(assert (= (car (cons 1 2)) 1))
(assert (= (cdr (cons 1 2)) 2))
