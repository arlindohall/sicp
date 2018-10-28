;; Procedures related to function and function composition
;; TODO: remove dependency on math (only required for given tests)
(load "util/math.scm")

;; Exercise 1.42
(define (compose f g)
  (lambda (x) (f (g x))))

(assert (equal? ((compose square inc) 6) 49))

;; Exercise 1.43
(define (repeated f n)
  (if (= n 0)
      (lambda (x) x)
      (lambda (x) (f ((repeated f (- n 1)) x)))))

(assert (equal? ((repeated square 2) 5) 625))
