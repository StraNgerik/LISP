<p align="center"><b>МОНУ НТУУ КПІ ім. Ігоря Сікорського ФПМ СПіСКС</b></p>
<p align="center">
<b>Звіт з лабораторної роботи 3</b><br/>
"Функціональний і імперативний підходи до роботи зі списками"<br/>
дисципліни "Вступ до функціонального програмування"
</p>
<p align="right"><b>Студент</b>: Бичко Кирило Володимирович КВ-12</p>
<p align="right"><b>Рік</b>: 2024</p>

## Загальне завдання
Реалізуйте алгоритм сортування чисел у списку двома способами: функціонально і імперативно.
1. Функціональний варіант реалізації має базуватись на використанні рекурсії і конструюванні нових списків щоразу, коли необхідно виконати зміну вхідного списку. Не допускається використання: деструктивних операцій, циклів, функцій вищого порядку або функцій для роботи зі списками/послідовностями, що використовуються як функції вищого порядку. Також реалізована функція не має бути функціоналом (тобто приймати на вхід функції в якості аргументів).
2. Імперативний варіант реалізації має базуватись на використанні циклів і деструктивних функцій (псевдофункцій). Не допускається використання функцій вищого порядку або функцій для роботи зі списками/послідовностями, що використовуються як функції вищого порядку. Тим не менш, оригінальний список цей варіант реалізації також не має змінювати, тому перед виконанням деструктивних змін варто застосувати функцію copy-list (в разі необхідності). Також реалізована функція не має бути функціоналом (тобто приймати на вхід функції в якості аргументів). 

Алгоритм, який необхідно реалізувати, задається варіантом (п. 3.1.1). Зміст і шаблон звіту наведені в п. 3.2. 
Кожна реалізована функція має бути протестована для різних тестових наборів. 
Тести мають бути оформленні у вигляді модульних тестів (наприклад, як наведено у п. 2.3).
## Варіант 2
Алгоритм сортування обміном №1 (без оптимізацій) за незменшенням.
## Лістинг функції bubble-sort-functional
```lisp
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
```
## Лістинг функції bubble-sort-imperative
```lisp
(defun bubble-sort-imperative (A)
  (let ((Answ (copy-list A)) (n (list-length A)))
    (dotimes (R n)
      (dotimes (i (- n R 1))
        (when (> (nth i Answ) (nth (1+ i) Answ))
          (let ((tmp (nth i Answ)))
            (rplaca (nthcdr i Answ) (nth (1+ i) Answ))
            (rplaca (nthcdr (1+ i) Answ) tmp)))))
    Answ))
```
### Тестові набори для bubble-sort-functional
```lisp
(defun check-bubble_sort_funtional (name input len expected)
(format t "~:[FAILED~;passed~]... ~a~%"
(equal (bubble-sort-functional input len) expected)
name))

(check-bubble_sort_funtional "Functional Test 1 " '(4 8 1 2 5) '5 '(1 2 4 5 8))
(check-bubble_sort_funtional "Functional Test 2 " '(1 3 5 7 9) '5 '(1 3 5 7 9))
(check-bubble_sort_funtional "Functional Test 3 " '(9 7 5 3 1) '5 '(1 3 5 7 9))
(check-bubble_sort_funtional "Functional Test 4 " '(2 2 2 2 2) '5 '(2 2 2 2 2))
(check-bubble_sort_funtional "Functional Test 5 " '(10 -3 25 0 7 15) '6 '(-3 0 7 10 15 25))
```

### Тестові набори для bubble-sort-imperative
```lisp
(defun check-bubble-sort-imperative (name input expected)
(format t "~:[FAILED~;passed~]... ~a~%"
(equal (bubble-sort-imperative input) expected)
name))

(check-bubble-sort-imperative "Imperative Test 1 " '(4 8 1 2 5) '(1 2 4 5 8))
(check-bubble-sort-imperative "Imperative Test 2 " '(1 3 5 7 9) '(1 3 5 7 9))
(check-bubble-sort-imperative "Imperative Test 3 " '(9 7 5 3 1) '(1 3 5 7 9))
(check-bubble-sort-imperative "Imperative Test 4 " '(2 2 2 2 2) '(2 2 2 2 2))
(check-bubble-sort-imperative "Imperative Test 5 " '(10 -3 25 0 7 15) '(-3 0 7 10 15 25))
```

### Тестування
```lisp
passed... Functional Test 1 
passed... Functional Test 2 
passed... Functional Test 3 
passed... Functional Test 4 
passed... Functional Test 5 
passed... Imperative Test 1 
passed... Imperative Test 2 
passed... Imperative Test 3 
passed... Imperative Test 4 
passed... Imperative Test 5
```
