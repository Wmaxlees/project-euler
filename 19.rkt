#lang racket

; January 31
; February 28 or 29
; March 31
; April 30
; May 31
; June 30
; July 31
; August 31
; September 30
; October 31
; November 30
; December 31

(define current 0)

; Year 1900 isn't counted
(set! current (modulo (+ current 31) 7)) ; Jan
(set! current (modulo (+ current 28) 7)) ; Feb
(set! current (modulo (+ current 31) 7)) ; Mar
(set! current (modulo (+ current 30) 7)) ; Apr
(set! current (modulo (+ current 31) 7)) ; May
(set! current (modulo (+ current 30) 7)) ; Jun
(set! current (modulo (+ current 31) 7)) ; Jul
(set! current (modulo (+ current 31) 7)) ; Aug
(set! current (modulo (+ current 30) 7)) ; Sep
(set! current (modulo (+ current 31) 7)) ; Oct
(set! current (modulo (+ current 30) 7)) ; Nov
(set! current (modulo (+ current 31) 7)) ; Dec

(define count 0)
(for ([i (in-range 1 101)])
  ; January
  (cond [(= 6 current) (set! count (+ count 1))])
  (set! current (modulo (+ current 31) 7))
  

  ; February
  (cond [(= 6 current) (set! count (+ count 1))])
  (cond [(= 0 (modulo i 4))
         (define digits (append (reverse (string->list (number->string i))) (list #\0 #\0)))
         (cond [(or (= 0 (modulo (+ 1900 i) 400))
                    (or (not (eqv? (list-ref digits 0) #\0)) (not (eqv? (list-ref digits 1) #\0))))
                (set! current (modulo (+ current 29) 7))])]
        [else
         (set! current (modulo (+ current 28) 7))])

  ; March
  (cond [(= 6 current) (set! count (+ count 1))])
  (set! current (modulo (+ current 31) 7))


  ; April
  (cond [(= 6 current) (set! count (+ count 1))])
  (set! current (modulo (+ current 30) 7))
  

  ; May
  (cond [(= 6 current) (set! count (+ count 1))])
  (set! current (modulo (+ current 31) 7))
  

  ; June
  (cond [(= 6 current) (set! count (+ count 1))])
  (set! current (modulo (+ current 30) 7))
  

  ; July
  (cond [(= 6 current) (set! count (+ count 1))])
  (set! current (modulo (+ current 31) 7))
  

  ; August
  (cond [(= 6 current) (set! count (+ count 1))])
  (set! current (modulo (+ current 31) 7))
  

  ; September
  (cond [(= 6 current) (set! count (+ count 1))])
  (set! current (modulo (+ current 30) 7))
  

  ; October
  (cond [(= 6 current) (set! count (+ count 1))])
  (set! current (modulo (+ current 31) 7))
  

  ; November
  (cond [(= 6 current) (set! count (+ count 1))])
  (set! current (modulo (+ current 30) 7))
  

  ; December
  (cond [(= 6 current) (set! count (+ count 1))])
  (set! current (modulo (+ current 31) 7)))
  