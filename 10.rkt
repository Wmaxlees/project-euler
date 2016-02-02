#lang racket

(define seen 0)
(define sum 0)

(define (sum-primes-below n)
  (for ([i (in-range 2 n)])
    (cond [(= 0 (bitwise-and seen (arithmetic-shift 1 i)))
           (set! sum (+ sum i))
           (printf "+ ~a = ~a~n" i sum)
           (for ([j (in-range i n i)])
             (set! seen (bitwise-ior seen (arithmetic-shift 1 j))))])))