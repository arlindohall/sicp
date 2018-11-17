;; Excercise 2.19
(load "util/count-change.scm")

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define (first-denomination l) (car l))
(define (except-first-denomination l) (cdr l))
(define (no-more? l) (null? l))

(cc 100 us-coins) ;; 292

(define us-coins (list 1 5 10 25 50))

(cc 100 us-coins) ;; 292

(define us-coins (list 25 5 10 1 50))

(cc 100 us-coins) ;; 292

;; The order of coins doesn't affect the number of ways to count the change,
;; since if the larger coin is taken first, then the remaining change can be
;; counted with smaller denominations, and if the smaller coin is taken first,
;; it can only be taken so long as there is enough value left to take the
;; larger coin.

(assert (= 292 (cc 100 us-coins)))
