;; ## Exercise 1.19
;; The special case of $\{a \leftarrow bq + aq + ap, b \leftarrow bp + aq\}$ is $\{q = 1, p = 0\}$.
(define default-dir "$HOME/var/sicp/")

;; Applying this transformation twice, we get:
;; $$ S_0 = (a, b) $$
;; $$ S_1 = (bq + aq + ap, bp + aq) $$
;; $$ S_2 = (bq + a(q + p), bp + aq) $$
;; $$ (q(bp + aq) + (q + p)(bq + aq + ap), p(bp + aq) + q(bq + aq + ap)) $$
;; $$ = (bpq + aqq + bqq + aqq + apq + bpq + apq + app, bpp + apq + bqq + aqq + apq) $$
;; $$ = (2bpq + 2aqq + bqq + 2apq + app, bpp + 2apq + bqq + aqq) $$
;; $$ = (2apq + 2aqq + app + 2bpq + bqq, 2apq + aqq + bpp + bqq) $$
;; $$ = (a(2apq + 2qq + pp) + b(2pq + qq), a(2pq + qq) + b(pp + qq)) $$
;; $$ = (a(2pq + qq) + a(pp + qq) + b(2pq + qq), a(2pq + qq) + b(pp + qq)) $$
;; $$ = (b(2qp + qq) + a(2pq + qq) + a(qq + pp), b(pp + qq) + a(2pq + qq)) $$
;; Applying the transformation $T_{p'q'}$, which is $a \leftarrow bq' + aq' + ap'$, $b \leftarrow bp' + aq'$, gives the same answer when:
;; $$ p' = pp + pq $$
;; $$ q' = 2pq + qq $$

;; Using this definition of $p'$ and $q'$, we can complete the code given
;;    in the text:

(define (log-fib n) ;; Rename to log-fib so we can mantain the defintion of fib
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* q q) (* 2 p q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(assert (and (= (log-fib 1) 1)
             (= (log-fib 2) 1)
             (= (log-fib 3) 2)
             (= (log-fib 4) 3)
             (= (log-fib 5) 5)
             (= (log-fib 6) 8)))
