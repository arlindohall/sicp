;; Excercise 1.33
(load "util/acc.scm")
(load "util/prime.scm")

(define (filtered-accumulate filter-predicate combine null term a next b)
  (define (tested-term k)
    (let ((this-term (term k)))
         (if (filter-predicate this-term)
             this-term
             null)))
  (accumulate combine null tested-term a next b))

(define (sum-primes a b)
  (filtered-accumulate prime? + 0 identity a inc b))

(assert (equal? (sum-primes 2 3) 5))
(assert (equal? (sum-primes 64 66) 0))

(define (product-mutual-primes n)
  (define (mutual-prime-to-n a) (= (gcd n a) 1))
  (filtered-accumulate mutual-prime-to-n * 1 identity 2 inc n))

(assert (equal? (product-mutual-primes 2) 1))
(assert (equal? (product-mutual-primes 3) 2))
(assert (equal? (product-mutual-primes 4) 3))
