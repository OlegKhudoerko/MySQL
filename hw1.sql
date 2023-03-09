/* 1.	Создайте таблицу с мобильными телефонами, используя графический интерфейс.
		Необходимые поля таблицы: product_name (название товара), manufacturer 
        (производитель), product_count (количество), price (цена). Заполните БД 
        произвольными данными.
*/ 

DROP DATABASE IF EXISTS hw1_sql;
CREATE DATABASE hw1_sql;
USE hw1_sql;

CREATE TABLE `salephones` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `product_count` INT NULL,
  `price` DOUBLE NULL,
   PRIMARY KEY (`id`));
  
INSERT INTO `salephones` 
VALUES 
	(1,'Galaxy s9','Samsung',5,46000),
	(2,'Galaxy s10','Samsung',4,64000),
	(3,'Galaxy s20','Samsung',8,60000),
	(4,'Galaxy S21','Samsung',10,80000),
	(5,'Galaxy S22','Samsung',50,100000),
	(6,'Galaxy S23','Samsung',30,120000),
	(7,'iPhone 12','Apple',70,80000),
	(8,'iPhone 13','Apple',80,100000),
	(9,'iPhone 14','Apple',40,120000),
	(10,'iPhone 15','Apple',20,140000),
	(11,'iPhone X','Apple',3,75000),
	(12,'iPhone 8 Pro','Apple',2,50000);
    
-- 2.	Напишите SELECT-запрос, который выводит название товара, 
-- 		производителя и цену для товаров, количество которых превышает 2

SELECT product_name, manufacturer, price, product_count
  FROM salephones
 WHERE product_count > 2;

-- 3.  Выведите SELECT-запросом весь ассортимент товаров марки “Samsung”

SELECT *
  FROM salephones
  WHERE manufacturer = 'Samsung';

-- 4.*	С помощью SELECT-запроса с оператором LIKE найти:
-- 4.1.* Товары, в которых есть упоминание "Iphone"

SELECT 	*
  FROM salephones
 WHERE product_name LIKE '%iPhone%';

-- 	4.2.* Товары, в которых есть упоминание "Samsung"

SELECT 	*
  FROM salephones
 WHERE manufacturer LIKE 'Samsung';
 
 -- 4.3.*  Товары, в названии которых есть ЦИФРЫ

SELECT 	*
  FROM salephones
 WHERE product_name RLIKE '[0-9]';
 
 -- 4.4.*  Товары, в названии которых есть ЦИФРА "8"  

SELECT 	*
  FROM salephones
 WHERE product_name LIKE '%8%';