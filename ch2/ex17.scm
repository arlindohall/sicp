;; Exercise 2.17

(define (last-pair xs)
  (cond ((null? xs) '())
        ((null? (cdr xs)) xs)
        (else (last-pair (cdr xs)))))

(last-pair '())
(last-pair '(a))
(last-pair '(a b c d))

(assert (equal? '(d) (last-pair '(a b c d))))
(assert (equal? (last-pair (list 23 72 149 34)) '(34)))

