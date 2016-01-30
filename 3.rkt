#lang racket

 (require math/number-theory)

; Brute force solution :(

(define result '())

(define (find-factors n)
  (cond
    [(prime? n) (set! result (append result (list n)))]
    [else
     (for ([i (in-range 1 (ceiling (+ 1 (sqrt n))))])
       (define quot (/ n i))
       #:final (and (> i 1) (integer? quot))
       (cond
         [(and (> i 1) (integer? quot))
          (find-factors i)
           (find-factors quot)]))]))