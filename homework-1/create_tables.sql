CREATE TABLE customers
(
    customer_id VARCHAR(10) NOT NULL,
    company_name VARCHAR(50) NOT NULL,
    contact_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (customer_id)
);

CREATE TABLE employees
(
    employee_id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    title VARCHAR(30) NOT NULL,
    birth_date DATE NOT NULL,
    notes TEXT NOT NULL,
    PRIMARY KEY (employee_id)
);

CREATE TABLE orders
(
    order_id INT NOT NULL,
    customer_id VARCHAR(20) NOT NULL,
    employee_id INT NOT NULL,
    order_date DATE NOT NULL,
    ship_city varchar(20) NOT NULL,
    PRIMARY KEY (order_id),
    CONSTRAINT fk_customer FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    CONSTRAINT fk_employee FOREIGN KEY(employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE
);

