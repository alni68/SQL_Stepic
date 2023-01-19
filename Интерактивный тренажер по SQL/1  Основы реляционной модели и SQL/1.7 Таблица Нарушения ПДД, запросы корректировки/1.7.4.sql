Использование временного имени таблицы (алиаса)

Задание
Занести в таблицу fine суммы штрафов, которые должен оплатить водитель, в соответствии с данными из таблицы traffic_violation. 
При этом суммы заносить только в пустые поля столбца  sum_fine.
Таблица traffic_violationсоздана и заполнена.
Важно! Сравнение значения столбца с пустым значением осуществляется с помощью оператора IS NULL.

Решение:
UPDATE fine, traffic_violation AS tv
SET fine.sum_fine=tv.sum_fine
WHERE (fine.sum_fine IS NULL) AND fine.violation=tv.violation;
SELECT * FROM fine;