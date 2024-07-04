-- 1. Ограничение на поле unit_price таблицы products (цена должна быть больше 0)
ALTER TABLE products ADD CONSTRAINT chk_unit_price CHECK (unit_price > 0);

-- 2. Ограничение, что поле discontinued таблицы products может содержать только значения 0 или 1
ALTER TABLE products ADD CONSTRAINT chk_discontinued CHECK (discontinued IN (0, 1));

-- 3. Новая таблица, содержащая все продукты, снятые с продажи (discontinued = 1)
SELECT * INTO not_discontinued FROM products WHERE discontinued = 1;

-- 4. Удалены из products товары, снятые с продажи (discontinued = 1)
ALTER TABLE order_details DROP CONSTRAINT fk_order_details_products;
DELETE FROM products WHERE discontinued = 1;
