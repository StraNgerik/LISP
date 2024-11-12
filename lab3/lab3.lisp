(defun bubble-sort-pass (A)
  (if (null (cdr A))
      A
      (let ((rest (bubble-sort-pass (cdr A))))
        (if (> (car A) (car rest))
            (cons (car rest) (cons (car A) (cdr rest)))
            (cons (car A) rest)))))

(defun bubble-sort-functional-rec (A R)
  (if (<= R 1)
      A
      (bubble-sort-functional-rec (bubble-sort-pass A) (- R 1))))

(defun bubble-sort-functional (A)
  (let ((len (list-length A)))
    (bubble-sort-functional-rec A len)))

(defun check-bubble_sort_funtional (name input expected)
(format t "~:[FAILED~;passed~]... ~a~%"
(equal (bubble-sort-functional input) expected)
name))

(check-bubble_sort_funtional "Functional Test 1 " '(4 8 1 2 5) '(1 2 4 5 8))
(check-bubble_sort_funtional "Functional Test 2 " '(1 3 5 7 9) '(1 3 5 7 9))
(check-bubble_sort_funtional "Functional Test 3 " '(9 7 5 3 1) '(1 3 5 7 9))
(check-bubble_sort_funtional "Functional Test 4 " '(2 2 2 2 2) '(2 2 2 2 2))
(check-bubble_sort_funtional "Functional Test 5 " '(10 -3 25 0 7 15) '(-3 0 7 10 15 25))

(defun bubble-sort-imperative (A)
  (let ((Answ (copy-list A)) (n (list-length A)))
    (dotimes (R n)
      (dotimes (i (- n R 1))
        (when (> (nth i Answ) (nth (1+ i) Answ))
          (rotatef (nth i Answ) (nth (1+ i) Answ)))))
    Answ))

(defun check-bubble-sort-imperative (name input expected)
(format t "~:[FAILED~;passed~]... ~a~%"
(equal (bubble-sort-imperative input) expected)
name))

(check-bubble-sort-imperative "Imperative Test 1 " '(4 8 1 2 5) '(1 2 4 5 8))
(check-bubble-sort-imperative "Imperative Test 2 " '(1 3 5 7 9) '(1 3 5 7 9))
(check-bubble-sort-imperative "Imperative Test 3 " '(9 7 5 3 1) '(1 3 5 7 9))
(check-bubble-sort-imperative "Imperative Test 4 " '(2 2 2 2 2) '(2 2 2 2 2))
(check-bubble-sort-imperative "Imperative Test 5 " '(10 -3 25 0 7 15) '(-3 0 7 10 15 25))
