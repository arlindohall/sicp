Chapter 1
=========

Covers the concepts of **primitives**, **combinations**, and
**abstractions**.

-   Primitive: a symbol directly manipulable by the language, ex.
    integers, addition
-   Combination: a means of combining epxressions of primitives to make
    complex expressions
-   Abstraction: a way to label combinations and use them as primitives
    in a more complex problem

The meaning of symbols in these combinatorial expressions, it is said,
are determined by the **global environment**.

All expressions by default are evaluated as such: the first item in the
expression is the operand, and operates on all the items in the
expression. Special forms are introduced which are exceptions to this
rule. In order for the expression to be evaluated, its operands are
evaluated, then the result is substituted into the definition of the
operator (recursively repeating this process until only primitives
remain), and then the final primitive expression is evaluated. This is
called **applicative order** because the operator is applied to the
results of evaluating the operands.

The other means of evaluating expressions is to first substitute the
operand values into the operand, and then evaluate the result. That is,
take the values for parameters (unevaluated), and substitute them in for
the operator's parameters until only primitives remain, and evaluate the
resulting expression. This is called **normal order** evaluation. In
**normal order** evaluation, we will repeat evaluations for operand
expressions if the corresponding parameter appears multiple times in the
operator's definition.

Ordinary procedures
-------------------

-   `not` because the value of the operand is always evaluated

Special Forms
-------------

-   `define` is used to create new operands
-   `cond` is used to conditionally evaluate expressions. Only the first
    expression whose predicate is true is evaluated, and predicates are
    evaluated in order
-   `if` is used to conditionally evaluate one of two expressions,
    depending on the result of evaluating the predicate (if true,
    evaluate the consequent, otherwise the alternative)
-   `and` evaluate the operands until one evaluates to false or none are
    left, and the value of the expression is the result of the most
    recently evaluated operand
-   `or` evaluate the operands until one evaluates to a true value or
    none are left, and return the value of the most recently evaluated
    expression

Procedures vs. Functions
------------------------

The difference here is explained: that a function is declarative, while
a procedure is effective. In order to be a procedure, an expression must
follow some process to find the answer, rather than simply describe the
answer to a question. As an example, the following are given as a
definition of the square root.

``` {.scheme}
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
        guess
              (sqrt-iter (improve guess x)
                               x)))
(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9) ;; 3
```

Recursion
---------

The remainder of the chapter explains the basics of recursion. One
noteworthy abstraction is the procedure graph, which shows the
procedures composing `sqrt`, the procedures composing those, and so on.
This shows that each procedure is build of smaller components, which we
do not need to completely understand to be able to comprehend the
process of evaluating the `sqrt` procedure.

**Bound** and **free** variables are also discussed. **Bound** variables
are those which are declared in the first operand of the `define`
special form. These have a certain value in the scope of the procedure
which is determined at the time the procedure is called. **Free**
variables, on the other hand, are not set to a determined value, but
instead are defined by the larger environment, or scope. For example, in
`good-enough?`, `abs` is defined above. It is also noteworthy that we
can name a **bound** variable in such a way as to co-opt a named
variable in a larger scope without affecting the accessors of that
variable outside our current scope.

Building on this idea, we can use what is called **block structure**,
where we put definitions of helper procedures inside the parent
procedure. In this case, the eample given is:

``` {.scheme}
(define (sqrt x)
  (define (sqare x) 
    (* x x))
  (define (average x y)
    (/ (+ x y) 2))
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x))

(sqrt 9)
```

Next, it is observed that the variable `x` has the same meaning
throughout the procedure `sqrt`'s definition. Therefore the concept of
**lexical scoping** is introduced, where if a **bound** variable is
going to have the same value as its value in the parent scope, we can
simply remove the **bound** variable from the parameters list and let
this value be used in the child definitions, making it a **free**
variable in the child procedure while remaining **bound** by the parent.

``` {.scheme}
(define (sqrt x)
  (define (square y)
    (* y y))
  (define (average a b)
    (/ (+ a b) 2))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(sqrt 9)
```

I would like to improve on this definition, which doesn't quite match
the book so that it may definitely be run without necessarily running
the above definitions of `average` and `square`, by fully binding the
variables `guess` and `x` in the definitions of `average` and `square`.

``` {.scheme}
(define (sqrt x)
  (define (good-enough? guess)
    (define (square y)
      (* y y))
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (define (average a b)
      (/ (+ a b) 2))
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(sqrt 9)
```

Linear Recursion and Iteration
------------------------------

The difference between **linear recursion** and **iteration** is that
the returned value from a **linear recursive** procedure is different on
each step, so the full call pattern (which is the state) is pushed onto
the call stack, which can cause buffer overflows. With **iteration**,
the state of the procedure is contained in the operands, so the values
do not need to be pushed on to the stack with successive calls.

A **linear recursive** procedure definition of `factorial` is below.

``` {.scheme}
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

(factorial 6)
```

The below definition, on the other hand, is an **iterative** procedure.

``` {.scheme}
(define (factorial n)
  (fact-iter 1 1 n))

(define (fact-iter acc count n)
  (if (> count n)
      acc
      (fact-iter (* acc count)
                 (+ count 1)
                 n)))

(factorial 6)
```

This new definition of factorial will not buffer overflow because of
Scheme's use of **tail recursion**. This simply means that the
implementation of Scheme allows for **iterative** *processes* to be
implemented as **recursive** *procedures*, without adding frames to the
call stack on each iteration.

Tree Recursion
--------------

The next section covers **tree-recursion**, which is a recursive process
whose procedure is a part of more than one operand in its own
definition. The example given is `fib`.

``` {.scheme}
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1)) (fib (- n 2))))))

(fib 5)
```

Next is an example of a linear definition of `fib`, which takes
advantage of the fact that we only need to track two numbers at a time
to determine the next fibonacci number.

``` {.scheme}
(define (fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(fib 5)
```

An example of a **tree-recursive** process is given: how to count the
number of ways to give change with a set of coins. The point made is
that this **tree-recursive** process is easy to demarcate, but it is
difficult to find an **iterative** process to do the same thing.

``` {.scheme}
(define (count-change amount)
  (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
;; Commented because of long processing time
;; (count-change 100)
```
