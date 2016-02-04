#lang racket

(define sum 0)
(for ([i (string->list
          (number->string
           (for/product ([i (in-range 1 101)]) i)))])
  (set! sum (+ sum (- (char->integer i) 48))))

sum