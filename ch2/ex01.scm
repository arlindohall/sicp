;; Exercise 2.1

;; Constructor
(define (make-rat n d)
  (let ((g (gcd n d))
        (pos-n (abs n))
        (pos-d (abs d))
        (sign (if (> (* n d) 0)
                  (lambda (x) x)
                  (lambda (x) (- x)))))
      (cons (sign (/ pos-n g)) (/ pos-d g))))

;; Selectors
(define (numer x) (car x))
(define (denom x) (cdr x))

(define num (make-rat -4 -2))
(assert (= 2 (/ (numer num) (denom num))))
