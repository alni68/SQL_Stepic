Запросы на выборку из нескольких таблиц

Задание
 Вывести информацию о книгах (жанр, книга, автор), относящихся к жанру, включающему слово «роман» в отсортированном по названиям книг виде.

 Решение:
SELECT name_genre, title, name_author 
FROM
    book 
    INNER JOIN author ON author.author_id = book.author_id
    INNER JOIN genre ON genre.genre_id = book.genre_id
WHERE name_genre='роман'
ORDER BY title;