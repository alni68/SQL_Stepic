Задание
Для студента с именем student_59 вывести следующую информацию по всем его попыткам:

информация о шаге: номер модуля, символ '.', позиция урока в модуле, символ '.', позиция шага в модуле;
порядковый номер попытки для каждого шага - определяется по возрастанию времени отправки попытки;
результат попытки;
время попытки (преобразованное к формату времени) - определяется как разность между временем отправки попытки и времени ее начала, в случае если попытка длилась более 1 часа, то время попытки заменить на среднее время всех попыток пользователя по всем шагам без учета тех, которые длились больше 1 часа;
относительное время попытки  - определяется как отношение времени попытки (с учетом замены времени попытки) к суммарному времени всех попыток  шага, округленное до двух знаков после запятой  .
Столбцы назвать  Студент,  Шаг, Номер_попытки, Результат, Время_попытки и Относительное_время. Информацию отсортировать сначала по возрастанию id шага, а затем по возрастанию номера попытки (определяется по времени отправки попытки).

Важно. Все вычисления производить в секундах, округлять и переводить во временной формат только для вывода результата.

Решение:
WITH
average_time AS
(
    SELECT student_name AS Студент, AVG(submission_time - attempt_time) AS average_time
    FROM student
    LEFT JOIN step_student USING(student_id)
    WHERE submission_time - attempt_time <= 3600 AND student_name = 'student_59'
    GROUP BY student_name
),
all_data AS
(
    SELECT student_name AS Студент, step_id,
        CONCAT(module_id, '.', lesson_position, '.', step_position) AS Шаг,
        result AS Результат,
        ROW_NUMBER() OVER (PARTITION BY step_id ORDER BY submission_time ASC) AS Номер_попытки,
        IF(submission_time - attempt_time > 3600, average_time, submission_time - attempt_time) AS Время_попытки
    FROM lesson
        LEFT JOIN step USING(lesson_id)
        LEFT JOIN step_student USING(step_id)
        LEFT JOIN student USING(student_id)
        LEFT JOIN average_time ON average_time.Студент = student.student_name
    WHERE student_name = 'student_59'
    ORDER BY step_id, Номер_попытки
)
SELECT
    Студент,
    Шаг,
    Номер_попытки,
    Результат,    
    SEC_TO_TIME(ROUND(Время_попытки, 0)) AS Время_попытки,
    ROUND(Время_попытки*100/ sum(Время_попытки) OVER (PARTITION BY step_id),2) AS Относительное_время
FROM all_data
LEFT JOIN average_time USING(Студент)
ORDER BY step_id, Номер_попытки;