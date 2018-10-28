;; Exercise 1.37
(load "util/acc.scm")
(load "util/close.scm")

;; Continued Fraction (recursive)
(define (cfrac-rec n d k)
  (define (cfrac-to-k n d k i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (cfrac-to-k n d k (+ i 1))))))
  (cfrac-to-k n d k 1))

;; Continued Fraction (iterative)
(define (cfrac-iter n d k)
  (define (iter i acc)
    (if (= i 0)
        acc
        (iter (- i 1) (/ (n i) (+ (d i) acc)))))
  (iter k 0))

;; Both methods reach `close-enough` accuracy at 10 iterations,
;; which is expected since the algorithm is the same for both
;; procedures
(define cfrac cfrac-iter)
(assert (close? (cfrac (lambda (i) 1.0) (lambda (i) 1.0) 10) 0.6180))

(define cfrac cfrac-rec)
(assert (close? (cfrac (lambda (i) 1.0) (lambda (i) 1.0) 10) 0.6180))
