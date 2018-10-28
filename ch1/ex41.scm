;; Example 1.41

(define (double f) 
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))

(assert (equal? ((double inc) 0) 2))

;; `(double double)` produces a procedure, which takes a procedure as
;;   argument and applies it four times

;; Applying `double` to this procedure, we get a procedure that takes a
;;   procedure as an argument and applies it 16 times

;; The expansion would be:
((double (double double)) inc)
((double (lambda (x) (double (double x)))) inc)
(((lambda (x) (double (double x))) (lambda (x) (double (double x)))) inc)
((lambda (x) (double (double (double (double x))))) inc)
(double (double (double (double inc))))

;; Now, reducing the `double` procedure, we get:
(lambda (x) (double (double (double (inc (inc x))))))

;; Skipping the additional lambdas for brevity's sake
(lambda (x) (double (double (inc (inc (inc (inc x)))))))

;; And the rest reduces to something like `add 16`
(assert (equal? (((double (double double)) inc) 5) 21))
