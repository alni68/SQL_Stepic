Задание
Реализовать поиск по ключевым словам. Вывести шаги, с которыми связаны ключевые слова MAX и AVG одновременно. Для шагов указать id модуля, позицию урока в модуле, позицию шага в уроке через точку, после позиции шага перед заголовком - пробел. Позицию шага в уроке вывести в виде двух цифр (если позиция шага меньше 10, то перед цифрой поставить 0). Столбец назвать Шаг. Информацию отсортировать по первому столбцу в алфавитном порядке.

Решение:
SELECT 
    concat_ws(' ',
        concat_ws('.', m.module_id, l.lesson_position, 
        IF(s.step_position < 10, concat(0,s.step_position), s.step_position)), 
        s.step_name) AS Шаг    
FROM module m 
    JOIN lesson l USING(module_id)
    JOIN step s USING(lesson_id)
    JOIN step_keyword sk USING (step_id)
WHERE keyword_id IN (
    SELECT keyword_id FROM keyword 
    WHERE instr(keyword_name, 'MAX') > 0)
ORDER BY 1;