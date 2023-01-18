Задание
Вычислить среднюю цену и суммарную стоимость тех книг, количество экземпляров которых принадлежит интервалу от 5 до 14, включительно. Столбцы назвать Средняя_цена и Стоимость, значения округлить до 2-х знаков после запятой.

Решение:
SELECT ROUND(AVG(price), 2) AS Средняя_цена, 
       SUM(price*amount) AS Стоимость 
FROM book
WHERE amount BETWEEN 5 AND 14;