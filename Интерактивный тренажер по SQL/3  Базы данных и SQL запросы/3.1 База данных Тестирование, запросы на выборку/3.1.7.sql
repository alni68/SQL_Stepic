Задание
Случайным образом отберите 3 вопроса по дисциплине «Основы баз данных». В результат включите столбцы question_id и name_question.

Решение:
SELECT question_id, name_question 
FROM question 
JOIN subject ON question.subject_id=subject.subject_id
WHERE subject.subject_id='2'
ORDER BY RAND()
LIMIT 3;