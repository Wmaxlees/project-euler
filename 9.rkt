#lang racket

(define (generate-a b n)
  (/ (* n (- n (* 2 b))) (* 2 (- n b))))

(define (generate-c a b n)
  (- n a b))
  

(define (solve-for n)
  (for ([b (in-range 0 n)])
    (define a (generate-a b n))
    (define c (generate-c a b n))
    (cond [(and
            (= (+ a b c) n)
            (> b a)
            (> c b)
            (integer? a)
            (integer? b)
            (integer? c)
            (> a 0)
            (> b 0)
            (> c 0)) (printf "~a ~a ~a~n" a b c)])))