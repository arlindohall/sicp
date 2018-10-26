;; ## Exercise 1.21
;; Find the smallest divisors of 199, 1999, and 19999. The first two are
;;   prime, but the third is not.
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(assert (equal? (smallest-divisor 199) 199))
(assert (equal? (smallest-divisor 1999) 1999))
(assert (equal? (smallest-divisor 19999) 7))
