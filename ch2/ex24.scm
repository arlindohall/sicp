;; Exercise 2.24

(list 1 (list 2 (list 3 4)))
;; (1 (2 (3 4))

;; 1 | *
;;     `->  * | '()
;;          `-> 2 | *
;;                  `-> * | '()
;;                      `-> 3 | *
;;                              `-> 4 | '()


(define test (list 1 (list 2 (list 3 4))))
(assert (= 4 (car (cdr (car (cdr (car (cdr test))))))))
(assert (= 4 (cadr (cadr (cadr test)))))
