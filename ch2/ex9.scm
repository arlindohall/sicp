;; Exercise 2.9
(load "util/interval.scm")

;; ADDITION
;; let interval1 = (l1 u1)
;; let interval2 = (l2 u2)

;; let w1 = width(interval1) = abs(u1 - l1)
;; let w2 = width(interval2) = abs(u2 - l2)

;; According to Alyssa's definition of sum-interval, the sum of
;; interval1 and interval2 is going to be:

;; let s = sum(interval1, interval2) = ((l1 + l2) (u1 + u2))
;; let ws = width(s) = (u1 + u2) - (l1 + l2)
;;                   = u1 + u2 - l1 - l2
;;                   = (u1 - l1) + (u2 - l2)
;;                   = w1 + w2
;; QED

;; Using interval.scm, we have the test values with the corresponding
;; variables from the above proof:
;; interval1 = test1
;; interval2 = test2
;; w1 = 1
;; w2 = 1
;; s = test-result
;; ws = 2
(define (width interval)
  (abs (- (upper-bound interval) (lower-bound interval))))

(width test1)
(width test2)
(width test-result)

;; MULTIPLICATION
(width (mul-interval test1 test2))

;; DIVISION
(width (div-interval test1 test2))

;; TEST
(assert (= (+ (width test1) (width test2)) (width test-result)))
(assert (not (= (+ (width test1) (width test2))
                (width (mul-interval test1 test2)))))
(assert (not (= (+ (width test1) (width test2))
                (width (div-interval test1 test2)))))
