;; Exercise 2.12
(load "util/interval.scm")

;; Provided by book
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

;; Requested new definitions
(define (make-center-percent c p)
  (let ((w (* c (/ p 100))))
       (make-center-width c w)))
(define (percent i)
  (* 100 (/ (width i) (center i))))

;; Tests
(define test-w (make-center-width 100 5))
(define test-p (make-center-percent 100 5))

(assert (equal? test-w test-p))

(define test-w (make-center-width 5 1))
(define test-p (make-center-percent 5 20))

(assert (equal? test-w test-p))
