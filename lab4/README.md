<p align="center"><b>МОНУ НТУУ КПІ ім. Ігоря Сікорського ФПМ СПіСКС</b></p>
<p align="center">
<b>Звіт з лабораторної роботи 4</b><br/>
"Функції вищого порядку та замикання"<br/>
дисципліни "Вступ до функціонального програмування"
</p>
<p align="right"><b>Студент</b>: Бичко Кирило Володимирович КВ-12</p>
<p align="right"><b>Рік</b>: 2024</p>

## Загальне завдання
Завдання складається з двох частин:
1. Переписати функціональну реалізацію алгоритму сортування з  [лабораторної роботи 3](https://github.com/t3ry4git/lisp-lab3/tree/main) з такими змінами: 
* використати функції вищого порядку для роботи з послідовностями (де це доречно);
* додати до інтерфейсу функції (та використання в реалізації) два ключових параметра: ```key``` та ```test``` , що працюють аналогічно до того, як працюють параметри з такими назвами в функціях, що працюють з послідовностями. При цьому ```key``` має виконатись мінімальну кількість разів.
2. Реалізувати функцію, що створює замикання, яке працює згідно із завданням за варіантом (див. п 4.1.2). Використання псевдо-функцій не забороняється, але, за можливості, має бути мінімізоване.

## Варіант першої частини 2
Алгоритм сортування обміном №1 (без оптимізацій) за незменшенням.
## Лістинг реалізації першої частини завдання
```lisp
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
```
### Тестові набори та утиліти першої частини
```lisp
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
```
### Тестування першої частини
```lisp
passed... Functional Test 1 
passed... Functional Test 2 
passed... Functional Test 3 
passed... Functional Test 4 
passed... Functional Test 5 
passed... Functional Test 6
```
## Варіант другої частини 2
Написати функцію add-prev-reducer , яка має один ключовий параметр — функцію
transform . add-prev-reducer має повернути функцію, яка при застосуванні в якості
першого аргументу reduce робить наступне: кожен елемент списку-аргументу reduce
перетворюється на точкову пару, де в комірці CAR знаходиться значення поточного
елемента, а в комірці CDR знаходиться значення попереднього елемента списку (тобто
того, що знаходиться "зліва"). Якщо функція transform передана, тоді значення
поточного і попереднього елементів, що потраплять у результат, мають бути змінені
згідно transform . Обмеження, які накладаються на використання функції-результату
add-prev-reducer при передачі у reduce визначаються розробником (тобто,
наприклад, необхідно чітко визначити, якими мають бути значення ключових параметрів
функції reduce from-end та initial-value ). transform має виконатись мінімальну
кількість разів.
```lisp
CL-USER> (reduce (add-prev-reducer)
'(1 2 3)
:from-end ...
:initial-value ...)
((1 . NIL) (2 . 1) (3 . 2))
CL-USER> (reduce (add-prev-reducer :transform #'1+)
'(1 2 3)
:from-end ...
:initial-value ...)
((2 . NIL) (3 . 2) (4 . 3))
```
## Лістинг реалізації другої частини завдання
```lisp
(defun add-prev-reducer (&optional (transform #'identity))
"Обмеження:
- `:initial-value` для `reduce` має бути списком, якщо передано.
- Працює коректно з `:from-end nil`."
  (lambda (acc elem)
    (let* ((processed-elem (funcall transform elem))
           (prev (if (null acc) nil (caar acc))))
      (cons (cons processed-elem prev) acc))))
```
### Тестові набори та утиліти другої частини
```lisp
(defun check-add-prev-reducer (name input expected &key initial-value from-end transform)
  (let ((transform (or transform #'identity)))
    (let ((result (nreverse (reduce (add-prev-reducer transform)
                          input
                          :initial-value initial-value
                          :from-end from-end))))
      (format t "~:[FAILED~;passed~]... ~a~%" (equal result expected) name))))

(check-add-prev-reducer "Prev-reducer Test 1" '(1 2 3) '((1 . nil) (2 . 1) (3 . 2)) :initial-value nil :from-end nil)
(check-add-prev-reducer "Prev-reducer Test 2" '(1 2 3) '((2 . nil) (3 . 2) (4 . 3)) :initial-value nil :from-end nil :transform #'1+)
```
### Тестування другої частини
```lisp
passed... Prev-reducer Test 1
passed... Prev-reducer Test 2
```
