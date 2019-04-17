#lang scheme

(define (sumList list1)
  (cond
    ((null? list1) 0)
    (else (+ (car list1) (sumList(cdr list1))))))

(define (nCreeperMoon n)
  (cond
    ((>= 0 n) '(moon))
    (else (append '(creeper) (nCreeperMoon (- n 1))))))

(define (numZombies simpleList)
  (cond
    ((null? simpleList) 0)
    ((eqv? 'zombie (car simpleList)) (+ 1 (numZombies(cdr simpleList))))
    (else (numZombies(cdr simpleList)))))

(define (remove simpleList atom)
  (cond
    ((null? simpleList) '())
    ((eqv? atom (car simpleList)) (remove(cdr simpleList) atom))
    (else (cons (car simpleList) (remove(cdr simpleList) atom)))))

(define (reverse aList)
  (cond
    ((null? aList) '())
    (else (append (reverse (cdr aList)) (list (car aList))))))

(define (isPalindrome simpleList)
  (cond
    ((null? simpleList) #t)
    ((equal? (reverse simpleList) simpleList) #t)
    (else #f)))

  