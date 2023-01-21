Удаление записей главной таблицы с сохранением записей в зависимой

Задание
Удалить все жанры, к которым относится меньше 4-х книг. В таблице book для этих жанров установить значение Null.

Решение:
DELETE FROM genre
WHERE genre_id =(
    SELECT genre_id
    FROM book
    GROUP BY genre_id
    HAVING count(amount) < 4 );
    
SELECT * FROM genre;
SELECT * FROM book;