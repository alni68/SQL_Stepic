Задание
автор - Артём Чепк

Вывести авторов, у которых есть книги со стоимостью более 500 и количеством более 1 шт на складе. Учитывать книги только тех авторов, у которых не менее 2-х произведений на складе. Вывести автора, количество различных произведений автора, минимальную цену и количество книг на складе. Информацию отсортировать по фамилии автора в алфавитном порядке.

Решение:
SELECT author, COUNT(title) AS Количество_произведений, 
       MIN(price) AS Минимальная_цена, SUM(amount) AS Число_книг 
FROM book
GROUP BY author
HAVING COUNT(title)>1
ORDER BY author;