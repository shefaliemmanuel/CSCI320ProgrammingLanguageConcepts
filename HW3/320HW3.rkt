#lang scheme

;1a
(define (inSet? element set)
  (cond
    ((null? set) #f)
    ((eqv? element (car set)) #t)
    (else (inSet? element (cdr set)))))

;1b
(define (insert element set)
  (cond
    ((null? element) set)
    ((inSet? element set) set)
    (else (cons element set))))

;1c helper
(define (subset? L1 L2)
   (cond
     ((null? L1) #t)
     ((and (inSet?  (car L1) L2)
           (subset? (cdr L1) L2)) #t)
     (else #f)))
;1c
(define (setEqv? L1 L2)
  (cond
    ((and (subset? L1 L2) (subset? L2 L1)) #t)
    (else #f)))

;2
                          ;parameter
(define myFilter (lambda (boolFun L)
                  (cond
                    ((null? L) '())
                    ((boolFun (car L)) (cons (car L)(myFilter boolFun (cdr L))))
                    (else (myFilter boolFun (cdr L))))))

    ;((null? L) L)
    ;((boolFun (car L)) cons (car L) (myFilter boolFun (cdr L)))
    ; (else (myFilter boolFun (cdr L)))

;3 
(define (naturalNumbersThatAreMultiplesOf3And5 List)
  (cond
    ((null? List) 0)
    ((or (eqv? 0 (remainder (car List) '3)) (eqv? 0 (remainder (car List) '5)))
    (+ (car List) (naturalNumbersThatAreMultiplesOf3And5 (cdr List))))
    (else (naturalNumbersThatAreMultiplesOf3And5 (cdr List)))))


(myFilter even? '(1 2 3 4 5 6))

(naturalNumbersThatAreMultiplesOf3And5 (range 0 1000))