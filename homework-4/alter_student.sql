-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
CREATE TABLE student
(
    student_id serial PRIMARY KEY,
    first_name  varchar(40) NOT NULL,
    last_name varchar(40) NOT NULL,
    birthday date,
    phone varchar(40) NOT NULL
);

-- 2. Добавить в таблицу student колонку middle_name varchar
ALTER TABLE student
ADD middle_name VARCHAR(20) NOT NULL

-- 3. Удалить колонку middle_name
ALTER TABLE student DROP COLUMN middle_name;

-- 4. Переименовать колонку birthday в birth_date
ALTER TABLE student RENAME birthday TO birth_date;

-- 5. Изменить тип данных колонки phone на varchar(32)
ALTER TABLE student ALTER COLUMN phone SET DATA TYPE varchar(32);

-- 6. Вставить три любых записи с автогенерацией идентификатора
INSERT INTO student (first_name, birth_date) VALUES ('Leon', '2021-01-10'), ('Jon', '2022-02-10'), ('Ecvsd', '2023-03-10');

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
TRUNCATE TABLE student RESTART IDENTITY;