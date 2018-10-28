;; Exercise 1.42
(load "util/math.scm")

(define (compose f g)
  (lambda (x) (f (g x))))

(assert (equal? ((compose square inc) 6) 49))
