Задание
Для каждой отдельной книги необходимо вывести информацию о количестве проданных экземпляров и их стоимости за 2020 и 2019 год . Вычисляемые столбцы назвать Количество и Сумма. Информацию отсортировать по убыванию стоимости.

Решение:
SELECT title, SUM(Количество) AS 'Количество', SUM(Сумма) AS 'Сумма'
FROM
    (select title, SUM(buy_archive.amount) AS 'Количество', sum(buy_archive.price*buy_archive.amount) AS 'Сумма' 
        FROM buy_archive
        JOIN book USING(book_id)
        GROUP BY title
    UNION ALL
    SELECT title, SUM(buy_book.amount) AS 'Количество', SUM(price*buy_book.amount) AS 'Сумма' 
        FROM book
        JOIN buy_book USING(book_id)
        JOIN buy_step USING(buy_id)
        JOIN step USING(step_id)
    WHERE step.name_step = 'Оплата' AND buy_step.date_step_end IS NOT NULL
    GROUP BY title) AS query_in
GROUP BY title
ORDER BY Сумма DESC;