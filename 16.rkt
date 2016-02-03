#lang racket

(define (sum-of-digits n)
  (define pow (expt 2 n))

  (for/sum ([i (string->list (number->string pow))]) (- (char->integer i) 48)))