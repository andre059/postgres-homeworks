import os.path
import psycopg2


"""Скрипт для заполнения данными таблиц в БД Postgres."""

# таблица customers

conn = psycopg2.connect(host="localhost", database="north", user="postgres", password="aktiv416384352")
cur = conn.cursor()

with open(os.path.join('north_data', 'customers_data.csv'), 'r') as f:
    next(f)  # пропустить первую строку (заголовок)
    cur.copy_from(f, 'customers', sep=',')

# таблица employees

# sql = "COPY %s FROM STDIN WITH CSV HEADER DELIMITER AS ','"
# with open(os.path.join('north_data', 'employees_data.csv'), 'r', encoding="UTF-8") as f:
    # next(f)  # пропустить первую строку (заголовок)
    # cur.execute("truncate " + 'employees' + ";")
    # cur.copy_expert(sql=sql % 'employees', file=f)

with open(os.path.join('north_data', 'employees_data.csv'), 'r', encoding="UTF-8") as f:
    next(f)  # пропустить первую строку (заголовок)
    cur.execute("TRUNCATE employees RESTART IDENTITY CASCADE;")  # удаляем все записи из таблицы
    cur.copy_expert(sql="COPY employees FROM STDIN WITH CSV HEADER DELIMITER AS ','", file=f)

# таблица orders

with open(os.path.join('north_data', 'orders_data.csv'), 'r') as f:
    next(f)  # пропустить первую строку (заголовок)
    cur.copy_from(f, 'orders', sep=',')

conn.commit()
conn.close()
