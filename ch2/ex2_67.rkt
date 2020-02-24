#lang sicp
(define (decode bits tree)
  (define (iter seq current-branch)
    (if (null? seq) nil
        (let ((next-branch (choose-branch (car seq) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch) (iter (cdr seq) tree))
              (iter (cdr seq) (next-branch))))))
  (iter bits tree))

(define (choose-branch bit current-branch)
  (cond ((= bit 0) (left-branch current-branch))
        ((= bit 1) (right-branch current-branch))))

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? x)
  (eq? (car x) 'leaf))
(define (symbol-leaf x)
  (cadr x))
(define (weight-leaf x)
  (caddr x))

(define (make-code-tree left right)
  (list left right (append (symbols left) (symbols right)) (+ (weight left) (weight right))))
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree) (list (symbol-leaf tree)) (caddr tree)))
(define (weight tree)
  (if (leaf? tree) (weight-leaf tree) (cadddr tree)))

(define sample-tree
  (make-code-tree (make-leaf 'a 4)
                  (make-leaf 'b 1)))
(define sample-message '(0 1 1))
;;test
(decode sample-message sample-tree)