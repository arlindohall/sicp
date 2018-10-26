;; Exercise 1.26

;; For this procedure, because the argument to `*` must be calculated twice,
;;   the process it generates is going to take twice as many steps at each
;;   branch, which means that the number of increased instructions is going to
;;   be 2^O, where O=log(n), so 2^log(n) is n
