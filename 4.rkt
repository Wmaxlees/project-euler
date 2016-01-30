#lang racket

; Will be at most 6 digits long 

(define (cons-number n)
  (define base (string->list (number->string n)))
  (define opp (reverse base))
  (string->number (list->string (append base opp))))
  

(for ([i (in-range 999 1 -1)])
  (define test-case (cons-number i))
  (for ([j (in-range 999 100 -1)])
    (define quot (/ test-case j))
    (cond [(and (integer? quot) (< quot 1000))
           (display j)
           (display "*")
           (display quot)
           (display "=")
           (displayln test-case)])))