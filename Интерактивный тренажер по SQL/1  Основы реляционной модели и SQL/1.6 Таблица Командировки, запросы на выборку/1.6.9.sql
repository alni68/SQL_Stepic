Задание
Вывести название месяца и количество командировок для каждого месяца. Считаем, что командировка относится к некоторому месяцу, если она началась в этом месяце. Информацию вывести сначала в отсортированном по убыванию количества, а потом в алфавитном порядке по названию месяца виде. Название столбцов – Месяц и Количество.

Решение:
SELECT MONTHNAME(date_first ) AS 'Месяц', COUNT(date_first) AS 'Количество' 
FROM trip
GROUP BY 1 
ORDER BY 2 desc, 1;