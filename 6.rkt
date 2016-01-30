#lang racket

(define (sum-of-squares n)
  (define result 0)
  (for ([i (in-range 1 (+ 1 n))])
    (set! result (+ result (expt i 2))))
  result)

(define (square-of-sums n)
  (define sum 0)
  (for ([i (in-range 1 (+ 1 n))])
    (set! sum (+ sum i)))
  (expt sum 2))