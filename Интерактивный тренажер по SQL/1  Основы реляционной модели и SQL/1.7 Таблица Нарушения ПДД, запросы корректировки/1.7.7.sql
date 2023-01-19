Задание
Водители оплачивают свои штрафы. В таблице payment занесены даты их оплаты:

payment_id	name	number_plate	violation	date_violation	date_payment
1	Яковлев Г.Р.	М701АА	Превышение скорости(от 20 до 40)	2020-01-12	2020-01-22
2	Баранов П.Е.	Р523ВТ	Превышение скорости(от 40 до 60)	2020-02-14	2020-03-06
3	Яковлев Г.Р.	Т330ТТ	Проезд на запрещающий сигнал	2020-03-03	2020-03-23

Необходимо:
в таблицу fine занести дату оплаты соответствующего штрафа из таблицы payment; 
уменьшить начисленный штраф в таблице fine в два раза  
(только для тех штрафов, информация о которых занесена в таблицу payment), 
если оплата произведена не позднее 20 дней со дня нарушения.

Решение:
UPDATE fine, payment
SET fine.date_payment = payment.date_payment,
    fine.sum_fine = IF(DATEDIFF(payment.date_payment, fine.date_violation) <= 20, fine.sum_fine/2, fine.sum_fine)
WHERE fine.name = payment.name AND 
fine.number_plate=payment.number_plate AND 
fine.violation=payment.violation AND  
fine.date_payment IS NULL;
SELECT * FROM fine;