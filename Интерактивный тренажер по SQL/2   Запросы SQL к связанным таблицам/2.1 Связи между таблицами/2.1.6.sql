Задание
Создать таблицу author следующей структуры:

Поле	Тип, описание
author_id	INT PRIMARY KEY AUTO_INCREMENT
name_author	VARCHAR(50)

Решение:
CREATE TABLE author (
    author_id INT PRIMARY KEY AUTO_INCREMENT, 
    name_author VARCHAR(50) 
);