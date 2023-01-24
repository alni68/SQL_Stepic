Задание
Автор - Лариса Фернандес

Для повышения успеваемости, предоставить возможность студентам снова пройти тестирование.

Для студентов, у которых количество попыток меньше 3 и максимальный балл < 70, в таблицу attempt добавить новые попытки по соответствующим предметам с текущей датой.

Решение:
INSERT attempt(student_id, subject_id, date_attempt, result)
SELECT student_id, subject_id, NOW(), NULL
FROM attempt
GROUP BY student_id, subject_id
HAVING COUNT(subject_id) < 3 AND MAX(result) < 70;