;; Exercise 2.20

(define (same-parity . xs)
  (define (this list-xs)
    (define (check a b) (if (odd? a) (odd? b) (even? b)))
      (cond ((null? list-xs) '())
            ((null? (cdr list-xs)) list-xs)
            (else (if (check (car list-xs) (cadr list-xs))
                      (cons (car list-xs) (this (cdr list-xs)))
                      (cons (car list-xs) (this (cddr list-xs)))))))
  (this xs))

(same-parity 1 2 3 4) ;; (1 3)
(same-parity 1 2 3 4 5 6 7) ;; (1 3 5 7)
(same-parity 2 3 4 5 6 7) ;; (2 4 6)

(assert (equal? (same-parity 1 2 3 4) '(1 3)))
(assert (equal? (same-parity 1 2 3 4 5 6 7) '(1 3 5 7)))
(assert (equal? (same-parity 2 3 4 5 6 7) '(2 4 6)))
