Задание
Вывести абитуриентов, которые хотят поступать на образовательную программу «Мехатроника и робототехника» в отсортированном по фамилиям виде.

Решение:
SELECT name_enrollee FROM enrollee
JOIN program_enrollee ON enrollee.enrollee_id=program_enrollee.enrollee_id 
WHERE program_id='4'
ORDER BY name_enrollee;