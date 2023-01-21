Каскадное удаление записей связанных таблиц

Задание
Удалить всех авторов и все их книги, общее количество книг которых меньше 20.

Решение:
CREATE TABLE temp AS (SELECT author_id
                 FROM book 
                 GROUP BY book.author_id
                 HAVING SUM(book.amount)<20);

DELETE FROM author
WHERE author_id IN (SELECT * FROM temp);

SELECT * FROM author;

SELECT * FROM book;