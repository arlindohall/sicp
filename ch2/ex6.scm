;; Exercise 2.6

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define (test x) (+ x 1))
(define (test-number number) ((number test) 0))

(test-number zero)          ;; 0
(test-number (add-1 zero))  ;; 1

;; Expansion of (add-1 zero)

;; (add-1 zero)
;; (lambda (f) (lambda (x) (f ((zero f) x))))
;; (lambda (f) (lambda (x) (f (((lambda (f1) (lambda (x1) x1)) f) x))))

;; So zero takes one argument, a function f, and returns a function that
;; applies the argument f zero times to the argument of the lambda x

;; Similarly, one takes one argument, a function, and returns a function
;; that applies the argument f one time to the argument of the lambda x
;; This can be simplified as:

;; (lambda (f) (lambda (x) (f ((lambda (x1) x1) x))))
;; (lambda (f) (lambda (x) (f x)))
(define one (lambda (f) (lambda (x) (f x))))

;; We can then deduce the definition of two from this to be:
;; (lambda (f) (lambda (x) (f (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(test-number one) ;; 1
(test-number two) ;; 2

;; By this reasoning, the operation of `+` is going to be the application
;; of functions as well. So `m + n` is "apply function `f` m times, then apply
;; it n times again.

;; Another way to look at this is with an example: we want one plus two
;; to be three, or (plus one two) should simplify to an expression like
;; (lambda (f) (lambda (x) (f (f (f x)))))

;; I am pretty sure this is times, although I don't think it works for zero
;; (define (plus m n)
;;   (lambda (f) (m (n f))))

(define (plus m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))

(test-number (plus zero two)) ;; 2
(test-number (plus one two))  ;; 3
(test-number (plus two two))  ;; 4

;; TESTS
(assert (= (test-number zero) 0))
(assert (= (test-number (add-1 zero)) 1))

(assert (= (test-number one) 1))
(assert (= (test-number two) 2))

(assert (= (test-number (plus zero two)) 2))
(assert (= (test-number (plus one two)) 3))
(assert (= (test-number (plus two two)) 4))
