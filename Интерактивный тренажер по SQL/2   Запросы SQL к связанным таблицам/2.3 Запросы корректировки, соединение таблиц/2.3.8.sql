Удаление записей, использование связанных таблиц

Задание
Удалить всех авторов, которые пишут в жанре "Поэзия". Из таблицы book удалить все книги этих авторов. В запросе для отбора авторов использовать полное название жанра, а не его id.

Решение:
DELETE author
FROM author 
INNER JOIN ( 
    SELECT author_id
    FROM book
    INNER JOIN genre ON book.genre_id = genre.genre_id
    WHERE genre.name_genre = 'Поэзия') AS s ON author.author_id = s.author_id;
    
SELECT * FROM author;
SELECT * FROM book;