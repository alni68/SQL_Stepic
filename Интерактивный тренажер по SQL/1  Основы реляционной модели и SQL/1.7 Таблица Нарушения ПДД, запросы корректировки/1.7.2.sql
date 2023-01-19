Задание
Создать таблицу fine следующей структуры:

Поле	Описание
fine_id	ключевой столбец целого типа с автоматическим увеличением значения ключа на 1
name	строка длиной 30
number_plate	строка длиной 6
violation	строка длиной 50
sum_fine	вещественное число, максимальная длина 8, количество знаков после запятой 2
date_violation	дата
date_payment	дата

Решение:
CREATE TABLE fine
    (
    fine_id int primary key auto_increment,
    name varchar(30),
    number_plate varchar(6),
    violation varchar(30),
    sum_fine decimal(8,2),
    date_violation date,
    date_payment date
);