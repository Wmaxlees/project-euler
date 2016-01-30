#lang racket

(require racket/set)

(define (generate-multiples a n)
  (define the-set (mutable-set 0))
  
  (for ([i (in-range (/ n a))])
    (set-add! the-set (* i a)))
  the-set)

(define a-set (generate-multiples 3 1000))
(set-union! a-set (generate-multiples 5 1000))

(define accum 0)
(for ([i a-set])
  (set! accum (+ accum i)))