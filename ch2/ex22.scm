;; Exercise 2.22

;; Each iteration of the `iter` procedure takes an item off the list and adds
;; it to the result, but items are added to a list from the back to the front,
;; whereas they are removed from front to back, so we end up reversing the list
;; during the process of iterating over it. A way around this would be to
;; first reverse the list, then feed it to the `iter` procedure

;; Reversing the order of the call to `cons` will not reverse the list, but
;; will instead attach the new item as the `cdr` of the existing list, which
;; will end us up with a "list" whose `car` is `'()`, and whose `cdr` is the
;; rest of the list, which is not a list structure at all.
