Задание
Создать новую таблицу back_payment, куда внести информацию о неоплаченных штрафах (Фамилию и инициалы водителя, номер машины, нарушение, сумму штрафа  и  дату нарушения) из таблицы fine.

Решение:
CREATE TABLE back_payment AS (
    SELECT name, number_plate, violation, sum_fine, date_violation
    FROM fine AS f
    WHERE f.date_payment IS NULL
);
SELECT * FROM back_payment;