;; Exercise 1.46
(load "util/math.scm")

(define (iterative-improve good-enough? improve guess)
  (if (good-enough? guess)
      guess
      (iterative-improve good-enough? improve (improve guess))))

;; FIXED-POINT
(define (fixed-point f first-guess)
  (iterative-improve (lambda (x) (close? x (f x)))
                     f
                     first-guess))

(define phi 1.6180)
(define (f x)
  (+ 1 (/ 1 x)))

;; Re-use tests from ex35
(assert (close? phi (fixed-point f 1.5)))
(assert (close? phi (fixed-point f 1)))
(assert (close? phi (fixed-point f -10)))
(assert (close? phi (fixed-point f 50)))

;; SQUARE ROOT
(define (sqrt x)
  (define (improve guess)
    (average guess (/ x guess)))
  (define (average a b)
    (/ (+ a b) 2))
  (define (almost-sqrt-x guess)
    (close? (square guess) x))
  (iterative-improve almost-sqrt-x
                     improve
                     1.0))

(assert (close? (sqrt 9) 3))
(assert (close? (sqrt 100) 10))
