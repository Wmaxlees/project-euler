#lang racket

(require math/number-theory)

(define (check-amicable n)
  (define b (for/sum ([j (divisors n)])
              (cond [(= j n) 0]
                    [else j])))
  (define a (for/sum ([j (divisors b)])
              (cond [(= j b) 0]
                    [else j])))

  (cond [(= a n) b]
        [else #f]))

(define result (set))
(for ([i (in-range 1 10001)])
  (define check (check-amicable i))

  (cond [(and check (not (= check i)))
         (set! result (set-add result i))
         (set! result(set-add result check))]))

(for/sum ([i result]) i)