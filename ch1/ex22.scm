;; Exercise 1.22
;; The goal is to write a procedure that just finds the primality of
;;   consecutive integers. Since this format doesn't allow for interacting
;;   with a running process easily and cleanly (for example by interrupting)
;;   without the use of read procedures, I'll also add in a parameter to limit
;;   the number of matches we find.
(define default-dir "$HOME/var/sicp/")
(load "ch1/ex21") ;; Definition of prime from previous example

;; Import definitions from example
(define (timed-prime-test n)
  ;; (newline) Do not display each number
  ;; (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (and (report-prime n (- (runtime) start-time)) #t) ;; Extend this program to return isprime?
      #f))
(define (report-prime n elapsed-time)
  ;; (newline)
  ;; (display n) ;; Extend this procedure to show n, since we aren't showing every prime
  ;; (display " *** ")
  ;; (display elapsed-time)
  () ;; Do nothing with prints removed
  )
(define (consecutive-primes start num)
  (if (= num 0)
      ;; (newline) ;; we're done
      () ;; Do nothing with prints removed
      (if (timed-prime-test start)
          (consecutive-primes (+ start 1) (- num 1))
          (consecutive-primes (+ start 1) num))))

(consecutive-primes 2 3)
(consecutive-primes 1000 3)
(consecutive-primes 10000 3)
(consecutive-primes 100000 3)
(consecutive-primes 1000000 3)

;; This implementation of scheme is too fast to capture the slowdown
