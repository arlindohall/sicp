;; Definition of sum, iterative from ex 1.30

;; Sum a of a group of terms
;;   - term: procedure that takes a number k and produces the kth term
;;   - a:    the first index in the sum series
;;   - next: procedure that takes a number k and produces the next k in the
;;           series, useful for series that sum over multiple variables
;;   - b:    the last index in the sum series
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
		result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(assert (equal? (sum (lambda (x) 1) 1 (lambda (x) (+ x 1)) 100)
                100))
