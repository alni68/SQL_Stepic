Задание
Вывести фамилию с инициалами и общую сумму суточных, полученных за все командировки для тех сотрудников, которые были в командировках больше чем 3 раза, в отсортированном по убыванию сумм суточных виде. Последний столбец назвать Сумма.
Только для этого задания изменена строка таблицы trip:

Решение:
SELECT name, SUM(DATEDIFF(date_last, date_first-1)*per_diem) AS Сумма
FROM trip
WHERE name IN (SELECT name 
    FROM trip 
    GROUP BY name 
    HAVING COUNT(name)>3)
GROUP BY name
ORDER BY Сумма DESC;