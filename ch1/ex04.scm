;; ## Exercise 1.4

;; I use the definition of `abs` from the chapter to test the behavior of the
;; following routine according to the semanics. The expectation is that the
;; `if` statement chooses the operator based on the value of `b`, and then
;; uses the resulting operator to evaluate the whole expression. Thus we
;; expect the predicate to evaluate to "true", which in scheme is represented
;; as `#t`
(define (abs x)
  (if (< x 0) (- x) x))

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(assert (= (+ 1 (abs -2))
           (a-plus-abs-b 1 -2))
        "Expected definition to match output")
