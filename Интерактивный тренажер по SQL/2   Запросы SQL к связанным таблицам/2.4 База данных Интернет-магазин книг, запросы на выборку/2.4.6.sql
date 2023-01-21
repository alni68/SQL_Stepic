Задание
Посчитать, сколько раз была заказана каждая книга, для книги вывести ее автора (нужно посчитать, в каком количестве заказов фигурирует каждая книга).  Вывести фамилию и инициалы автора, название книги, последний столбец назвать Количество. Результат отсортировать сначала  по фамилиям авторов, а потом по названиям книг.

Решение:
SELECT name_author, title, count(buy_book.amount) AS Количество 
FROM book 
JOIN author ON book.author_id=author.author_id
LEFT JOIN buy_book ON book.book_id=buy_book.book_id
GROUP BY name_author, title
ORDER BY name_author, title