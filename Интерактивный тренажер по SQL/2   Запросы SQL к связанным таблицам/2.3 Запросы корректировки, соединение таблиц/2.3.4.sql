Запрос на добавление, связанные таблицы

Задание
Добавить новые книги из таблицы supply в таблицу book на основе сформированного выше запроса. Затем вывести для просмотра таблицу book.

Решение:
INSERT INTO book(title, author_id, price, amount) 
SELECT title, author_id, price, amount
FROM 
    author 
    INNER JOIN supply ON author.name_author = supply.author
WHERE amount <> 0;