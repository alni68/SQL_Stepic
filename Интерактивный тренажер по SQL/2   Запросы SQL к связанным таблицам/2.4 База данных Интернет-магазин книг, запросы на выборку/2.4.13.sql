Задание
Вывести жанр (или жанры), в котором было заказано больше всего экземпляров книг, указать это количество. Последний столбец назвать Количество.

Решение:
SELECT name_genre, sum(buy_book.amount) AS Количество
FROM genre
    JOIN book USING(genre_id)
    JOIN buy_book USING(book_id)
GROUP BY name_genre
LIMIT 1;