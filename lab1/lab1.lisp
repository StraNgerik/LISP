; task 1
(defvar my-list)
(setq my-list (list 'z 4 (list 'v 6) ()))
(print my-list)

; task 2
(print(car my-list))

; task 3
(print(cdr my-list))

; task 4
(print (third my-list))

; task 5
(print (car (last my-list)))

; task 6
(print(atom (third my-list)))
(print(atom (car my-list)))
(print(atom (fourth my-list)))

(print(listp (second my-list)))
(print(listp (fifth my-list)))
(print(listp (third my-list)))

; task 7
(print(EQUALP my-list my-list))
(print(eq (car my-list) (car my-list)))


; task 8
(print(append my-list (third my-list)))

; variant 2
(let ((x (list "A" 2 1)))
    (print (list x "B" (cdr x) "C"))
)
