Задание
Вывести вопросы, которые были включены в тест для Семенова Ивана по дисциплине «Основы SQL» 2020-05-17  (значение attempt_id для этой попытки равно 7). Указать, какой ответ дал студент и правильный он или нет (вывести Верно или Неверно). В результат включить вопрос, ответ и вычисляемый столбец  Результат.

Решение:
SELECT name_question, name_answer, IF(is_correct=0, 'Неверно', 'Верно') AS Результат 
FROM testing
JOIN answer ON testing.answer_id=answer.answer_id
JOIN question ON testing.question_id=question.question_id
WHERE attempt_id=7;