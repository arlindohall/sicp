;; Excercise 1.16
;; The hint from the exercise makes our work somewhat easier. The hint says
;;   to use the invariant $ a b^n $ to guide our procedure, meaning that we
;;   change $a$ and $n$ at each call in order to keep the expression constant,
;;   so that at the end of the call pattern, all values are known and one of
;;   the values is the answer we are looking for.
(define (fast-expt b n)
  (fast-expt-iter 1 b n))

;; Invariant -> a * b^n
(define (fast-expt-iter a b n)
  (define (square m) (* m m))
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter a
                                   (square b)
                                   (/ n 2)))
        (else (fast-expt-iter (* a b)
                              b
                              (- n 1)))))

(assert (= 32 (fast-expt 2 5)))
