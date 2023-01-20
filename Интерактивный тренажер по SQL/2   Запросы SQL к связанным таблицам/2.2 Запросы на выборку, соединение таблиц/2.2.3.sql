Внешнее соединение LEFT и RIGHT OUTER JOIN

Задание
Вывести все жанры, которые не представлены в книгах на складе.

Решение:
SELECT name_genre   
FROM 
    genre LEFT JOIN book
    ON genre.genre_id = book.genre_id 
    WHERE book.genre_id is NULL;