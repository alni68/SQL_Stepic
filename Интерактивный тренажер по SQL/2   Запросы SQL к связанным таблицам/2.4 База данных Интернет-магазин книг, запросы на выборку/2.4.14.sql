Задание
Этот шаг добавлен по рекомендациям пользователей: Тимур Timmmyyy, Todor Illia, Лёха Last name, Игорь Владимирович Лапшин и др.
Сравнить ежемесячную выручку от продажи книг за текущий и предыдущий годы. Для этого вывести год, месяц, сумму выручки в отсортированном сначала по возрастанию месяцев, затем по возрастанию лет виде. Название столбцов: Год, Месяц, Сумма.

Решение:
SELECT YEAR(date_step_end) AS 'Год',
       MONTHNAME(date_step_end) AS 'Месяц',
       SUM(book.price*buy_book.amount) AS 'Сумма'
FROM buy_step
JOIN buy_book USING(buy_id)
JOIN book USING(book_id)
WHERE step_id = 1 AND date_step_end IS NOT NULL
GROUP BY YEAR(date_step_end),
         MONTHNAME(date_step_end)
UNION ALL
SELECT YEAR(date_payment),
       MONTHNAME(date_payment),
       SUM(price*amount)
FROM buy_archive
GROUP BY YEAR(date_payment),
         MONTHNAME(date_payment)
ORDER BY 2,1;