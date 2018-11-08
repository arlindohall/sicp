;; Exercise 2.8
(load "util/interval.scm")

;; Alyssa defined the quotient of two intervals as the product of the first
;; and the inverse of the second. Similarly, we can define the difference of
;; two intervals as the sum of the first and the additive inverse of the 
;; second.
(define (sub-interval a b)
  (add-interval a
                (make-interval (- (upper-bound b))
                               (- (lower-bound b)))))

(sub-interval test1 test2)

(assert (= (upper-bound (sub-interval test1 test2)) 0))
(assert (= (lower-bound (sub-interval test1 test2)) -2))
