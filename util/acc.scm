;; UTILIIES
(define (accumulate combine null term a next b)
  (define (iter k accumulator)
    (if (> k b)
        accumulator
        (iter (next k) (combine (term k) accumulator))))
  (iter a null))

;; Redefine sum and product by this method
(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum term a next b)
  (accumulate + 0 term a next b))

;; HELPERS
(define (vals x) (lambda (y) x))
(define ones (vals 1))
(define zeros (vals 0))
(define (identity x) x)
(define (inc x) (+ x 1))

;; TESTS
(assert (equal? (sum zeros 1 inc 1000) 0))
(assert (equal? (product zeros 1 inc 1000) 0))
(assert (equal? (product ones 1 inc 1000) 1))

