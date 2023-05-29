import os.path
import psycopg2
import csv


"""Скрипт для заполнения данными таблиц в БД Postgres."""

# таблица customers

conn = psycopg2.connect(host="localhost", database="north", user="postgres", password="aktiv416384352")
cur = conn.cursor()

with open(os.path.join('north_data', 'customers_data.csv'), 'r') as f:
    next(f)  # пропустить первую строку (заголовок)
    cur.copy_from(f, 'customers', sep=',')

# таблица employees

with open(os.path.join('north_data', 'employees_data.csv'), 'r', encoding="UTF-8") as file:
    reader = csv.reader(file)
    next(reader)  # пропустить первую строку (заголовок)
    for row in reader:
        first_name, last_name, title, birth_date, notes = row
        cur.execute("INSERT INTO employees (first_name, last_name, title, birth_date, notes) "
                    "VALUES (%s, %s, %s, %s, %s)", (first_name, last_name, title, birth_date, notes))

# таблица orders

with open(os.path.join('north_data', 'orders_data.csv'), 'r') as f:
    next(f)  # пропустить первую строку (заголовок)
    cur.copy_from(f, 'orders', sep=',')

conn.commit()
conn.close()
