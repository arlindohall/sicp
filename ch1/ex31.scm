;; Example 1.31
(load "util/square.scm")
(load "util/close.scm")

;; Definition of product iterative and recursive
(define (product-recursive factor a next b)
  (cond ((> a b) 1)
        (else (* (factor a)
                 (product-recursive factor (next a) next b)))))

(define (product-iter factor a next b)
  (define (iter i acc)
    (if (> i b)
        acc
        (iter (next i) (* acc (factor i)))))
  (iter a 1))

;; Define the factorial in terms of product
(define (factorial n)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (product identity 2 inc n))

;; Define pi/4 using the Wallis formula
(define (pi-4-product n)
  (define (add2 k) (+ 2 k))
  (define (factor k)
    ;; Convert to decimal right away to save time
    (exact->inexact (/ (* (+ k 1) (- k 1))
                       (square k))))
  (product factor 3 add2 (+ n 3)))

;; Set the product procedure to the recursive version
(define product product-recursive)

;; Product of any number of one's is one
(assert (equal? (product (lambda (x) 1) 1 (lambda (x) (+ x 1)) 1000) 1))
;; Factorial of 5 should work with either product definition
(assert (equal? (factorial 5) 120))
(assert (close? (pi-4-product 10000) 0.7853981634))

;; Set the product procedure to the iterative version
(define product product-iter)

;; Product of any number of one's is one
(assert (equal? (product (lambda (x) 1) 1 (lambda (x) (+ x 1)) 1000) 1))
;; Factorial of 5 should work with either product definition
(assert (equal? (factorial 5) 120))
(assert (close? (pi-4-product 10000) 0.7853981634))
