;; Exercise 1.35
(load "util/close.scm")

(define phi 1.6180)

;; Definitions from chapter
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;; Show that phi is a fixed point of x -> 1 + 1/x

;; phi              = 1 + 1 / phi
;; phi^2            = phi + 1
;; phi^2 - phi - 1  = 0

;; - Here we use the quadratic formula

;; phi = (1 +- sqrt(1 - 4 * 1 * (-1))) / 2
;;     = (1 +- sqrt(1 + 4)) / 2
;;     = (1 +- sqrt(5)) / 2

;; The definition of phi is (1 + sqrt(5)) / 2, so this means phi is
;; a fixed point of the function x -> 1 + 1/x. The second point is
;; (phi - 1), or approx 0.6180

(define (f x)
  (+ 1 (/ 1 x)))

;; Note that the value of initial-guess has to be exactly (1 - phi)
;; in order to come back to (1 - phi), otherwise it will eventually
;; converge to phi
(assert (close? phi (fixed-point f 1.5)))
(assert (close? phi (fixed-point f 1)))
(assert (close? phi (fixed-point f -10)))
(assert (close? phi (fixed-point f 50)))
