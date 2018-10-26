;; Evaluate the following expressions
;; I'll just drop all of these in `eq?` statements to verify the value

;; Simple expressions

(assert (equal? 10 10))
(assert (equal? (+ 5 4 3) 12))
(assert (equal? (- 9 1) 8))
(assert (equal? (/ 6 2) 3))

;; Complex expressions

;; This is a compound expression. The operator is a primitive,
;; so no substitution is required. The operands evaluate to `8`
;; and `-2` respectively, so the result is `6`
(assert (equal? (+ (* 2 4) (- 4 6)) 6))

;; This is the first example of a special form. Define does 
;; not evaluate either `a` or the primitive `3`, but instead 
;; creates a new symbol in the environment called `a`, whose
;; definition is the primitive `3`. This result is not
;; accompanied by any output, but does affect our use of the
;; symbol `a` in future expressions.
(define a 3)

;; This expression defines a new symbol which is equal to the 
;; evaluation of the second operand, `(+ a 1)`, which is the
;; same as the arithmetical expression `a + 1`, which is `4`.
(define b (+ a 1))

;; This expression retrieves the values of `a` and `b` from the
;; environment, and uses them to evaluate first the operand 
;; `(* a b)` to `(* 3 4)`, which is `12`, and then the complete
;; expression `(+ a b 12)`, which is `(+ 3 4 12)`, evaluates to
;; `19`.
(assert (equal? (+ a b (* a b)) 19))

;; Expressions involving predicates

;; This expression is a predicate, since it evaluates to "false",
;; which in Scheme is represented by the symbol `#f`
(assert (equal? (= a b) #f))

;; Now we have our second special form: `if`. This expression
;; first evaluates the predicate to see that `b` is greater
;; than `a`, and `b` is less than `b * a`, and since the
;; predicate is true, the consequent is then evaluated to `b`,
;; which is `4`, so the value of the whole expression is `4`.
(assert (equal? (if (and (> b a) (< b (* a b))) b a) 4))

;; This expression uses the special form `cond`. The first
;; predicate is evaluated, and since `a` is not equal to `4`,
;; evaluation continues. The second predicate is evaluated, and
;; found to be true, so the value of the whole expression is
;; equal to the evaluation of the second consequent, which is
;; equal to `16`
(assert (equal? (cond ((= a 4) 6)
                      ((= b 4) (+ 6 7 a))
                      (else 25))
                16))

(assert (equal? (+ 2 (if (> b a) b a)) 6))
(assert (equal? (* (cond ((> a b) a)
                         ((< a b) b)
                         (else -1))
                   (+ a 1))
                16))
