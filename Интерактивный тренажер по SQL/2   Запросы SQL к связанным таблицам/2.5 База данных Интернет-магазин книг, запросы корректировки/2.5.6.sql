Задание
Создать счет (таблицу buy_pay) на оплату заказа с номером 5, в который включить название книг, их автора, цену, количество заказанных книг и  стоимость. Последний столбец назвать Стоимость. Информацию в таблицу занести в отсортированном по названиям книг виде.

Решение:
CREATE TABLE buy_pay AS 
SELECT book.title, author.name_author, price,buy_book.amount, ROUND(buy_book.amount*price,2) AS 'Стоимость'
FROM buy_book
JOIN book USING (book_id)
JOIN author USING (author_id)
WHERE buy_book.buy_id = 5
ORDER BY book.title;