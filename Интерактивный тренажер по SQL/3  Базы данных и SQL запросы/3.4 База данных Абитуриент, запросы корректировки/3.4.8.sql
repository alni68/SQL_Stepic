Задание
Создать таблицу student,  в которую включить абитуриентов, которые могут быть рекомендованы к зачислению  в соответствии с планом набора. Информацию отсортировать сначала в алфавитном порядке по названию программ, а потом по убыванию итогового балла.

Решение:
create table student as
select program.name_program, enrollee.name_enrollee, applicant_order.itog 
from applicant_order
join program using (program_id)
join enrollee using (enrollee_id)
where applicant_order.str_id <= program.plan
order by 1,  3 desc;