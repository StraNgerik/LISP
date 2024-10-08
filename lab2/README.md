<p align="center"><b>МОНУ НТУУ КПІ ім. Ігоря Сікорського ФПМ СПіСКС</b></p>
<p align="center">
<b>Звіт з лабораторної роботи 2</b><br/>
"Рекурсія"<br/>
дисципліни "Вступ до функціонального програмування"
</p>
<p align="right"><b>Студент</b>: Терентьєв Іван Дмитрович КВ-11</p>
<p align="right"><b>Рік</b>: 2024</p>

## Загальне завдання
Реалізуйте дві рекурсивні функції, що виконують деякі дії з вхідним(и) списком(-ами), за можливості/необхідності використовуючи різні види рекурсії. 
Функції, які необхідно реалізувати, задаються варіантом (п. 2.1.1). Вимоги до функцій:
1. Зміна списку згідно із завданням має відбуватись за рахунок конструювання нового списку, а не зміни наявного (вхідного).
2. Не допускається використання функцій вищого порядку чи стандартних функцій для роботи зі списками, що не наведені в четвертому розділі навчального посібника.
3. Реалізована функція не має бути функцією вищого порядку, тобто приймати функції в якості аргументів.
4. Не допускається використання псевдофункцій (деструктивного підходу).
5. Не допускається використання циклів. Кожна реалізована функція має бути протестована для різних тестових наборів. Тести мають бути оформленні у вигляді модульних тестів (див. п. 2.3). Додатковий бал за лабораторну роботу можна отримати в разі виконання всіх наступних умов:
робота виконана до дедлайну (включно з датою дедлайну)
крім основних реалізацій функцій за варіантом, також реалізовано додатковий варіант однієї чи обох функцій, який працюватиме швидше за основну реалізацію, не порушуючи при цьому перші три вимоги до основної реалізації (вимоги 4 і 5 можуть бути порушені), за виключенням того, що в разі необхідності можна також використати стандартну функцію copy-list
## Варіант 2
1. Написати функцію remove-seconds-and-thirds , яка видаляє зі списку кожен другий
і третій елементи:
```lisp
CL-USER> (remove-seconds-and-thirds '(a b c d e f g))
(A D G)
```
3. Написати функцію list-set-intersection , яка визначає перетин двох множин,
заданих списками атомів:
```lisp
CL-USER> (list-set-intersection '(1 2 3 4) '(3 4 5 6))
(3 4) ; порядок може відрізнятись
```
## Лістинг функції remove-seconds-and-thirds
```lisp
(defun remove-seconds-and-thirds (lst &optional (index 1))
  (if (null lst)
      nil
      (if (= (mod index 3) 1)
          (cons (car lst) (remove-seconds-and-thirds (cdr lst) (1+ index)))
          (remove-seconds-and-thirds (cdr lst) (1+ index))
      )
  )
)
```
### Тестові набори
```lisp
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
```
### Тестування
```lisp
passed... Task 1 test 1
passed... Task 1 test 2
passed... Task 1 test 3
passed... Task 1 test 4
passed... Task 1 test 5
passed... Task 1 test 6
```
## Лістинг функції list-set-intersection
```lisp
(defun list-set-intersection (a b bcons)
  (if (null a)
      nil
    (if (null b)
        (list-set-intersection (cdr a) bcons bcons)
      (if (= (car a) (car b))
          (cons (car a) (list-set-intersection (cdr a) bcons bcons))
        (list-set-intersection a (cdr b) bcons)
      )
    )
  )
)
```
### Тестові набори
```lisp
(defun check-list-set-intersection (name a b expected)
  (format t "~:[FAILED~;passed~]... ~a~%"
    (equal (list-set-intersection a b b) expected)
    name)
)

(check-list-set-intersection "Task 2 test1" '(3 4 2 7) '(3 4 5 6) '(3 4))
(check-list-set-intersection "Task 2 test2" '(1 2 3 4) '(4 5 6 7) '(4))
(check-list-set-intersection "Task 2 test3" '(5 6 7 3) '(3 7 4 3) '(7 3))
(check-list-set-intersection "Task 2 test4" '(9 2 3 1) '(1 2 3 9) '(9 2 3 1))
```
### Тестування
```lisp
passed... Task 2 test1
passed... Task 2 test2
passed... Task 2 test3
passed... Task 2 test4
```

