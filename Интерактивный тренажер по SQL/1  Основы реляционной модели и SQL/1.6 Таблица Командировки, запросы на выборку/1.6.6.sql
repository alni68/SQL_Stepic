Задание
Вывести информацию о командировках во все города кроме Москвы и Санкт-Петербурга (фамилии и инициалы сотрудников, город ,  длительность командировки в днях, при этом первый и последний день относится к периоду командировки). Последний столбец назвать Длительность. Информацию вывести в упорядоченном по убыванию длительности поездки, а потом по убыванию названий городов (в обратном алфавитном порядке).

Решение:
SELECT name, city, DATEDIFF(date_last, date_first)+1 AS Длительность FROM trip
    WHERE city NOT IN ('Москва','Санкт-Петербург')
    ORDER BY Длительность DESC, city DESC;