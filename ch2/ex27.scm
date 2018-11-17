;; Exercise 1.27

(define (reverse xs)
  (cond ((null? xs) '())
        ((and (list? xs) (list? (car xs)))
         (append (reverse (cdr xs)) (list (reverse (car xs)))))
        (else (append (reverse (cdr xs)) (list (car xs))))))

(reverse '(1 2 3 4))
;; (4 3 2 1)
(reverse '((1 2) (3 4)))
;; ((4 3) (2 1))

(reverse '(1 (2 (3 (4)))))
;; ((((4) 3) 2) 1)
