Задание
автор - Москвин Павел

Вывести авторов и названия книг и их цену в двух столбцах - рубли и копейки.  Информацию отсортировать по убыванию копеек. 

Решение:
SELECT author, title, TRUNCATE(price, 0) AS Рубли, ROUND((price - TRUNCATE(price, 0))*100) AS Копейки
FROM book
ORDER BY ROUND((price - TRUNCATE(price, 0))*100) DESC;