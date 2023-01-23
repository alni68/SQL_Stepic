Задание
Вывести образовательные программы, на которые для поступления необходим предмет «Информатика». Программы отсортировать в обратном алфавитном порядке.

Решение:
SELECT name_program 
FROM program 
JOIN program_subject USING(program_id)
WHERE subject_id='4'
ORDER BY name_program DESC;