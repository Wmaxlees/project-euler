#lang racket

(require math/number-theory)

(define triangle 0)
(for ([i (in-naturals 1)])
  (set! triangle (+ triangle i))
  #:final (> (length (divisors triangle)) 500)
  triangle)