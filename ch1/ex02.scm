;; ## Exercise 1.2
;; This problem asks us to go from standard arithmetic notation to prefix
;; notation. In order to do so, we must use the order of operations. The
;; fraction bar is the least tightly bound operator, so it goes first. The
;; groupings in the numerator are all unnecessary, since addition is
;; associative. On the bottom, the multiplication binds less tightly than the
;; groupings, so the two subtractions must take place first, i.e. the
;; multiplication comes first in prefix notation.

;; I am reading the expression to be:
;; $$ \frac{5 + 4 + (2 - (3 - (6 + \frac{4}{5}))}{3 (6 - 2) (2 - 7)} $$

;; To check our work, we note that the arithmetic expression evaluates to: 
;; $$ \frac{5 + 4 + 2 - (3 - (6 + 4/5))}{3(6 - 2)(2 - 7)} $$ 
;; $$ = \frac{-37}{150} $$ 
;; $$ = -0.247 $$
(assert (= (/ (- (+ 5 4 2)
                 (- 3 (+ 6 (/ 4 5))))
              (* 3 (- 6 2) (- 2 7)))
           -37/150)
        "Value of expression is not what we expected")
