;; ## Exercise 1.18
;; The same as 1.17, but with a logarithmic amount of space.
(define default-dir "$HOME/var/sicp/")

(define (fast-new* a b)
  (fast-new*-iter 0 a b))

;; Invariant -> n + a b
(define (fast-new*-iter n a b)
  (define (double m) (+ m m))
  (cond ((= b 0) n)
        ((even? b) (fast-new*-iter n
                                   (double a)
                                   (/ b 2)))
        (else (fast-new*-iter (+ n a)
                              a
                              (- b 1)))))

(assert (and (= (fast-new* 5  3) 15)
             (= (fast-new* 0  2) 0)
             (= (fast-new* 10 0) 0)
             (= (fast-new* 7  7) 49)
             (= (fast-new* 1  1) 1)))
