Задание
Занесите три последние записи в таблицу book,  первая запись уже добавлена на предыдущем шаге:

book_id	title	author	price	amount
INT PRIMARY KEY AUTO_INCREMENT	VARCHAR(50)	VARCHAR(30)	DECIMAL(8,2)	INT
1	Мастер и Маргарита	Булгаков М.А.	670.99	3
2	Белая гвардия	Булгаков М.А.	540.50	5
3	Идиот	Достоевский Ф.М.	460.00	10
4	Братья Карамазовы	Достоевский Ф.М.	799.01	2

Решение:

INSERT INTO book (book_id, title, author, price, amount) VALUES (2, 'Белая гвардия', 'Булгаков М.А.', 540.50, 5);
INSERT INTO book (book_id, title, author, price, amount) VALUES (3, 'Идиот', 'Достоевский Ф.М.', 460.00, 10);
INSERT INTO book (book_id, title, author, price, amount) VALUES (4, 'Братья Карамазовы', 'Достоевский Ф.М.', 799.01, 2);