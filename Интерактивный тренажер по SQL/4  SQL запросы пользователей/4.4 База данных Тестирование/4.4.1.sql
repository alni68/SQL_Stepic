Задание
Автор - Лариса Фернандес

Найти вопрос, с самой большой успешностью выполнения - "самый легкий" и вопрос, с самой маленькой успешностью выполнения - "самый сложный".  (Подробно про успешность на этом шаге). Вывести предмет, эти два вопроса и указание - самый сложный или самый легкий это вопрос. Сначала вывести самый легкий запроса, потом самый сложный.

Решение:
SET @mn = (SELECT SUM(is_correct) / COUNT(is_correct) * 100
           FROM subject 
               JOIN question USING(subject_id)
               JOIN testing USING(question_id)
           LEFT JOIN answer USING(answer_id)
           GROUP BY name_subject, name_question
           ORDER BY 1
           LIMIT 1);
          
SET @mx = (SELECT SUM(is_correct) / COUNT(is_correct) * 100
           FROM subject 
               JOIN question USING(subject_id)
               JOIN testing USING(question_id)
           LEFT JOIN answer USING(answer_id)
           GROUP BY name_subject, name_question
           ORDER BY 1 DESC
           LIMIT 1);

SELECT name_subject, 
    name_question, 
    IF(SUM(is_correct) / COUNT(is_correct) * 100 = @mx, 
    'самый легкий', 'самый сложный') AS Сложность 
FROM subject 
    JOIN question USING(subject_id)
    JOIN testing USING(question_id)
    LEFT JOIN answer USING(answer_id)
GROUP BY name_subject, name_question
HAVING SUM(is_correct) / COUNT(is_correct) * 100 = @mn OR SUM(is_correct) / COUNT(is_correct) * 100 = @mx
ORDER BY SUM(is_correct) / COUNT(is_correct) * 100 DESC;