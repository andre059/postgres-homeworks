-- SQL-команды для создания таблиц

CREATE TABLE customers
(
    customer_id varchar(10) NOT NULL,
    company_name varchar(40) NOT NULL,
    contact_name varchar(40) NOT NULL
);

SELECT * FROM  employees;

CREATE TABLE employees
(
	first_name varchar(20) NOT NULL,
	last_name varchar(20) NOT NULL,
	title varchar(30) NOT NULL,
	birth_date varchar(15) NOT NULL,
	notes text
);

CREATE TABLE orders
(
	order_id int PRIMARY KEY,
	customer_id varchar(10) NOT NULL,
	employee_id int NOT NULL,
	order_date varchar(15) NOT NULL,
	ship_city varchar(20) NOT NULL
)
