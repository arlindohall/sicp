;; Example 1.32

;; Used to test accumulator
(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum term a next b)
  (accumulate + 0 term a next b))

;; Helpers
(define (vals x) (lambda (y) x))
(define ones (vals 1))
(define zeros (vals 0))
(define (identity x) x)
(define (inc x) (+ x 1))

;; Recursive
(define (accumulate-rec combine null term a next b)
  (if (> a b)
      null
      (combine (term a)
               (accumulate-rec combine null term (next a) next b))))

;; Iterative
(define (accumulate-it combine null term a next b)
  (define (iter k accumulator)
    (if (> k b)
        accumulator
        (iter (next k) (combine (term k) accumulator))))
  (iter a null))

;; TEST
(define accumulate accumulate-rec)
(assert (equal? (sum zeros 1 inc 1000) 0))
(assert (equal? (product zeros 1 inc 1000) 0))
(assert (equal? (product ones 1 inc 1000) 1))

(define accumulate accumulate-it)
(assert (equal? (sum zeros 1 inc 1000) 0))
(assert (equal? (product zeros 1 inc 1000) 0))
(assert (equal? (product ones 1 inc 1000) 1))

