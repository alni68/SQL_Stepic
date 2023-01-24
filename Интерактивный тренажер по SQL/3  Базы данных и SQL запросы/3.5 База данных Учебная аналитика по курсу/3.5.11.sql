Задание
Проанализировать, в каком порядке и с каким интервалом пользователь отправлял последнее верно выполненное задание каждого урока. В базе занесены попытки студентов  для трех уроков курса, поэтому анализ проводить только для этих уроков.
Для студентов прошедших как минимум по одному шагу в каждом уроке, найти последний пройденный шаг каждого урока - крайний шаг, и указать:
имя студента;
номер урока, состоящий из номера модуля и через точку позиции каждого урока в модуле;
время отправки  - время подачи решения на проверку;
разницу во времени отправки между текущим и предыдущим крайним шагом в днях, при этом для первого шага поставить прочерк ("-"), а количество дней округлить до целого в большую сторону.
Столбцы назвать  Студент, Урок,  Макс_время_отправки и Интервал  соответственно. Отсортировать результаты по имени студента в алфавитном порядке, а потом по возрастанию времени отправки.

Решение:
WITH count_leson AS
    (SELECT COUNT(DISTINCT lesson_id) AS max_lesson
        FROM step
        JOIN step_student USING(step_id)
    ),
     student_max_lesson AS
    (SELECT student_id
        FROM step
        JOIN step_student USING(step_id)
        CROSS JOIN count_leson
        GROUP BY student_id,
        max_lesson
        HAVING COUNT(DISTINCT lesson_id) = max_lesson
    ),
    student_last_step AS
    (SELECT student_id,
        lesson_id,
        MAX(submission_time) AS submission_time
        FROM step
        JOIN step_student USING(step_id)
        JOIN student_max_lesson USING(student_id)
        WHERE result = 'correct'
        GROUP BY student_id,
        lesson_id
    )
    SELECT student_name AS Студент,
    CONCAT(module_id, '.', lesson_position) AS Урок,
    FROM_UNIXTIME(submission_time) AS Макс_время_отправки,
    IFNULL(CEIL((submission_time - LAG(submission_time) OVER(PARTITION BY student_name
    ORDER BY submission_time)
        ) / (24 * 60 * 60)
        )
        , '-') AS Интервал
FROM student_last_step
JOIN lesson  USING(lesson_id)
JOIN student USING(student_id)
ORDER BY Студент, Макс_время_отправки;