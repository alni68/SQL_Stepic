Добавление записей в таблицу

Задание
Занесите в таблицу supply четыре записи, чтобы получилась следующая таблица:

supply_id	title	author	price	amount
1	Лирика	Пастернак Б.Л.	518.99	2
2	Черный человек 	Есенин С.А.	570.20	6
3	Белая гвардия	Булгаков М.А.	540.50	7
4	Идиот	Достоевский Ф.М.	360.80	3

Решение:
INSERT INTO supply (title, author, price, amount) 
VALUES ('Лирика', 'Пастернак Б.Л.', 518.99, 2);
INSERT INTO supply (title, author, price, amount) 
VALUES ('Черный человек', 'Есенин С.А.', 570.20, 6);
INSERT INTO supply (title, author, price, amount) 
VALUES ('Белая гвардия', 'Булгаков М.А.', 540.50, 7);
INSERT INTO supply (title, author, price, amount) 
VALUES ('Идиот', 'Достоевский Ф.М.', 360.80, 3);