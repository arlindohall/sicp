(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
		0
        (iter (next a) (+ result (term a)))
  (iter a b))

(define (sum-integers a b)
  (sum (lambda (x) x)
 	   a
	   (lambda (x) (+ x 1))
	   b))

(assert (equal? (sum-integers 1 10) 55))
