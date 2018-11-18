 ;; Exercise 1.33
(load "util/stream.scm")

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(map odd? '(1 2 3 4)) ;; '(true false true false)
(map (lambda (x) (+ x 1)) '(1 2 3 4)) ;; '(2 3 4 5)

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(append '(1 2 3) '(4 5)) ;; '(1 2 3 4 5)

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(length '(1 2 3 4 5)) ;; 5
(length '(a b c d e)) ;; 5

(assert (equal? (map (lambda (x) (+ x 1)) '(1 2 3 4)) '(2 3 4 5)))
(assert (equal? (append '(1 2 3) '(4 5)) '(1 2 3 4 5)))
(assert (= (length '(1 2 3 4 5)) 5))
(assert (= (length '(a b c d e)) 5))
