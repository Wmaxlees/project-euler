#lang racket

(define in-file (open-input-file "files/22-names.txt"))

(define name-list '())
(for ([i (string-split (read-line in-file) #rx",")])
  (set! name-list (append name-list (list (string-trim i #rx"\"")))))

(set! name-list (sort name-list string<?))

(define (get-word-score word)
  (for/sum ([i (string->list word)])
    (- (char->integer i) 64)))

(for/sum ([i (in-range 0 (length name-list))])
  (* (get-word-score (list-ref name-list i)) (+ i 1)))