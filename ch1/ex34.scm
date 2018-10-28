;; Exercise 1.34

;; Given the procedure:
(define (f g)
  (g 2))
;; which we can read as "apply to two"...

;; We can then ask the interpreter to perform the following:
;; (f f)

;; The interpreter will error on this request, and we can see why using
;; applicative-order evaluation...

;; (f f)
;; (f 2)
;; (2 2)

;; And since `2` is not a procedure, the interpreter will give us an
;; error. Mine says:
;The object 2 is not applicable.
