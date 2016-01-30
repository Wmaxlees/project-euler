#lang racket

; Very slow...
; There are definitely optimizations to be made

(define (find-multiples n m)
  (define sfsg #f) ; So far so good

  (define max (for/product ([i (in-range n m 1)]) i))
  
  (for ([i (in-naturals 1)])
    #:break (or sfsg (> (* i 20) max))
    (set! sfsg #t)
    
    (for ([j (in-range n m)])
      #:break (false? sfsg)
      (cond [(not (integer? (/ (* m i) j))) (set! sfsg #f)]))

    (cond [sfsg
           (display (* m i))])))
    