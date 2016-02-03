#lang racket

(define (get-term n)
  (set! n (- (char->integer n) 48))
  (cond
    [(= 1 n) "one"]
    [(= 2 n) "two"]
    [(= 3 n) "three"]
    [(= 4 n) "four"]
    [(= 5 n) "five"]
    [(= 6 n) "six"]
    [(= 7 n) "seven"]
    [(= 8 n) "eight"]
    [(= 9 n) "nine"]
    [else ""]))

(define (get-tens-term n)
  (set! n (- (char->integer n) 48))
  (cond
    [(= 2 n) "twenty"]
    [(= 3 n) "thirty"]
    [(= 4 n) "forty"]
    [(= 5 n) "fifty"]
    [(= 6 n) "sixty"]
    [(= 7 n) "seventy"]
    [(= 8 n) "eighty"]
    [(= 9 n) "ninety"]
    [else ""]))

(define (get-teen-term n)
  (set! n (- (char->integer n) 48))
  (cond
    [(= 0 n) "ten"]
    [(= 1 n) "eleven"]
    [(= 2 n) "twelve"]
    [(= 3 n) "thirteen"]
    [(= 4 n) "fourteen"]
    [(= 5 n) "fifteen"]
    [(= 6 n) "sixteen"]
    [(= 7 n) "seventeen"]
    [(= 8 n) "eighteen"]
    [(= 9 n) "nineteen"]
    [else ""]))

(define (gen-string n)
  (define result "")
  
  (define digits (string->list (string-append "000" (number->string n))))
  (set! digits (reverse digits))

  (cond [(> n 999)
         (set! result (string-append result (get-term (list-ref digits 3))))
         (set! result (string-append result "thousand"))])

  (cond [(not (eqv? #\0 (list-ref digits 2)))
         (set! result (string-append result (get-term (list-ref digits 2))))
         (set! result (string-append result "hundred"))])

  (cond [(and
          (or (not (eqv? #\0 (list-ref digits 3))) (not (eqv? #\0 (list-ref digits 2))))
          (or (not (eqv? #\0 (list-ref digits 1))) (not (eqv? #\0 (list-ref digits 0))))
          (set! result (string-append result "and")))])

  (cond [(not (or (eqv? #\1 (list-ref digits 1)) (eqv? #\0 (list-ref digits 1))))
         (set! result (string-append result (get-tens-term (list-ref digits 1))))
         (set! result (string-append result (get-term (list-ref digits 0))))]
        [(eqv? #\0 (list-ref digits 1))
         (set! result (string-append result (get-term (list-ref digits 0))))]
        [(> n 9)
         (set! result (string-append result (get-teen-term (list-ref digits 0))))])

  result)

(define sum 0)
(for ([i (in-range 1 1001)])
  (define str (gen-string i))
  (set! sum (+ sum (string-length str))))

sum