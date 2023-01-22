Задание
Завершить этап «Оплата» для заказа с номером 5, вставив в столбец date_step_end дату 13.04.2020, и начать следующий этап («Упаковка»), задав в столбце date_step_beg для этого этапа ту же дату.
Реализовать два запроса для завершения этапа и начала следующего. Они должны быть записаны в общем виде, чтобы его можно было применять для любых этапов, изменив только текущий этап. Для примера пусть это будет этап «Оплата».

Решение:
UPDATE buy_step, step
SET buy_step.date_step_end = '2020-04-13'
WHERE buy_step.step_id = (SELECT step_id FROM step WHERE step.name_step = 'Оплата') AND buy_id = 5
;
UPDATE buy_step, step
SET buy_step.date_step_beg = '2020-04-13'
WHERE buy_step.step_id = (SELECT step_id +1 FROM step WHERE step.name_step = 'Оплата') AND buy_id = 5
;
SELECT * FROM buy_step
WHERE buy_id = 5;