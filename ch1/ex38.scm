;; Exercise 1.38
(load "util/frac.scm")
(load "util/close.scm")

(define (e n)
  (+ 2 (cfrac (lambda (x) 1.0)
              denom
              n)))

(define (denom x)
  (if (= (remainder x 3) 2)
      (* (div (+ x 1) 3) 2)
      1))

(assert (equal? (denom 1) 1))
(assert (equal? (denom 2) 2))
(assert (equal? (denom 3) 1))
(assert (equal? (denom 4) 1))
(assert (equal? (denom 5) 4))
(assert (equal? (denom 6) 1))
(assert (equal? (denom 7) 1))
(assert (equal? (denom 8) 6))

;; Minimum number of iterations to get `close?` is 7
(assert (close? (e 7) 2.71828))
