Задание
Вывести информацию о книгах (автор, название, цена), цена которых меньше самой большой из минимальных цен, вычисленных для каждого автора.

Решение:
SELECT author, title, price 
FROM book
WHERE price < ANY
              (SELECT min(price)
               FROM book
               GROUP BY author);