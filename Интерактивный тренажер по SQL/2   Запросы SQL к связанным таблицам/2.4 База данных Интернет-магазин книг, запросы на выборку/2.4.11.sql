Задание
В таблице city для каждого города указано количество дней, за которые заказ может быть доставлен в этот город (рассматривается только этап Транспортировка). Для тех заказов, которые прошли этап транспортировки, вывести количество дней за которое заказ реально доставлен в город. А также, если заказ доставлен с опозданием, указать количество дней задержки, в противном случае вывести 0. В результат включить номер заказа (buy_id), а также вычисляемые столбцы Количество_дней и Опоздание. Информацию вывести в отсортированном по номеру заказа виде.

Решение:
SELECT buy.buy_id, datediff(date_step_end,date_step_beg) AS 'Количество_дней', 
IF(
    DATEDIFF(date_step_end, date_step_beg) > days_delivery,
    DATEDIFF(date_step_end, date_step_beg)-days_delivery,
    0) AS 'Опоздание'
FROM buy 
JOIN client ON buy.client_id = client.client_id
JOIN city ON client.city_id = city.city_id
JOIN buy_step ON buy.buy_id = buy_step.buy_id
JOIN step ON buy_step.step_id = step.step_id
WHERE buy_step.step_id = 3 AND buy_step.date_step_end IS NOT NULL