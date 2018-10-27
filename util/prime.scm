(load "util/square.scm")

;; Prime
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

;; Prime test
(assert (divides? 2 4))
(assert (not (divides? 2 3)))

(assert (equal? (find-divisor 5 2) 5))
(assert (equal? (find-divisor 4 2) 2))
(assert (equal? (find-divisor 12 2) 2))
(assert (equal? (find-divisor 12 3) 3))

(assert (equal? (smallest-divisor 199) 199))
(assert (equal? (smallest-divisor 1999) 1999))
(assert (equal? (smallest-divisor 19999) 7))

;; This was failing on a previous implementation because of a
;; misunderstanding of the Miller-Rabin theorem. 

;; TODO: Fix the implementation of Miller-Rabin in ex1.28 and revisit this

(assert (prime? 19)) ;; Prime number that fermat's test finds
(assert (not (prime? 16)))
;; Charmichael numbers
(map (lambda (n) (assert (not (prime? n))))
     '(561 1105 1729 2465 2821 6601))

;; GCD and LCM
;; TODO: LCM
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

