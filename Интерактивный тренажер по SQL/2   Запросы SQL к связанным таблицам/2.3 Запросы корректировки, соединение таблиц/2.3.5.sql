Запрос на обновление, вложенные запросы

Задание
Занести для книги «Стихотворения и поэмы» Лермонтова жанр «Поэзия», а для книги «Остров сокровищ» Стивенсона - «Приключения». (Использовать два запроса).

Решение:
UPDATE book
SET genre_id =2
WHERE book_id = 10;

UPDATE book
SET genre_id =3
WHERE book_id = 11;

SELECT * FROM book;
