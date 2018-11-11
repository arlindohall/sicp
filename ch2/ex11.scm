;; Exercise 2.11

;; Cases of mul-interval

;; lowa | higha | lowb  | highb | result
;; -----|-------|-------|-------|-------
;; x (-)| -     | x (-) | -     | +
;; x (-)| -     | -     | +     | -/+
;; x (-)| -     | +     | x (+) | -
;; +    | x (+) | x (-) | -     | -/+
;; +    | x (+) | -     | +     | -/+
;; +    | x (+) | +     | x (+) | +
;; -    | +     | x (-) | -     | -/+
;; -    | +     | +     | x (+) | -/+
;; -    | +     | -     | +     | +

;; (define (mul-interval a b)
;;   (let ((lowa  (lower-bound a))
;;         (higha (upper-bound a))
;;         (lowb  (lower-bound b))
;;         (highb (upper-bound b)))
;;     (cond ((and (< higha 0) (< highb 0))
;;            (make-interval (* higha highb) (* lowa lowb)))
;;           ((and (< higha 0) (< lowb 0))
;;            (make-interval (* higha highb) (* lowa lowb)))
;;           ((and (< higha 0) (> lowb 0))
;;            (make-interval (* lowa highb) (* higha lowb)))
;;           ((and (> lowa 0) (< highb 0))
;;            (make-interval (* higha lowb) (* lowa highb)))
;;           ((and (> lowa 0) (< lowb 0))
;;            (make-interval (* higha lowb) (* higha highb)))
;; )))

;; ... something like this
;; I won't finish because I didn't take into account that you have to
;; calculate the absolute value before doing this, and that's really too
;; much work for almost no benefit. I'd do this if I had to optomize an
;; embedded system but I don't so....
