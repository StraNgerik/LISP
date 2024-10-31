(defun bubble-sort-functional-loop-in (A R i)
  (if (>= i (- R 1))
      A
      (bubble-sort-functional-loop-in
       (if (> (nth i A) (nth (1+ i) A))
           (append (subseq A 0 i)
                   (list (nth (1+ i) A))
                   (list (nth i A))
                   (nthcdr (+ 2 i) A))
           A)
       R 
       (+ i 1))))

(defun bubble-sort-functional (A len)
    (if (<= len 1)
        A
        (bubble-sort-functional
         (bubble-sort-functional-loop-in A len 0) (- len 1))))

(defun check-bubble_sort_funtional (name input len expected)
(format t "~:[FAILED~;passed~]... ~a~%"
(equal (bubble-sort-functional input len) expected)
name))

(check-bubble_sort_funtional "Functional Test 1 " '(4 8 1 2 5) '5 '(1 2 4 5 8))
(check-bubble_sort_funtional "Functional Test 2 " '(1 3 5 7 9) '5 '(1 3 5 7 9))
(check-bubble_sort_funtional "Functional Test 3 " '(9 7 5 3 1) '5 '(1 3 5 7 9))
(check-bubble_sort_funtional "Functional Test 4 " '(2 2 2 2 2) '5 '(2 2 2 2 2))
(check-bubble_sort_funtional "Functional Test 5 " '(10 -3 25 0 7 15) '6 '(-3 0 7 10 15 25))

(defun bubble-sort-imperative (A)
  (let ((Answ (copy-list A)) (n (list-length A)))
    (dotimes (R n)
      (dotimes (i (- n R 1))
        (when (> (nth i Answ) (nth (1+ i) Answ))
          (let ((tmp (nth i Answ)))
            (rplaca (nthcdr i Answ) (nth (1+ i) Answ))
            (rplaca (nthcdr (1+ i) Answ) tmp)))))
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
