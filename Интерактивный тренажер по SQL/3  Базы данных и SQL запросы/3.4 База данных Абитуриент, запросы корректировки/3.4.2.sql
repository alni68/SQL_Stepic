Задание
Создать вспомогательную таблицу applicant,  куда включить id образовательной программы, id абитуриента, сумму баллов абитуриентов (столбец itog) в отсортированном сначала по id образовательной программы, а потом по убыванию суммы баллов виде (использовать запрос из предыдущего урока).

Решение:
CREATE TABLE applicant AS
SELECT program_id, enrollee_id, sum(result) AS itog
FROM enrollee
JOIN program_enrollee USING(enrollee_id)
JOIN program USING(program_id)
JOIN program_subject USING(program_id)
JOIN enrollee_subject USING (subject_id, enrollee_id)
GROUP BY program_id, enrollee_id
ORDER BY program_id, itog DESC;