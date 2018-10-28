;; Exercise 1.27
(load "util/math.scm")
(load "ch1/ex22.scm")

;; (a^n modulo n)
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

;; Test if a is congurent to (a^n modulo n), if fails then not prime
(define (fermat-test n a)
  (= (expmod a n n) a))

(define (beats-fermat n)
  (beats-fermat-iter n 1))

(define (beats-fermat-iter n a)
  (or (= a n)
 	  (and (not (fermat-test n a))
		   (beats-fermat-iter n (+ a 1))))

(assert (not (beats-fermat 19))) ;; Prime number that fermat's test finds
(map (lambda (n) (assert (beats-fermat n)))
     '(561 1105 1729 2465 2821 6601))
