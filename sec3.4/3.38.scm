;1
;
;45
;35
;50
;40

;2
;
;   Peter          Paul         Mary
;     |             |             |
;     |             |             |
;     |             |             |
;balance: 100       |             |
;     |             |             |
;     |        balance: 100       |
;     |             |             |
;     |             |        balance: 100
;     |             |             |
;     |             |             |
;     |             |             |
;     |        (- balance 20)     |
;     |             |             |
;     |             |             |
;     |            80             |
;     |                      (- balance (/ balance 2))
;     |                           |
;     |                           |
;     |                           |
;     |                           50
;     |
;     |
;(+ balance 10)
;
;110
