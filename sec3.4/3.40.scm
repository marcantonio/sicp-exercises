(define x 10)
(parallel-execute
 (lambda () (set! x (* x x)))
 (lambda () (set! x (* x x x))))

100       ; P1 is run, computing 100 but not setting x.  P2 is run setting x to 1000. P1 continues,
          ; settings x to 100.

1000      ; P2 is run, computing 1000 but not setting x.  P1 is run setting x to 100. P2 continues,
          ; settings x to 1000.

1000000   ; P1 is run, setting x 100.  P2 is run (* 100 100 100), setting x to 1,000,000.

1000000   ; P2 is run, setting x to 1,000.  P1 is run (* 1000 1000), setting x to 1,000,000.

10000     ; P1 sets first x to 10.  P2 runs, setting x to 1,000.  P1 continues (* 10 1000), setting
          ; x to 10,000.

100000    ; P2 sets first x to 10.  P1 runs, setting x to 100.  P2 continues (* 10 100 100), setting
          ; x to 100,000.

10000     ; P2 sets first and second x to 10.  P1 runs, setting x to 100.  P2 continues (* 10 10
          ; 100), setting x to 10,000.

; When serialized only 1,000,000 can be computed.
