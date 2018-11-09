;; Exercise 2.5

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car c)
  (define (iter c acc)
    (if (= (remainder c 2) 0)
        (iter (/ c 2) (+ acc 1))
        acc))
  (iter c 0))

(define (cdr c)
  (define (iter c acc)
    (if (= (remainder c 3) 0)
        (iter (/ c 3) (+ acc 1))
        acc))
  (iter c 0))

(assert (= (car (cons 3 4)) 3))
(assert (= (cdr (cons 3 4)) 4))
