(defun bubble-sort-pass (A &key key (test #'<))
  (if (null (cdr A))
      A
      (let* ((x (car A))
             (y (cadr A))
             (x-key (funcall key x))
             (y-key (funcall key y)))
        (if (funcall test y-key x-key)
            (cons y (bubble-sort-pass (cons x (cddr A)) :key key :test test))
            (cons x (bubble-sort-pass (cdr A) :key key :test test))))))

(defun bubble-sort-functional-rec (A R &key key (test #'<))
  (if (<= R 1)
      A
      (bubble-sort-functional-rec
       (bubble-sort-pass A :key key :test test) (- R 1) :key key :test test)))

(defun bubble-sort-functional (A &key (key #'identity) (test #'<))
  (let ((len (length A)))
    (bubble-sort-functional-rec A len :key key :test test)))

(defun check-bubble_sort_funtional (name input expected &key (key #'identity) (test #'<))
(format t "~:[FAILED~;passed~]... ~a~%"
(equal (bubble-sort-functional input :key key :test test) expected)
name))

(check-bubble_sort_funtional "Functional Test 1 " '(4 8 1 2 5) '(1 2 4 5 8) :key (lambda (x) (+ x 1)))
(check-bubble_sort_funtional "Functional Test 2 " '(1 3 5 7 9) '(1 3 5 7 9))
(check-bubble_sort_funtional "Functional Test 3 " '(9 7 5 3 1) '(1 3 5 7 9))
(check-bubble_sort_funtional "Functional Test 4 " '(2 2 2 2 2) '(2 2 2 2 2))
(check-bubble_sort_funtional "Functional Test 5 " '(10 -3 25 0 7 15) '(-3 0 7 10 15 25))
(check-bubble_sort_funtional "Functional Test 6 " '(9 7 5 3 1) '(9 7 5 3 1) :test #'>)



(defun add-prev-reducer (&optional (transform #'identity))
"Обмеження:
- `:initial-value` для `reduce` має бути списком, якщо передано.
- Працює коректно з `:from-end nil`."
  (lambda (acc elem)
    (let* ((processed-elem (funcall transform elem))
           (prev (if (null acc) nil (caar acc))))
      (cons (cons processed-elem prev) acc))))


(defun check-add-prev-reducer (name input expected &key initial-value from-end transform)
  (let ((transform (or transform #'identity)))
    (let ((result (nreverse (reduce (add-prev-reducer transform)
                          input
                          :initial-value initial-value
                          :from-end from-end))))
      (format t "~:[FAILED~;passed~]... ~a~%" (equal result expected) name))))

(check-add-prev-reducer "Prev-reducer Test 1" '(1 2 3) '((1 . nil) (2 . 1) (3 . 2)) :initial-value nil :from-end nil)
(check-add-prev-reducer "Prev-reducer Test 2" '(1 2 3) '((2 . nil) (3 . 2) (4 . 3)) :initial-value nil :from-end nil :transform #'1+)
