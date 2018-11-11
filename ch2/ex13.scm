;; Exercise 2.13
(load "ch2/ex12.scm")
(load "util/close.scm")

;; Assuming all positive values...
;; For all percentage-tolerance values, multiplying two values gives the
;; following result value:

;; let val1 = center-percent(c1, p1)
;;          = interval(c1 - .5*(c1*p1),
;;                     c1 + .5*(c1*p1))
;; let val2 = center-precent(c2, p2)
;;          = interval(c2 - .5*(c2*p2),
;;                     c2 + .5*(c2*p2))

;; let prod = val1 * val2
;;          = interval((c1 - .5*(c1*p1))*(c2 - .5*(c2*p2)),
;;                     (c1 + .5*(c1*p1))*(c2 + .5*(c2*p2)))
;;          = interval(c1*c2 - .5*c1*c2*p2 - .5*c2*c1*p1 + c1*c2*p1*p2,
;;                     c1*c2 + .5*c1*c2*p2 + .5*c2*c1*p1 + c1*c2*p1*p2)

;; The new tolerance on `prod` is:

;; let tol =  c1*c2 + .5*c1*c2*p2 + .5*c2*c1*p1   + c1*c2*p1*p2
;;         - (c1*c1 - .5*c1*c2*p2 - .5*c2*c1*p1   + c1*c2*p1*p2)
;;         = 0      + c1*c2*p2*2  + c2*c1*p1*2    + 0
;;         = c1*c2*(p1 + p2)

;; Thus the percentage tolerance is going to be:
;; let tol-p = (c1*c2*(p1+p2)) / c1*c2
;;           = p1 + p2

(define test1 (make-center-percent 10 .001))
(define test2 (make-center-percent 10 .001))
(define prod  (mul-interval test1 test2))

(define expected-tol 
  (let ((p1 (percent test1))
        (p2 (percent test2)))
  (+ p1 p2 )))

(assert (close? expected-tol (percent prod)))
