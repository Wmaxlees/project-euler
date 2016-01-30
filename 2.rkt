#lang racket

(define result 0)
(define a 0)
(define b 1)
(for ([i 1000] #:break (> b 4000000))
  (define current (+ a b))
  (set! a b)
  (set! b current)
  (cond [(even? current) (set! result (+ result current))]))

(display result)