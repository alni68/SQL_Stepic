Задание
Вывести образовательные программы, на которые для поступления необходимы предмет «Информатика» и «Математика» в отсортированном по названию программ виде.

Решение:
SELECT name_program
FROM program 
JOIN program_subject USING(program_id)
JOIN subject USING(subject_id)
WHERE name_subject IN ('Информатика','Математика')
GROUP BY name_program
HAVING count(name_subject)= 2
ORDER BY name_program;