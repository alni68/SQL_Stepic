Задание
В таблицу attempt включить новую попытку для студента Баранова Павла по дисциплине «Основы баз данных». Установить текущую дату в качестве даты выполнения попытки.

Решение:
INSERT INTO attempt (student_id, subject_id, date_attempt, result) 
VALUES (1, 2, NOW(), NULL);

SELECT * FROM attempt;