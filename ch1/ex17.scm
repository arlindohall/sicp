;; ## Exercise 1.17
;; Replace the existing `*` primitive with a procedure which, like
;;   `fast-expt`, uses a logarithmic amount of calls (though not a logarithmic
;;   amount of space) when generating a process.
(define default-dir "$HOME/var/sicp/")

(define (new* a b)
  (if (= b 0)
      0
      (+ a (new* a (- b 1)))))

(assert (= (new* 5 3) 15))

(define (fast-new* a n)
  (define (double m) (+ m m))
  (define (halve m) (/ m 2))
  (cond ((= n 0) 0)                                  ;; a * 0 == 0
        ((= n 1) a)                                  ;; a * 1 == a
        ((even? n) (double (fast-new* a (halve n)))) ;; a * 2n == 2(a * n)
        (else (+ a (fast-new* a (- n 1))))))         ;; a * (2n + 1) == a + a * 2n

(assert (and (= (fast-new* 5  3) 15)
             (= (fast-new* 0  2) 0)
             (= (fast-new* 10 0) 0)
             (= (fast-new* 7  7) 49)
             (= (fast-new* 1  1) 1)))
