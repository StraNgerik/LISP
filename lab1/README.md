<p align="center"><b>МОНУ НТУУ КПІ ім. Ігоря Сікорського ФПМ СПіСКС</b></p>
<p align="center">
<b>Звіт з лабораторної роботи 1</b>
<p align="center">
<br>"Обробка списків з використанням базових функцій"</br>
з дисципліни "Вступ до функціонального програмування"
</p>

<div style="display: flex; justify-content: flex-end;">
  <div style="border: 0px; padding: 10px;">
    <p>Студент: Бичко Кирило</p>
    <p>Група: КВ-12</p>
    <p>Рік: 2024</p>
  </div>
</div>


## Загальне завдання
1. Створіть список з п'яти елементів, використовуючи функції LIST і CONS . Форма створення списку має бути одна — використання SET чи SETQ (або інших допоміжних форм) для збереження проміжних значень не допускається. Загальна кількість елементів (включно з підсписками та їх елементами) не має перевищувати 10-12 шт. (дуже великий список робити не потрібно). Збережіть створений список у якусь змінну з SET або SETQ . Список має містити (напряму або у підсписках): 
* хоча б один символ 
* хоча б одне число 
* хоча б один не пустий підсписок
* хоча б один пустий підсписок 
2. Отримайте голову списку. 
3. Отримайте хвіст списку. 
4. Отримайте третій елемент списку. 
5. Отримайте останній елемент списку. 
6. Використайте предикати ATOM та LISTP на різних елементах списку (по 2-3 приклади для кожної функції). 
7. Використайте на елементах списку 2-3 інших предикати з розглянутих у розділі 4 навчального посібника. 
8. Об'єднайте створений список з одним із його непустих підсписків. Для цього використайте функцію APPEND. 


```lisp
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
```
## Завдання за варіантом №2
Створіть список, що відповідає структурі списку, наведеній на рисунку (за варіантом). Для цього допускається використання не більше двох форм. Номер варіанту обирається як номер у списку групи, який надсилає викладач на початку семестру (на випадок, якщо протягом семестру стануться зміни в складі групи), за модулем 8: 1 -> 1, 2 - > 2, ..., 9 -> 1, 10 -> 2, ... 
Примітка: на рисунках однакові імена символів можуть бути позначені в кількох місцях, проте, загалом, вони позначають один і той самий символ. 
<p align="center">
<img src="var2.png">
</p>

```lisp
(let ((x (list "A" 2 1)))
    (print (list x "B" (cdr x) "C"))
)
```

## Результат виконання програми
```
; task 1
(Z 4 (V 6) NIL)
; task 2
Z
; task 3
(4 (V 6) NIL)
; task 4
(V 6)
; task 5
NIL
; task 6
NIL 
T 
T
NIL 
T 
T
; task 7
T 
T
; task 8
(Z 4 (V 6) NIL V 6)
; task variant 2
(("A" 2 1) "B" (2 1) "C")
```
