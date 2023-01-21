Задание 
Вывести города, в которых живут клиенты, оформлявшие заказы в интернет-магазине. Указать количество заказов в каждый город, этот столбец назвать Количество. Информацию вывести по убыванию количества заказов, а затем в алфавитном порядке по названию городов.

Решение:
SELECT name_city, COUNT(buy_id) AS 'Количество' 
FROM city
JOIN client ON city.city_id = client.city_id
JOIN buy ON client.client_id = buy.client_id
GROUP BY city.name_city
ORDER BY Количество DESC, name_city;