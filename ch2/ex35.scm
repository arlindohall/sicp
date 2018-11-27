;; Exercise 2.35
(load "util/stream.scm")

(define (count-leaves t)
  (define (add a b) (+ a b))
  (define (count-children node)
    (if (list? node) (count-leaves node) 1))
  (accumulate add 0 (map count-children t)))

(define test '())
(count-leaves test) ;; 0

(define test '(a b c d e))
(count-leaves test) ;; 5

(define test '(a (b c) (d (e f))))
(count-leaves test) ;; 6


(define test '())
(assert (= (count-leaves test) 0))

(define test '(a b c d e))
(assert (= (count-leaves test) 5))

(define test '(a (b c) (d (e f))))
(assert (= (count-leaves test) 6))
