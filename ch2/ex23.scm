;; Exercise 2.23

(define (for-each proc xs)
  (if (eq? xs '())
      'ok
      (begin (proc (car xs))
             (for-each proc (cdr xs)))))

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))

;; 57
;; 321
;; 88
