;; Example 29

(load "util/close.scm")
(load "util/square.scm")
(load "util/sum.scm")

(define (simpson-integral f a b n)
  (define (inc x) (+ x 1))
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (term k)
    (cond ((or (= k 0) (= k n)) (y k))
          ((odd? k) (* 4 (y k)))
          (else (* 2 (y k)))))
  (* (/ h 3)
     (sum term 0 inc n)))

(assert (close? (simpson-integral cube 0 1 100) 0.25))
(assert (close? (simpson-integral cube 0 1 1000) 0.25))
