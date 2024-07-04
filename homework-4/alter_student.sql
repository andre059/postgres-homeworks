-- 1. Создание таблицы student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
CREATE TABLE student
(
    student_id serial PRIMARY KEY,
    first_name  varchar(40) NOT NULL,
    last_name varchar(40) NOT NULL,
    birthday date,
    phone varchar(40) NOT NULL
);

-- 2. Добавление в таблицу student колонки middle_name varchar
ALTER TABLE student
ADD middle_name VARCHAR(20) NOT NULL

-- 3. Удаление колонки middle_name
ALTER TABLE student DROP COLUMN middle_name;

-- 4. Переименование колонки birthday в birth_date
ALTER TABLE student RENAME birthday TO birth_date;

-- 5. Измение типа данных колонки phone на varchar(32)
ALTER TABLE student ALTER COLUMN phone SET DATA TYPE varchar(32);

-- 6. Вставил три любых записи с автогенерацией идентификатора
INSERT INTO student (first_name, birth_date) VALUES ('Leon', '2021-01-10'), ('Jon', '2022-02-10'), ('Ecvsd', '2023-03-10');

-- 7. Удаление всех данных из таблицы со сбросом идентификатора в исходное состояние
TRUNCATE TABLE student RESTART IDENTITY;
