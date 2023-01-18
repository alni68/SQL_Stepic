Добавление записей, вложенные запросы

Задание
Занести из таблицы supply в таблицу book только те книги, авторов которых нет в  book.

Решение:
INSERT INTO book (title, author, price, amount) 
       SELECT title, author, price, amount 
       FROM supply
       WHERE author NOT IN (SELECT author from book);

SELECT * FROM book;