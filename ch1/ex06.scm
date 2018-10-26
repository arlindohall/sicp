;; Exercise 1.6

;; Alyssa's new-if procedure seems at first glance to work just like if. In
;; fact, if the logic inside of new-if were used in place of if, then it would
;; work exactly the same. The problem with the new-if construct is parallel to
;; the issue in Exercise 1.5 - the applicative order evaluation causes both
;; the consequent and the alternative to be evaluated before being passed to
;; the new-if procedure. This causes our square-root procedure to infinitely
;; evaluate the expression (sqrt-iter (improve guess x) x)).

;; To demonstrate this, I'll show that using the cond logic works. However,
;; demonstrating the infinite regress of the new-if statement would break the
;; process, so it will be "left as an exercise to the reader".
(load "util/sqrt.scm")

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(assert (equal? (new-if (= 2 3) 0 5) 5))

(assert (equal? (new-if (= 1 1) 0 5) 0))
;; It can be seen that the cond statement below is equivalent to the
;; definition of new-if, and the problem arises from the application of
;; new-if, rather than the logic or evaluation order of cond.

;; Using normal order evaluation, we would find that applying new-if to the
;; operands of:
(define (sqrt-iter guess x)
   (new-if (good-enough? guess x)
           guess
           (sqrt-iter (improve guess x) x)))
;; would result in the following bindings:
;; (good-enough? guess x)              => predicate
;; guess                               => then-clause
;; (sqrt-iter (improve guess x) x)))   => else-clause
;; which is where the following expression comes from.

(define (sqrt-iter guess x)
  (cond ((good-enough? guess x) guess)
         (else (sqrt-iter (improve guess x) x))))

(assert (good-enough? (sqrt 9) 9))
