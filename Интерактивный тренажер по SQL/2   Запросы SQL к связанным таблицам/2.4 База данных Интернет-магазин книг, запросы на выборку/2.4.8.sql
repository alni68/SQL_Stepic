Задание
Вывести номера всех оплаченных заказов и даты, когда они были оплачены.

Решение:
SELECT buy_id, date_step_end
FROM buy_step 
WHERE buy_step.step_id = 1 AND date_step_end IS NOT NULL;