;; Example 2.10
(load "util/interval.scm")

(define (div-interval x y)
  (let ((up-y (upper-bound y))
 		(low-y (lower-bound y)))
    (if (= (- up-y low-y) 0)
        (error "Unable to divide by number whose interval spans zero"
               "--- DIV_INTERVAL"
               x y)
        (mul-interval x 
                      (make-interval (/ 1.0 (upper-bound y))
                                     (/ 1.0 (lower-bound y)))))))

(assert (= (lower-bound test-div-result) .2))
(assert (= (upper-bound test-div-result) 1))

