;; Exercise 1.8

;; In order to adapt our sqrt procedure to compute cubed roots, the only
;; aspect which needs to change is the improve procedure. Since we will
;; implement Newton's method more generally as a later problem according to
;; the text, I'll just re-write improve and sqrt-iter and sqrt here for cube
;; roots.

;; This is really just an exercise in prefix notation, as well as a chance to
;; work out the logic of the sqrt procedure for oneself.
(define (cube x) (* x x x))

(define (cbrt-iter guess x)
  (if (good-enough-cbrt? guess x)
      guess
      (cbrt-iter (improve-cbrt guess x) x)))

(define (good-enough-cbrt? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (improve-cbrt guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess)) 
      3))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(assert (good-enough-cbrt? (cbrt 27) 27))

;; We could also create this procedure more generally
(define (root-iter f guess x)
  (define (good-enough? f guess x)
    (< (abs (- (f guess) x)) 0.001))
  (define (improve-root f guess x)
    ((deriv f) guess)) ;; We will create this procedure later
  (if (good-enough? f guess x)
      guess
      (root-iter (improve-root guess x) x)))

