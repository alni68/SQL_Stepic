Задание
Вывести студентов, которые сдавали дисциплину «Основы баз данных», указать дату попытки и результат. Информацию вывести по убыванию результатов тестирования.

Решение:
SELECT name_student, date_attempt, result 
FROM attempt
JOIN student ON attempt.student_id=student.student_id 
WHERE subject_id ='2'
ORDER BY result DESC;