;; This is an example of how the exercises are structured

(define (do-nothing) #t) ;; Can set this to false to fail test

;; Structure is this:
;;  - All conditions that need to be met grouped by `and`
;;  - If any of these fail, the or group evaluates the second expression
;;  - This expression fails the whole test suite
(or (and (do-nothing) ;; Nothing will happen
         (write-line "Running tests...")) ;; Will output text
    (error "Expected nothing to happen without issue"))
