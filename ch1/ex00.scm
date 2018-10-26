;; This is an example of how the exercises are structured
(define (do-nothing) #t) ;; Can set this to false to fail test

(assert (do-nothing) "Expected nothing to happen without issue")
(assert (write-line "Running tests...")
        "Expected to run message without issue")
