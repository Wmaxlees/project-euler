#lang racket

(define (find-greatest-product n k)
  (define str (number->string n))

  (define previous (make-vector k))
  (define max 0)
  (for ([i (in-range 0 (string-length str))])
    (for ([j (in-range 0 (- k 1))])
      (vector-set! previous j (vector-ref previous (+ j 1))))

    (vector-set! previous (- k 1) (- (char->integer (string-ref str i)) 48))

    (define product (for/product ([j (vector->list previous)]) j))

    (cond [(> product max) (set! max product)]))

  max)