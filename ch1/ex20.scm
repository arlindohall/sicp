;; ## Exercise 1.20
;; Interpreting the expression `(gcd 206 40)` using normal-order evaluation,
;;   and given the definition of `gcd`:
(define default-dir "$HOME/var/sicp/")

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; we get a process which requires much more space:

(gcd 206 40)
(if (= 40 0) 206 (gcd 40 (remainder 206 40)))
;; Special form `if` means <predicate> is evaluated, then <alternative>

(gcd 40 (remainder 206 40))
(if (= (remainder 206 40) 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
;; All intermediate steps omitted after this

(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 
     (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

;; At this step, the interpreter will evaluate the second parameter of `gcd` as `0`
;; and the expression will evaluate to `a`

(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
(remainder (remainder 206 40) (remainder 40 6))
(remainder (remainder 206 40) 4)
(remainder 2 4)

(assert (equal? (gcd 206 40) 2))

;; Just to show that this math works out, here are all of the above
;;    expressions asserted to be equal...

(assert (and (= (gcd 206 40) 2)
             (= (if (= 40 0) 206 (gcd 40 (remainder 206 40))) 2)
             (= (gcd 40 (remainder 206 40)) 2)
             (= (if (= (remainder 206 40) 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))) 2)
             (= (gcd (remainder 206 40) (remainder 40 (remainder 206 40))) 2)
             (= (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 2)
             (= (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 
                     (remainder (remainder 40 (remainder 206 40)) 
                                (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))) 2)
             (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 2)
             (= (remainder (remainder 206 40) (remainder 40 6)) 2)
             (= (remainder (remainder 206 40) 4) 2)
             (= (remainder 2 4) 2)))

;; By counting, we see that the `remainder` operation is performed 11 times.
;;   For applicative-order evalutation, on the other hand...

;; (gcd 260 40)
;; (gcd 40 (remainder 206 40))
;; (gcd 40 6)
;; (gcd 6 (remainder 40 6))
;; (gcd 6 4)
;; (gcd 4 (remainder 6 4))
;; (gcd 4 2)
;; (gcd 2 (remainder 4 2))
;; (gcd 2 0)
;; 2

;; By counting, we can see that the `remainder` operation is performed 4
;;   times. The difference $-$ the reason why the `remainder` operation is
;;   called fewer times with applicative-order evaluation, is that with
;;   normal-order evaluation, the same `remainder` operation is performed
;;   multiple times.

(remainder (remainder 206 40) 
           (remainder 40 (remainder 206 40))) 

;; This expression appears in both arguments of the `gcd` expression in one
;;    of the above steps.
