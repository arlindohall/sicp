;; Exercise 1.13
;; To prove that Fib(n)=round(ϕn5√) using deduction, we first need to show,
;; using the hint from the exercise, that Fib(1)=round(ϕ5√) and
;; Fib(2)=round(ϕ25√).
(define default-dir "$HOME/var/sicp/")
(load "util/fib.scm")
(load "util/close.scm")

(define phi (/ (+ (sqrt 5) 1) 2))
(define psi (/ (- 1 (sqrt 5)) 2))

(assert (close? phi 1.6180344478216817))

(define (pow x n)
  (define (pow-iter x n acc)
    (if (= n 0)
        acc
        (pow-iter x (- n 1) (* acc x))))
  (pow-iter x n 1))

(assert (equal? (pow 2 5) 32))

(define (fib-approx n)
  (/ (pow phi n) (sqrt 5)))

(assert (close? (fib-approx 1) 0.7236067059356593))

(assert (equal? (fib 1) 1))

(assert (close? (fib-approx 2) 1.1708205768786706))

(assert (equal? (fib 2) 1))
;; So now we have shown that Fib(1)=round(ϕ5√) and Fib(2)=round(ϕ25√).

;; Now we must show that round(ϕn+25√)=round(ϕn+15√)+round(ϕn5√). This is
;; very difficult to do since we do not know what direction the round
;; operation will move the result, either up or down. So instead, we use the
;; hint from the text again and show that the ϕ and ψ definition of Fib gives
;; us the exact number.


(define (fib-phi-psi n)
  (/ (- (pow phi n)
        (pow psi n))
     (sqrt 5)))

(assert (equal? (fib-phi-psi 1) 1.0))

;; TODO: fix this, it's gross
;; This was originally written in IPython, so the latex was translated
;; For the $ n = 1 $ case:
;; $$ \frac{1}{\sqrt5} \bigg( \frac{1 + \sqrt5}{2} - \frac{1 - \sqrt5}{2} \bigg) $$
;; $$ = \frac{1}{\sqrt5} * \frac{2 * \sqrt5}{2} $$
;; $$ = 1 $$
;; For the $ n = 2 $ case:
;; $$ \frac{1}{\sqrt5} \bigg( \frac{(1 + \sqrt5)(1 + \sqrt5)}{2} - \frac{(1 - \sqrt5)(1 - \sqrt5)}{2} \bigg) $$
;; $$ = \frac{1}{\sqrt5} \bigg( \frac{1 + 2\sqrt5 + 5}{2} - \frac{1 - 2\sqrt5 + 5}{2} \bigg)$$
;; $$ = \frac{1}{\sqrt5} \bigg( \frac{4\sqrt5}{2} \bigg) $$
;; For the $ n > 2 $ case:
;; $$ \frac{1}{\sqrt5} \bigg( \frac{(1 + \sqrt5)^{n + 2}}{2^{n+2}} - \frac{(1 - \sqrt5)^{n + 2}}{2^{n+2}} \bigg) $$ - expand out the square terms in the numerators
;; $$ = \frac{1}{\sqrt5} \bigg( \frac{(1 + \sqrt5)^n(1+2\sqrt5+5)}{2^{n+2}} - \frac{(1 - \sqrt5)^n(1+2\sqrt5+5)}{2^{n+2}} \bigg) $$
;; $$ = \frac{1}{\sqrt5} \bigg( \frac{(1 + \sqrt5)^n(6+2\sqrt5)}{2^{n+2}} - \frac{(1 - \sqrt5)^n(6+2\sqrt5)}{2^{n+2}} \bigg) $$ - separate the 6 term in both numerators to $(4 + 2)$
;; $$ = \frac{1}{\sqrt5} \bigg( \frac{4(1 + \sqrt5)^n - 4(1 - \sqrt5)^n}{2^{n+2}} + \frac{(1 + \sqrt5)^n(2+2\sqrt5) - (1 - \sqrt5)^n(2+2\sqrt5)}{2^{n+2}} \bigg) $$ - now partially factor the denominators
;; $$ = \frac{1}{\sqrt5} \bigg( \frac{4((1 + \sqrt5)^n - (1 - \sqrt5)^n)}{4*2^n} + \frac{2(1 + \sqrt5)^n(1+1\sqrt5) - 2(1 - \sqrt5)^n(1+1\sqrt5)}{2*2^{n+1}} \bigg) $$
;; $$ = \frac{1}{\sqrt5} \bigg( \frac{(1 + \sqrt5)^n - (1 - \sqrt5)^n}{2^n} \frac{(1 + \sqrt5)^{n+1} - (1 - \sqrt5)^{n+1}}{2^{n+1}} \bigg) $$
;; $$ = \frac{1}{\sqrt5} \bigg( (\phi^n - \psi^n) + (\phi^{n+1} - \psi^{n+1}) \bigg) $$
;; $$ = \frac{(\phi^n - \psi^n)}{\sqrt5} + \frac{(\phi^{n+1} - \psi^{n+1})}{\sqrt5} $$
;; This is the definition of the Fibonacci sequence, and so by deduction, this definition holds for $ n \ge 1$.
