Запросы на удаление

Задание
Удалить из таблицы supply книги тех авторов, общее количество экземпляров книг которых в таблице book превышает 10.

Решение:
DELETE FROM supply 
WHERE author  IN (
    SELECT  author
    FROM book
    WHERE author = ANY(SELECT author 
        FROM book  
        GROUP BY author 
        HAVING SUM(amount) > 10)
    );