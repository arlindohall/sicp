;; Exercise 1.40
(load "util/fixed.scm")
(load "util/math.scm")

(define (cubic a b c)
  (lambda (x)
          (+ (cube x)
             (* a (square x))
             (* b x)
             c)))

(define test (cubic -6 -7 3))
(assert (close? (newtons-method test -1.5) -1.2824))
(assert (close? (newtons-method test 0.1) 0.33680))
(assert (close? (newtons-method test 6.5) 6.9456))
