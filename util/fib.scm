;; TODO: Implement memoization for quicker procedure
;; Fibonacci numbers
(define (fib n)
  (define (iter a b count)
    (if (= count 0)
        b
        (iter (+ a b) a (- count 1))))
  (iter 1 0 n))


(assert (equal? (fib 5) 5))
