;; Exercise 1.14
;; The process diagram of the count-change process is:
(load "util/count-change.scm")

(count-change 11)

(cc 11 5)

(cond ((= 11 0) 1) 
      ((or (< 11 0) (= 5 0)) 0) 
      (else (+ (cc 11 (- 5 1)) (cc (- 11 (first-denomination 5)) 5))))

;; conditional steps excluded going forward
(+ (cc 11 (- 5 1)) (cc (- 11 (first-denomination 5)) 5))

(+ (cc 11 4) (cc -39 5))

(+ (+ (cc 11 3) (cc -14 4)) 0)

(+ (+ (+ (cc 11 2) (cc 1 3)) 0) 0)

(+ (+ (+ (+ (cc 11 1) (cc 6 2)) (+ (cc 1 2) (cc -9 3))) 0) 0)

(+ (+ (+ (+ (+ (cc 11 0) (cc 10 1)) (+ (cc 6 1) (cc 1 2)))
         (+ (+ (cc 1 1) (cc -4 2)) 0)) 0) 0)


(+ (+ (+ (+ (+ 0 (+ (cc 10 0) (cc 9 1))) (+ (+ (cc 6 0) (cc 5 1))
                                            (+ (cc 1 1) (cc -4 2))))
         (+ (+ (cc 1 0) (cc 0 1)) 0)) 0) 0)

;; Addition here will be reduced all at once
(+ (+ (+ (+ (+ 0 (+ 0 (+ (cc 9 0) (cc 8 1))))
            (+ (+ (+ 0 (+ (cc 5 0) (cc 4 1))) (+ (+ (cc 1 0) (cc 0 1)) 0))))
         (+ (+ 0 1) 0)) 0) 0)

(+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ (cc 8 0) (cc 7 1)))))
            (+ (+ 0 (+ 0 (+ (cc 4 0) (cc 3 1)))) (+ 1 0))) 1) 0) 0)

(+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 7 0) (cc 6 1))))))
            (+ (+ 0 (+ 0 (+ 0 (+ (cc 3 0) (cc 2 1))))) 1)) 1) 0) 0)

(+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 6 0) (cc 5 1))))))) 
            (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 2 0) (cc 1 1)))))) 1)) 1) 0) 0)

(+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 5 0) (cc 4 1)))))))) 
            (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 1 0) (cc 0 1))))))) 1)) 1) 0) 0)

;; Another round of reducing addition
(+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 4 0) (cc 3 1))))))))) 
            (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 1)))))) 1)) 1) 0) 0)

(+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 4 0)
                                                  (cc 3 1)))))))))
            2) 1) 0) 0)

(+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 3 0)
                                                       (cc 2 1))))))))))
            2) 1) 0) 0)

(+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 2 0)
                                                            (cc 1 1)))))))))))
            2) 1) 0) 0)

(+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 1 0)
                                                                 (cc 0 1))))))))))))
            2) 1) 0) 0)

;; And two final reduction rounds
(+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 1))))))))))) 2) 1) 0) 0)

(+ (+ (+ (+ 1 2) 1) 0) 0)

4

(assert (equal? (count-change 11) 4))

;; The original question was `What are the orders of growth of the space and
;; number of steps used by this process as the amount to be changed
;; increases?`. The answer depends on each of the two variables to the `cc`
;; procedure. For a given change amount, all five coin denominations must be
;; tried, and this is going to be the same across change amounts.

;; The `cc` procdure is going to perform `(mod amount coin-value)`
;; computations for each coin value, so for quarters the number of
;; computations is $ ( amount \div 25 + 1 ) $, and then the for remaining
;; amount, `(mod amount smaller-coin-value)` computations are left to be
;; performed. The $ + 1 $ term is the node which corresponds to the first
;; negative or zero term in the successive subtractions. This results in a
;; tree with $ ( amount \div 25 + 1 ) $ branches, each of which holds a tree
;; with $ ( ( amount \mod 25 ) \mod 10 ) $ nodes, and so on for `5` and `1`.

;; This means that the equation for the number of nodes in the tree is:

;; $$ nodes = ( amount \div 50 ) * (( amount \mod 50 ) \div 25 ) * (( amount \mod 25 ) * 10) * ... $$

;; This reduces to a worst case of:

;; $$ nodes = ( amount \div 50 ) * ( 50 ) * ( 25 ) * ... $$

;; Which means $ nodes < k * amount $, and since the number of nodes is
;; proportional to the number of steps and the amount of space...

;; 1. The order of growth for number of steps is $ \Theta (n) $
;; 2. The order of growth for space is $ \Theta (n) $
