;; TODO: This probably shouldn't depend on other libs, right?
(load "util/close.scm")
(load "util/fixed.scm")

;; Take the numerical derivative of a function
;;   g - function expressed as procedure
(define (deriv g)
  (define dx 0.00001)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(assert (close? ((deriv (lambda (x) x)) 53) 1))

;; Newton's method for finding zeros of a function
;;   g - function expressed as a procedure
(define (newtons-method g guess)
  (fixed-point (lambda (x) (- x (/ (g x) ((deriv g) x)))) guess))

(assert (close? (newtons-method (lambda (x) x) 1) 0))

;; Implementations of square, etc
(define (square x) (* x x))
(define (cube x) (* x x x))

(assert (equal? (square 3) 9))
(assert (equal? (square 1) 1))
(assert (equal? (square 2) 4))

(assert (equal? (cube 2) 8))
(assert (equal? (cube 1) 1))

;; Increment and decrement
(define (inc x) (+ x 1))
(define (dec x) (- x 1))

(assert (equal? (inc 1) 2))
(assert (equal? (dec 10) 9))
