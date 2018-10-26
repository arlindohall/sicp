;; Exercise 1.5
;; In either evaluation order, we are to treat the if statement as evaluating
;; the same. Thus in either evaluation order, the if statement will find the
;; condition to be true, and evaluate to the consequent, or 0.

;; The difference is, in an applicative order interpreter, the operands of test
;; will be evaluated, and p will be treated as a procedure with no arguments,
;; which evaluates to itself. This will result in infinite recursion. In a
;; normal order interpreter, the two expressions (0 and (p)), will be
;; substituted into the original definition, and since the if statement does
;; not evaluate the alternative, the statement p will never be evaluated.
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))

;; The test procedure is shown here to work with two integers, showing that
;; it is in fact the definition of (p) which causes the infinite loop to
;; occured when test is evaluated. That is, the problem would occur with any
;; procedure evaluated in applicative order.
(assert (equal? (test 0 1) 0))

;; In the following code, (p) is quoted (which refers to the list containing
;; the symbol p rather than the procedure (p) with no arguments), since the
;; scheme interpreter uses applicative order, and the result would be an
;; infinite loop which would cause errors with the Jupyter notebook.
(assert (test 0 '(p)))
