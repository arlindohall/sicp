;; Exercise 1.43
(load "util/func.scm")

(define (repeated f n)
  (if (= n 0)
      (lambda (x) x)
      (lambda (x) (f ((repeated f (- n 1)) x)))))

(assert (equal? ((repeated square 2) 5) 625))
