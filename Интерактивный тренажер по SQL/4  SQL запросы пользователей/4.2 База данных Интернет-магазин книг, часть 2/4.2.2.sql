Задание
автор - Анатолий Алексеев

Вывести жанр(ы), в котором было заказано меньше всего экземпляров книг, указать это количество. Учитывать только жанры, в которых была заказана хотя бы одна книга.
При реализации в основном запросе не используйте LIMIT, поскольку жанров с минимальным количеством заказанных книг может быть несколько.

Решение:
SELECT MIN(name_genre) name_genre, MIN(sumam) Количество
FROM (
    SELECT name_genre, SUM(buy_book.amount) sumam
    FROM genre
        JOIN book USING(genre_id)
        JOIN buy_book USING(book_id)
    GROUP BY name_genre
    ) genre_sumam;