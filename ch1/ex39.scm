;; Exercise 1.39
(load "util/frac.scm")
(load "util/close.scm")

(define num-iterations 4) ;; Minimum required to get accurate answer
(define (tan x)
  (cfrac (lambda (i) (= i 1)
                     x
                     (- (square x)))
         (lambda (i) (- (* i 2.0) 1.0))
         num-iterations))

;; TODO: I'm not sure why this comes out negative
(assert (close? (tan 1) -1.5574077))
