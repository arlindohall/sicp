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
