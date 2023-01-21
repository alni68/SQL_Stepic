Задание
Выбрать всех клиентов, которые заказывали книги Достоевского, информацию вывести в отсортированном по алфавиту виде. В решении используйте фамилию автора, а не его id.

Решение:
SELECT name_client
FROM client
    JOIN buy ON client.client_id = buy.client_id
    JOIN buy_book ON buy_book.buy_id = buy.buy_id
    JOIN book ON buy_book.book_id=book.book_id
    JOIN author ON book.author_id=author.author_id
WHERE author.name_author="Достоевский Ф.М."
GROUP BY name_client
ORDER BY name_client;