;; Exercise 2.3
(load "ch2/ex02.scm")

;;;;;;;;;; INTERFACE ;;;;;;;;;; 
;; (perimeter-rectangle r)
;; (area-rectangle r)

;; (corner-rectangle r)
;; (height-rectangle r)
;; (width-rectangle r)

;; TODO: Add this to both implementations
;; (rotation-rectangle r)
;; This last one allows rectangles to be rotated in the plane

(define (perimeter-rectangle r)
  (+ (* 2 (height-rectangle r))
     (* 2 (width-rectangle r))))

(define (area-rectangle r)
  (* (height-rectangle r) (width-rectangle r)))

;; (make-rectangle corner width height rotation)

;;;;;;;;;; IMPLEMENTATION 1 ;;;;;;;;;;;;

(define (make-rectangle corner width height rotation)
  (list corner width height rotation))

(define (corner-rectangle r)
  (car r))

(define (width-rectangle r)
  (cadr r))

(define (height-rectangle r)
  (caddr r))

(define (rotation-rectangle r)
  (cadddr r))

;; TEST
(define test-c (make-point 0 0))
(define test-r (make-rectangle test-c 2 3 0))

(assert (= (perimeter-rectangle test-r) 10))
(assert (= (area-rectangle test-r) 6))

;;;;;;;;; IMPLEMENTATION 2 ;;;;;;;;;;

;; TODO: error checking if this is not a rectangle
(define (make-rectangle corner width height rotation)
  (let ((c1 corner)
        (c2 (make-point (x-point corner)
                        (+ (y-point corner) height)))
        (c3 (make-point (+ (x-point corner) width)
                        (+ (y-point corner) height)))
        (c4 (make-point (+ (x-point corner) width)
                        (y-point corner))))
  (list c1 c2 c3 c4)))

(define (corner-rectangle r)
  (car r))

(define (width-rectangle r)
  (let ((c3 (caddr r))
        (c1 (car r)))
    (- (x-point c3) (x-point c1))))

(define (height-rectangle r)
  (let ((c3 (caddr r))
        (c1 (car r)))
    (- (y-point c3) (y-point c1))))

;; TEST
(define test-c (make-point 0 0))
(define test-r (make-rectangle test-c 2 3 0))

(assert (= (perimeter-rectangle test-r) 10))
(assert (= (area-rectangle test-r) 6))
