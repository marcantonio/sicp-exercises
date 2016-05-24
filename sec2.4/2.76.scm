; For generic operations with explicit dispatch you must create new
; procedures who's names don't collide with existing ones.  For
; data-directed style you need to create a new module.  For
; message-passing style you need to create a new object.  In all
; cases, selectors will need to be added to the old system.
;
; In a system with many new types, both data-directed and
; message-passing would be efficent.  In a system with many new
; operations, message-passing is easier to maintain.
