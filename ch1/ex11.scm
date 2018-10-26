;; Exercise 1.11
;; A recursive process for this function is easy to write a procedure for,
;; since it basically means re-writing the formula in LISP.
(define default-dir "$HOME/var/sicp/")

;; f(n)=n  if  n<3  and  f(n)=f(n−1)+2f(n−2)+3f(n−3)  if  n≥3 

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(assert (equal? (f 3) 4))

;; An iterative process is somewhat more difficult. In order to capture the
;; process, we can store the results of previous computations in accumulative
;; operands.
(define (f-iter n)
  (if (< n 3)
      n
      (fi 2 1 0 3 n)))

(define (fi fn-minus-1 fn-minus-2 fn-minus-3 acc n)
  (define fn
    (+ fn-minus-1
         (* 2 fn-minus-2)
         (* 3 fn-minus-3)))
  (if (= acc n)
      fn
      (fi fn
          fn-minus-1
          fn-minus-2
          (+ acc 1)
          n)))

(assert (equal? (f-iter 3) 4))

;; Test to see that f and f-iter give the same results
(assert (and (= (f-iter -10) (f -10))
             (= (f-iter 4)   (f 4))
             (= (f-iter 5)   (f 5))
             (= (f-iter 6)   (f 6))
             (= (f-iter 15)  (f 15))))

;; Now we look for a procedure to define Pasca's Triangle. Since we need to
;; determine most of the triangle above an element in order to determine that
;; element, a recursive procedure makes sense. We'll use a tree-recursive
;; process since it reflects the definition of Pascal's Triangle and so will
;;  be much easier to write.
(define (pascal row col)
  (cond ((or (< col 1) (< row 1) (> col row)) 0)
        ((or (= row 1) (= row 2)) 1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))

(assert (equal? (pascal 5 3) 6))
