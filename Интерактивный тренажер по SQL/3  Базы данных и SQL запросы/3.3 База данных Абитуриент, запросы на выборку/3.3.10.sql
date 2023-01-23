Задание
Посчитать количество баллов каждого абитуриента на каждую образовательную программу, на которую он подал заявление, по результатам ЕГЭ. В результат включить название образовательной программы, фамилию и имя абитуриента, а также столбец с суммой баллов, который назвать itog. Информацию вывести в отсортированном сначала по образовательной программе, а потом по убыванию суммы баллов виде.

Решение:
SELECT name_program, name_enrollee, sum(result) AS itog
FROM enrollee
JOIN program_enrollee USING(enrollee_id)
JOIN program USING(program_id)
JOIN program_subject USING(program_id)
JOIN enrollee_subject USING (subject_id,enrollee_id)
GROUP BY name_program,name_enrollee
ORDER BY name_program,itog DESC;