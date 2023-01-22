Задание
Количество тех книг на складе, которые были включены в заказ с номером 5, уменьшить на то количество, которое в заказе с номером 5  указано.

Решение:
UPDATE book
SET amount = 0 
WHERE title = 'Лирика';

UPDATE book 
SET amount = 4 
WHERE title = 'Белая гвардия';

SELECT * FROM book;