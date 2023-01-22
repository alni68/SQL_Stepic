Задание
Вывести студентов (различных студентов), имеющих максимальные результаты попыток. Информацию отсортировать в алфавитном порядке по фамилии студента.
Максимальный результат не обязательно будет 100%, поэтому явно это значение в запросе не задавать.

Решение:
SELECT name_student, result 
FROM attempt 
JOIN student ON attempt.student_id=student.student_id
WHERE result IN (SELECT 
    MAX(result) 
    FROM attempt)
GROUP BY name_student, result
ORDER BY name_student;
