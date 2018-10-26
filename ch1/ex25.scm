;; Exercise 1.25
;; Another Alyssa P. Hacker question, what is wrong with her expmod:

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

;; Recall, our expmod is:
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m)))) 

;; And fast-expt is
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

;; Looking at this, we see that the `expmod` process is going to take the
;;   remainder after each application of the `expmod` procedure, which means
;;   that each time the procedure is called, the exponent is either cut in
;;   half, subtracted one, or the process is completed. Meanwhile, for
;;   Alyssa's fast-expt, the remainder is not taken. This way, even though the
;;   number of steps will be the same until the exponentiation is done, the
;;   callbacks (by which I mean substituting the values of the expressions
;;   into the `remainder` procedure), are going to provide much smaller
;;   values. This will cause us to reach an integer overflow much more slowly.
