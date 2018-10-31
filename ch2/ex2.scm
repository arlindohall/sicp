;; Exercise 2.2

;;;;;;;;;; POINT ADT ;;;;;;;;;; 

;;; Constructor ;;;

;; (make-point x y)
;;; x - horizontal coordinate on a cartesian plane
;;; y - vertical coordinate on a cartesian plane
;;;
;;; value - new point abstract data object

;;; Selectors ;;;

;; (x-point point)
;;; point - point abstract data object
;;;
;;; value - x-coordinate of point

;; (y-point point)
;;; point - point abstract data object
;;;
;;; value - y-coordinate of point

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

;;;;;;;;;; SEGMENT ADT ;;;;;;;;;; 

;;; Constructor ;;;

;; (make-segment p1 p2)
;;; p1, p2 - endpoints of the segment
;;;
;;; value - a new segment abstract data object

;;; Selectors ;;;

;; (start-segment s)
;;; s - line segment abstract data object
;;;
;;; value - the start of the line segment

;; (end-segment s)
;;; s - line segment abstract data object
;;;
;;; value - the end of the line segment

;;; Other Procedures ;;;

;; (midpoint-segment s)
;;; s - line segment ado
;;;
;;; value - midpoint of two endpoints (average value of the two)

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (midpoint-segment s)
  (define (average x y)
    (/ (+ x y) 2))
  (make-point (average (x-point (start-segment s))
                       (x-point (end-segment s)))
              (average (y-point (start-segment s))
                       (y-point (end-segment s)))))


;;; TEST

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

(define start (make-point 0 0))
(define end (make-point 10 12))
(define segment (make-segment start end))

(print-point start)
(print-point end)

(define mid (midpoint-segment segment))

(print-point mid)
(assert (equal? mid (make-point 5 6)))
