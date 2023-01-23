Задание
Из таблицы applicant, созданной на предыдущем шаге, удалить записи, если абитуриент на выбранную образовательную программу не набрал минимального балла хотя бы по одному предмету (использовать запрос из предыдущего урока).

Решение:
DELETE FROM applicant
WHERE (program_id, enrollee_id) IN 
    (
    SELECT DISTINCT program_id, enrollee_id
    FROM enrollee
    JOIN program_enrollee USING(enrollee_id)
    JOIN program USING(program_id)
    JOIN program_subject USING(program_id)
    JOIN enrollee_subject USING(subject_id, enrollee_id)
    WHERE result < min_result
    GROUP BY name_program, name_enrollee
    ORDER BY name_program);