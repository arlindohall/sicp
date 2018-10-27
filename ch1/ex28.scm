;; Exercise 1.28
;; Implement the Miller-Rabin test
(load "util/square.scm")

;; TODO: this is actually not working at all. I need to revisit
;; later and try to really understand the math
;; I ripped this straight off of community.schemewiki.org
;; I could not understand the question the way it was worded
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (let ((x (expmod base (/ exp 2) m)))
                          (if (non-trivial-sqrt? x m)
                              0
                              (remainder (square x) m)))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

;; Returns #true if n is a non-trivial square root of m
(define (non-trivial-sqrt? n m)
  (and (not (= n 1))
       (not (= n (- m 1)))
       (= 1 (remainder (square n) m))))

(define (miller-rabin n)
  (miller-rabin-iter n 1))

;; True if prime, that is, if we've checked all numbers less than
(define (miller-rabin-iter n a)
  (cond ((= a n) #t)
        ;; If a^(n-1) congurent to 1 modulo n
        ((= 1 (expmod a (- n 1) n)) (miller-rabin-iter n (+ a 1)))
        (else #f)))

(assert (miller-rabin 19)) ;; Prime number that fermat's test finds
(assert (not (miller-rabin 16)))
(map (lambda (n) (assert (miller-rabin n)))
     '(561 1105 1729 2465 2821 6601))
