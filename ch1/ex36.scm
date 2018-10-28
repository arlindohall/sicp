;; Exercise 1.36
(load "util/close.scm")

;; Comment out the display methods
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    ;; (display "guess: ")
    ;; (display guess)
    ;; (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  ;; (newline)
  (try first-guess))

(assert (close? (fixed-point cos 1) 0.7390822985224023))

(define (func x) (/ (log 1000) (log x)))
(define (func-damp x)
  (/ (+ x 
        (/ (log 1000)
           (log x)))
     2))

;; This version takes 28 steps to converge
(assert (close? (fixed-point func 4) 4.555538934848503))
;; While the damped version takes only 4
(assert (close? (fixed-point func-damp 4) 4.555538934848503))

;; This is probably ver deeply related to control theory, but
;; since it's around 8 on a weekend night, I'm not going to do
;; the research to figure it out
