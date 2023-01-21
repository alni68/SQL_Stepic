Запросы на основе трех и более связанных таблиц

Задание
Вывести все заказы Баранова Павла (id заказа, какие книги, по какой цене и в каком количестве он заказал) в отсортированном по номеру заказа и названиям книг виде.

Решение:
SELECT buy_book.buy_id, title, price, buy_book.amount
FROM 
    client
    INNER JOIN buy ON client.client_id = buy.client_id
    INNER JOIN buy_book ON buy_book.buy_id = buy.buy_id
    INNER JOIN book ON buy_book.book_id=book.book_id
where client.client_id = 1
GROUP BY buy_id, title, price, amount
ORDER BY buy_id, title