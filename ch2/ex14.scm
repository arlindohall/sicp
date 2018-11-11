;; Exercise 2.14
(load "util/interval.scm")

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1))) 
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

test1
test2

(define p1-result (par1 test1 test2))
(define p2-result (par2 test1 test2))

(define t1-div (div-interval test1 test1))
(define t2-div (div-interval test2 test2))

(write-line "TEST 1 CENTER/PERCENT -----")
(center test1)
(percent test1)
(write-line "TEST 2 CENTER/PERCENT -----")
(center test2)
(percent test2)

(write-line "PARALLEL 1 CENTER/PERCENT -----")
(center p1-result)
(percent p1-result)
(write-line "PARALLEL 2 CENTER/PERCENT -----")
(center p2-result)
(percent p2-result)
