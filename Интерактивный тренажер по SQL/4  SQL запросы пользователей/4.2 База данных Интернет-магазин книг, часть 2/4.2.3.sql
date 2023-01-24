Задание
автор - Артём Чепк 

Создать новую таблицу store, в которую занести данные из таблиц book и supply, при условии, что количество книг будет больше среднего количества книг по двум таблицам; если книга есть в обеих таблицах, то стоимость выбрать большую из двух. Отсортировать данные из таблицы их по имени автора в алфавитном порядке и по убыванию цены. Вывести данные из полученной таблицы.

Решение:
SET @cou := (SELECT ROUND(SUM(amount) / COUNT(amount), 2)
                FROM (SELECT price, amount
                FROM book 
                UNION 
                SELECT price, amount
                FROM supply) test
            );            

CREATE TABLE store AS
WITH test(title, author, price, amount) AS
    (
    SELECT title, author, price, amount
    FROM book
    UNION ALL
    SELECT title, author, price, amount
    FROM supply
    )
SELECT title, author, MAX(price) AS price, SUM(amount) AS amount
FROM test
GROUP BY author, title
HAVING SUM(amount) > @cou
ORDER BY author, price DESC;

SELECT * FROM store