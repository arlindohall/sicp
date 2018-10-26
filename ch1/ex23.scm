;; Exercise 1.23
;; For this procedure, we'll be extending the `find-divisor` procedure with
;;    the `next` procedure, which cuts the number of comparisons down by half.
(load "ch1/ex22.scm")

(timed-prime-test 1000003)

(define (next n)
  (if (= n 2) 3 (+ n 2)))

;; New find-divisor method uses the `next` procedure
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
                  (else (find-divisor n (next test-divisor)))))

(timed-prime-test 1000003)

;; Values from the IPython notebook to exaggerate times
(* 100 (- 1 (/ 1.3081228733062744 2.0475051403045654)))

;; We can see here that decreasing the number of comparisons by two has
;;   resulted in a 36% speedup in the process. Since that is not the 50%
;;   speedup that we expected, that must mean that there is some other part
;;   of the procedure that is causing this time change. Perhaps it could be
;;   explained by the implementation of the machine underlying the
;;   computations. If there are memory operations that take place on procedure
;;   calls, then that could cause a noticeable change in running time from
;;   what we expect.
