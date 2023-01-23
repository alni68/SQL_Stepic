Задание
Вывести образовательные программы, которые имеют самый большой план набора,  вместе с этой величиной.

Решение:
SELECT name_program,  plan 
FROM program 
GROUP BY name_program, plan
HAVING plan=(
    SELECT MAX(plan) 
    FROM program);