(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

(sine 12.15)
(p (sine 4.05))
(p (p (sine 1.35)))
(p (p (p (sine 0.45))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine 0.05))))))
(p (p (p (p (p 0.05)))))
(p (p (p (p 0.1495))))
(p (p (p 0.4351345505)))
(p (p 0.975846533167877))
(p -0.789563114470821)
-0.399803457413348
; 5

(sine 24.3)
(p (sine 8.1))
(p (p (sine 2.7)))
(p (p (p (sine 0.9))))
(p (p (p (p (sine 0.3)))))
(p (p (p (p (p (sine 0.1))))))
(p (p (p (p (p 0.1)))))

(sine 50.6)
(p (sine 16.87))
(p (p (sine 5.62)))
(p (p (p (sine 1.87407))))
(p (p (p (p (sine 0.624691358024691)))))
(p (p (p (p (p (sine 0.208230452674897))))))
(p (p (p (p (p (p (sine 0.069410150891632)))))))
; space: O(log n), time: O(log n)
