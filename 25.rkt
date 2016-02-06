#lang racket

(define (first-fib-digits n)
  (define a 1)
  (define b 1)
  (define result 0)
  (for ([i (in-naturals 3)]
    #:break (> b (- (expt 10 (- n 1)) 1)))

    (define c (+ a b))
    (set! a b)
    (set! b c)
    (set! result i))

  result)