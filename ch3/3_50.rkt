#lang sicp
(define (cons-stream x y)
  (cons x (delay y)))
(define (stream-car stream) (car stream))
(define (stream-cdr stream) (force (cdr stream)))

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map
              (cons proc (map stream-cdr argstreams))))))
(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high))))
;test
(define a (stream-enumerate-interval 1 10))
(define b (stream-enumerate-interval 11 20))
(stream-map (lambda (x y) (+ x y)) a b)
