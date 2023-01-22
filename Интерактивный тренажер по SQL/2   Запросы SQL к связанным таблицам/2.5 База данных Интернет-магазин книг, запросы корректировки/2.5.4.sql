Задание
В таблицу buy_book добавить заказ с номером 5. Этот заказ должен содержать книгу Пастернака «Лирика» в количестве двух экземпляров и книгу Булгакова «Белая гвардия» в одном экземпляре.

Решение:
INSERT INTO buy_book (buy_id, book_id, amount)
SELECT '5', (SELECT book_id FROM book WHERE title = 'Лирика' AND author_id = (SELECT author_id FROM author WHERE name_author = 'Пастернак Б.Л.')),'2'
FROM book
WHERE title = 'Лирика';
INSERT INTO buy_book (buy_id, book_id, amount)
SELECT '5', (SELECT book_id FROM book WHERE title = 'Белая гвардия' AND author_id = (SELECT author_id FROM author WHERE name_author LIKE 'Булгаков%')),'1' 
FROM book
WHERE title = 'Белая гвардия';
SELECT * FROM buy_book;