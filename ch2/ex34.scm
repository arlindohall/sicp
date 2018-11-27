;; Exercise 2.34
(load "util/stream.scm")

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
					  (+ (* x higher-terms) this-coeff))
              0
              coefficient-sequence))

(horner-eval 2 (list 1 3 0 5 0 1)) ;; 79

(assert (= 79 (horner-eval 2 (list 1 3 0 5 0 1))))

