Задание
Вывести информацию о командировках сотрудника(ов), которые были самыми короткими по времени. В результат включить столбцы name, city, date_first, date_last.

Решение:
SELECT name, city, date_first, date_last FROM trip
WHERE 
    (SELECT DATEDIFF(date_last, date_first)) = (SELECT MIN(DATEDIFF(date_last,date_first)) FROM trip);