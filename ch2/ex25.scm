;; Exercise 2.25

(define test '(1 3 (5 7) 9))
(assert (= 7 (cadr (caddr test))))

(define test '((7)))
(assert (= 7 (caar test)))

(define test '(1 (2 (3 (4 (5 (6 7)))))))
(assert (= 7 (cadr (cadr (cadr (cadr (cadr (cadr test))))))))
