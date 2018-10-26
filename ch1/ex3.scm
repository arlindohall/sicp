;; ## Exercise 1.3
;; The procedure below is to return the sum of the squares of the larger two
;; of a group of three numbers. I use the procedure `sum-of-squares` from the
;; text.
(define default-dir "$HOME/var/sicp/")

(define (square x) (* x x))
(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (f a b c) 
  (cond ((and (<= a b) (<= a c)) (sum-of-squares b c))
        ((and (<= b a) (<= b c)) (sum-of-squares a c))
        ((and (<= c a) (<= c b)) (sum-of-squares a b))))

;; As an example, the sum-of-squares of `3` and `4` is `25`, and so
;; `(f 2 3 4)` should return `25`

(assert (equal? (f 2 3 4) 25)
        "Expected (f 2 3 4) to equal 25")
