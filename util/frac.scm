;; Continued fraction
(define (cfrac n d k)
  (define (iter i acc)
    (if (= i 0)
        acc
        (iter (- i 1) (/ (n i) (+ (d i) acc)))))
  (iter k 0))

(define (div x y)
  (floor (/ x y)))
