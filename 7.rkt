#lang racket

; Kinda like a basic sieve of aristophanes
; without all the memory usage

(define (get-nth-prime n)
  (define primes '())

  (for ([i (in-naturals 2)])
    #:break (> (length primes) n)

    (define is-prime #t)
    (for ([j (in-range 0 (length primes))])
      #:break (not is-prime)
      (cond [(integer? (/ i (list-ref primes j))) (set! is-prime #f)]))

    (cond [is-prime (set! primes (append primes (list i)))]))

  (list-ref primes (- n 1)))