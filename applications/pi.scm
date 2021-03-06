(define r 100000)
(define (pi n)
  (let* ((n (+ (quotient n 5) 1))
         (m (quotient (* n 5 3322) 1000))
         (a (make-vector (+ 1 m) 2)))
    (vector-set! a m 4)
    (do ((j 1 (+ 1 j))
         (q 0 0)
         (b 2 (remainder q r)))
        ((> j n) #t)
      (do ((k m (- k 1)))
          ((zero? k) #t)
        (set! q (+ q (* (vector-ref a k) r)))
        (let ((t (+ 1 (* 2 k))))
          (vector-set! a k (remainder q t))
          (set! q (* k (quotient q t)))))
      (let ((s (number->string (+ b (quotient q r)))))
        (do ((l (string-length s) (+ 1 l)))
            ((>= l 5) (display s))
          (display #\0)))
      (display (if (zero? (modulo j 10)) #\newline #\space)))
    (newline)))
