(list 1 (list 2 (list 3 4)))
;(1 (2 (3 4)))

; [o|o]--->[o|/]
;  |        |
;  |        |
;  v        v
; [1]      [o|o]--->[o|/]
;           |        |
;           |        |
;           v        v
;          [2]      [o|o]--->[o|/]
;                    |        |
;                    |        |
;                    v        v
;                   [3]      [4]
;
;   ____(1 (2 (3 4)))
;  |       |
;  |       |
;  1   ____(2 (3 4))
;     |    |
;     |    |
;     2   _(3 4)_
;        |       |
;        |       |
;        3       4
