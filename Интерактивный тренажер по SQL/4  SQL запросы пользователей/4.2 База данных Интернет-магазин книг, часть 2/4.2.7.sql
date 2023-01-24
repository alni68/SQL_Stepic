 Задание
автор - Сатурова Инна

На распродаже размер скидки устанавливается в зависимости от количества экземпляров книги в магазине и от цены книги: для книг в остатке не менее 5 шт скидка 50%, тогда как для книг в остатке менее 5 шт скидка устанавливается в зависимости от цены (на книги не дешевле 700 руб скидка 20%, на остальные 10%). Два последних столбца назвать Скидка и Цена_со_скидкой.  Последний столбец округлить до двух знаков после запятой.

Решение:
SELECT author, title, amount, price,
    CASE
        WHEN amount >= 5 THEN '50%'
        WHEN price >= 700 THEN '20%'
        ELSE '10%' 
        END AS Скидка, CASE
            WHEN amount >= 5 THEN ROUND(price * 0.5, 2)
            WHEN price >= 700 THEN ROUND(price * 0.8, 2)
            ELSE ROUND(price * 0.9, 2)
            END AS Цена_со_скидкой
FROM book;