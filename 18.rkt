#lang racket

(struct node
  (value left right [calc-value #:auto])
  #:auto-value -1
  #:transparent
  #:mutable)

(define data "75\n")
(set! data (string-append data "95 64\n"))
(set! data (string-append data "17 47 82\n"))
(set! data (string-append data "18 35 87 10\n"))
(set! data (string-append data "20 04 82 47 65\n"))
(set! data (string-append data "19 01 23 75 03 34\n"))
(set! data (string-append data "88 02 77 73 07 63 67\n"))
(set! data (string-append data "99 65 04 28 06 16 70 92\n"))
(set! data (string-append data "41 41 26 56 83 40 80 70 33\n"))
(set! data (string-append data "41 48 72 33 47 32 37 16 94 29\n"))
(set! data (string-append data "53 71 44 65 25 43 91 52 97 51 14\n"))
(set! data (string-append data "70 11 33 28 77 73 17 78 39 68 17 57\n"))
(set! data (string-append data "91 71 52 38 17 14 91 43 58 50 27 29 48\n"))
(set! data (string-append data "63 66 04 68 89 53 67 30 73 16 69 87 40 31\n"))
(set! data (string-append data "04 62 98 27 23 09 70 98 73 93 38 53 60 04 23\n"))

(set! data (string-split data #rx"\n"))

(define split-data '())
(for ([i data])
  (set! split-data (append split-data (list (string-split i #rx" ")))))

(define (construct-node row col)
  (cond [(= row (- (length split-data) 1))
         (node (list-ref (list-ref split-data row) col) 0 0)]

        [else
         (node (list-ref (list-ref split-data row) col) (construct-node (+ row 1) col) (construct-node (+ row 1) (+ col 1)))]))

(define tree (construct-node 0 0))

(define (get-max-value node depth)
  (cond [(not (= (node-calc-value node) -1)) (node-calc-value node)]
        
        [(= depth (- (length split-data) 1))
         (set-node-calc-value! node (string->number (node-value node)))
         (node-calc-value node)]
        
        [else (set-node-calc-value! node
                                   (+ (string->number (node-value node))
                                      (max (get-max-value (node-left node) (+ depth 1)) (get-max-value (node-right node) (+ depth 1)))))
              (node-calc-value node)]))
         