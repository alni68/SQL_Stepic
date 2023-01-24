Задание
Вычислить прогресс пользователей по курсу. Прогресс вычисляется как отношение верно пройденных шагов к общему количеству шагов в процентах, округленное до целого. В нашей базе данные о решениях занесены не для всех шагов, поэтому общее количество шагов определить как количество различных шагов в таблице step_student.
Тем пользователям, которые прошли все шаги (прогресс = 100%) выдать "Сертификат с отличием". Тем, у кого прогресс больше или равен 80% - "Сертификат". Для остальных записей в столбце Результат задать пустую строку ("").
Информацию отсортировать по убыванию прогресса, затем по имени пользователя в алфавитном порядке.

Решение:
SET @max = (SELECT COUNT(DISTINCT step_id) FROM step_student);

WITH table_result(s_n, result_student)
    AS (
    SELECT student_name, ROUND(COUNT(DISTINCT step_id) / @max * 100)
    FROM student JOIN step_student USING(student_id)
    WHERE result = "correct"
    GROUP BY student_name
    ORDER BY 2 DESC
    )
SELECT s_n AS Студент, result_student AS Прогресс,
    CASE
        WHEN result_student < 80 THEN ''
        WHEN result_student BETWEEN 80 AND 99 THEN 'Сертификат'
        ELSE 'Сертификат с отличием'
    END AS Результат
FROM table_result
ORDER BY 2 DESC, 1;