#lang racket

(define (odd-collatz n)
  (+ (* 3 n) 1))

(define (even-collatz n)
  (/ n 2))

; (define memo (make-vector 500000000 0))

(define (get-collatz-count n)
  (define result (+ 1
    (cond ; [(not (= 0 (vector-ref memo n))) (vector-ref memo n)]
        [(= n 1) 0]
        [(even? n) (get-collatz-count (even-collatz n))]
        [(odd? n) (get-collatz-count (odd-collatz n))])))

  ; (vector-set! memo n result)
  
  result)

(define max-length 0)
(define max 0)

(for ([i (in-range 1 1000000)])
  (cond [(integer? (/ i 1000)) (displayln i)])
  
  (define count (get-collatz-count i))
  (cond [(> count max-length) (set! max i) (set! max-length count)]))