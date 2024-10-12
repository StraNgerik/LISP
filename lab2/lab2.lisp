(defun remove-seconds-and-thirds (lst &optional (index 1))
  (if (null lst)
      nil
      (if (= (mod index 3) 1)
          (cons (car lst) (remove-seconds-and-thirds (cdr lst) (1+ index)))
          (remove-seconds-and-thirds (cdr lst) (1+ index))
      )
  )
)


(defun check-remove-seconds-and-thirds (name input expected)
  "Execute remove-seconds-and-thirds' on input', compare result with `expected' and print comparison status"
  (format t "~:[FAILED~;passed~]... ~a~%"
          (equal (remove-seconds-and-thirds input) expected)
          name)
)


(check-remove-seconds-and-thirds "Task 1 test 1" '(a b c d e f g) '(a d g))
(check-remove-seconds-and-thirds "Task 1 test 2" '(1 2 3 4 5 6) '(1 4))
(check-remove-seconds-and-thirds "Task 1 test 3" '() '())
(check-remove-seconds-and-thirds "Task 1 test 4" '(a) '(a))
(check-remove-seconds-and-thirds "Task 1 test 5" '(a b) '(a))
(check-remove-seconds-and-thirds "Task 1 test 6" '(1 a g d 5) '(1 d))


(defun list-set-intersection (a b)
  (unless (null a)
    (let ((x (car a)))
      (if (find-in-list x b)
          (cons x (list-set-intersection (cdr a) b))
        (list-set-intersection (cdr a) b)))))

(defun find-in-list (x lst)
  (cond ((null lst) nil)
        ((equal x (car lst)) t)
        (t (find-in-list x (cdr lst)))))

(defun check-list-set-intersection (name a b expected)
  (format t "~:[FAILED~;passed~]... ~a~%"
    (equal (list-set-intersection a b) expected)
    name)
)

(check-list-set-intersection "test1" '(3 4 2 7) '(3 4 5 6) '(3 4))
(check-list-set-intersection "test2" '(1 2 3 4) '(4 5 6 7) '(4))
(check-list-set-intersection "test3" '(5 6 7 3) '(3 7 4 3) '(7 3))
(check-list-set-intersection "test4" '(9 2 3 1) '(1 2 3 9) '(9 2 3 1))
(check-list-set-intersection "test5" '(A B C D) '(C D E F) '(C D))