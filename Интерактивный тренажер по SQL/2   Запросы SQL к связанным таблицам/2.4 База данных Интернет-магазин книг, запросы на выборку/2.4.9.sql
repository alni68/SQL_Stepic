Задание
Вывести информацию о каждом заказе: его номер, кто его сформировал (фамилия пользователя) и его стоимость (сумма произведений количества заказанных книг и их цены), в отсортированном по номеру заказа виде. Последний столбец назвать Стоимость.

Решение:
SELECT buy_id, name_client, sum(book.price*buy_book.amount) AS Стоимость
FROM buy_book
JOIN buy USING(buy_id)
JOIN client USING(client_id)
JOIN book USING(book_id)
GROUP BY buy_id, name_client
ORDER BY buy_id;