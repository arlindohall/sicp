;; Add/multiply/divide/subtract
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (make-interval a b) (cons a b))

(define (lower-bound interval)
  (car interval))
(define (upper-bound interval)
  (cdr interval))

;; Tests

(define test1 (make-interval 0.5 1.5))
(define test2 (make-interval 1.5 2.5))

(define test-result (add-interval test1 test2))

(assert (= (lower-bound test-result) 2))
(assert (= (upper-bound test-result) 4))

(define test-div-result (div-interval test1 test2))
(define test-mul-result (mul-interval test1 test2))

(assert (= (lower-bound test-div-result) .2))
(assert (= (upper-bound test-div-result) 1))
(assert (= (lower-bound test-mul-result) .75))
(assert (= (upper-bound test-mul-result) 3.75))

;; Center and width/percent
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (let ((w (* c (/ p 100))))
       (make-center-width c w)))
(define (percent i)
  (* 100 (/ (width i) (center i))))

;; Tests
(define test-w (make-center-width 100 5))
(define test-p (make-center-percent 100 5))

(assert (equal? test-w test-p))

(define test-w (make-center-width 5 1))
(define test-p (make-center-percent 5 20))

(assert (equal? test-w test-p))
