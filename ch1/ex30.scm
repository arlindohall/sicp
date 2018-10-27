;; Example 1.30
(load "util/close.scm")

;; Fill in the blanks on the definition of sum
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
		result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (sum-integers a b)
  (sum (lambda (x) x)
 	   a
	   (lambda (x) (+ x 1))
	   b))

;; Tests
;; Basic integral sum (example from text)
(assert (equal? (sum-integers 1 10) 55))

;; Pi sum example from text
(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))
(assert (close? (* 8 (pi-sum 1 1000)) 3.139592655589783))

;; Sum of cubes example from text
(define (cube x) (* x x x))
(define (inc n) (+ n 1))
(define (sum-cubes a b)
  (sum cube a inc b))
(assert (equal? (sum-cubes 1 10) 3025))

;; Integral uses sum, so if it works we can be fairly confident in sum
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))
(assert (close? (integral cube 0 1 0.01) .24998750000000042))
(assert (close? (integral cube 0 1 0.001) .249999875000001))
