Задание
Вывести номера заказов (buy_id) и названия этапов,  на которых они в данный момент находятся. Если заказ доставлен –  информацию о нем не выводить. Информацию отсортировать по возрастанию buy_id.

Решение:
SELECT buy_id, name_step
FROM step 
JOIN buy_step ON step.step_id = buy_step.step_id
WHERE date_step_beg IS NOT NULL AND date_step_end IS NULL
ORDER BY buy_id;