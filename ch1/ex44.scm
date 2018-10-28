;; Exercise 1.44
(load "util/math.scm")

(define (smooth f)
  (let ((dx 0.000001))
       (lambda (x)
               (/ (+ (f (- x dx))
                     (f (x))
                     (f (+ x dx))
                  3))))

(assert (equal? ((smooth identity) 1) 1))
(assert (not (equal? (smooth square) 3) 9))
(assert (close? ((smooth square) 3) 9))

(define (smooth-n f n)
  ((repeated smooth n) f))

(assert (equal? ((smooth-n identity 10) 1) 1))
(assert (not (equal? (smooth-n square 10) 3) 9))
(assert (close? ((smooth-n square 10) 3) 9))

