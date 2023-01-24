Задание
Заполнить таблицу step_keyword следующим образом: если ключевое слово есть в названии шага, то включить в step_keyword строку с id шага и id ключевого слова. 

Решение:
INSERT INTO step_keyword (step_id, keyword_id)
SELECT step_id, keyword_id
FROM keyword CROSS JOIN step
WHERE regexp_instr(step_name, concat('\\b', keyword_name, '\\b'));