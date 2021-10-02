

/*
 * Представления
 */


/*
 * Выберем отзывы о магазине и 
 * фамилию и имя человека его оставившего 
 */
DROP VIEW IF EXISTS store_review

CREATE VIEW store_review
AS SELECT
   rs.body AS 'отзыв',
   CONCAT(us.firstname, '  ', us.lastname) AS 'фамилия и имя'
FROM reviews_shop AS rs
JOIN users AS us ON us.id = rs.user_id;


/*
 * Выберем товар, отзыв о нем и 
 * фамилию и имя человека его оставившего 
 */
DROP VIEW IF EXISTS product_review

CREATE VIEW product_review
AS SELECT
   p.name AS 'товар',
   rp.body AS 'отзыв',
   CONCAT(us.firstname, '  ', us.lastname) AS 'фамилия и имя'
FROM products AS p
JOIN
   reviews_product AS rp ON p.id = rp.product_id  
JOIN 
   users AS us ON us.id = rp.user_id;

  
/*
 * Выберем действующие скидки  
 * по фамилии человека которому они предоставляются. 
 */
DROP VIEW IF EXISTS discounts_for_user

CREATE VIEW discounts_for_user
AS SELECT
   p.name AS 'товар',
   d.discount AS 'скидка',
   d.started_at AS 'начало действия',
   d.finished_at AS 'конец действия'
FROM discounts AS d
JOIN
   products AS p ON p.id = d.product_id  
JOIN 
   users AS us ON us.id = d.user_id
WHERE us.lastname LIKE 'Auer' AND d.discount != 0
ORDER BY d.started_at;


/*
 * Выберем товары из категории женской одежды. 
 */
DROP VIEW IF EXISTS womens_clothing

CREATE VIEW womens_clothing
AS SELECT
   bn.name AS 'название бренда',
   p.name AS 'название товара',
   ps.sizes AS 'размер товара',
   pcl.colors AS 'цвет товара',
   pq.quantity AS 'количество товара на складе'
FROM  product_quantity AS pq
JOIN 
   product_size AS ps ON ps.id = pq.size_id
JOIN 
   product_colors AS pcl ON pcl.id = pq.color_id
JOIN 
   products AS p ON p.id = pq.product_id
JOIN
   brand_name AS bn ON bn.id = p.brand_id     
JOIN
   product_category AS pc ON pc.product_id = p.id 
WHERE pc.category = 'women';




/*
 * Хранимые процедуры
 */

/*
 * Процедура вывода товара, его количества и стоимости.
 */

DROP PROCEDURE IF EXISTS sp_product_sum_price;

DELIMITER //

CREATE PROCEDURE sp_product_sum_price (for_product_id BIGINT UNSIGNED)
BEGIN
	SELECT 
	p.name AS 'название товара',
	SUM(pq.quantity) AS 'количество товара на складе',
	(SUM(pq.quantity) * p.price) AS 'стоимость товара на складе'
	FROM product_quantity AS pq
JOIN
    products AS p ON  p.id = pq.product_id 
    WHERE pq.product_id = for_product_id;
END//
DELIMITER ;
  
CALL sp_product_sum_price (3)
  
/*
 * Процедура вывода вариантов предложения товаров клиенту (id=1).
 */


DROP PROCEDURE IF EXISTS sp_product_offer;

DELIMITER //

CREATE PROCEDURE sp_product_offer (for_user_id BIGINT UNSIGNED)
BEGIN
   SELECT 
       p2.name AS 'название товара'
   FROM orders o 
   INNER JOIN users u ON u.id = o.user_id 
   INNER JOIN orders_product op ON op.id = o.order_product_id
   INNER JOIN products p1  ON p1.id = op.product_id
   INNER JOIN brand_name bn ON bn.id = p1.brand_id
   INNER JOIN products p2 ON p2.brand_id = bn.id
   WHERE u.id = for_user_id
UNION
   SELECT 
       p4.name AS 'название товара'
   FROM orders o 
   INNER JOIN users u ON u.id = o.user_id 
   INNER JOIN orders_product op ON op.id = o.order_product_id
   INNER JOIN products p3  ON p3.id = op.product_id
   INNER JOIN types_goods tg ON tg.product_id = p3.id 
   INNER JOIN types_goods tg2 ON tg2.types = tg.types 
   INNER JOIN products p4 ON p4.id = tg2.product_id 
   WHERE u.id = for_user_id
UNION 
   SELECT 
       p6.name AS 'название товара'
   FROM orders o 
   INNER JOIN users u ON u.id = o.user_id 
   INNER JOIN orders_product op ON op.id = o.order_product_id
   INNER JOIN products p5  ON p5.id = op.product_id 
   INNER JOIN product_category pc ON pc.product_id = p5.id 
   INNER JOIN product_category pc2 ON pc2.category = pc.category 
   INNER JOIN products p6 ON p6.id = pc2.product_id 
   WHERE u.id = for_user_id
   ORDER BY RAND()
   LIMIT 3;
END//

DELIMITER ;
  
CALL sp_product_offer (3)

/*
 * Транзакция по добавлению пользователя
 */

START TRANSACTION;
    INSERT INTO users (`firstname`, `lastname`, `email`, `gender`, `password`, `photo_id`, `created_at`)
    VALUES ('Wanesa','Fler','FlerW79@example.net','f','634dfc1b54c143c3b957d9c461411c825c1912dc',54,'2021-09-30 06:19:40');

    INSERT INTO adress (`user_id`, `country`, `city`, `street`, `home`)
    VALUES (LAST_INSERT_ID(),'Samali','Jonstown','01752 Kalina Suite 69','6');
COMMIT;


/*
 * Триггер проверки начала старта скидки
 */

DROP PROCEDURE IF EXISTS discount_started;

DELIMITER $$

CREATE TRIGGER discount_started
AFTER INSERT
ON discounts FOR EACH ROW
BEGIN
   IF NEW.started_at < CURRENT_DATE() THEN 
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'A spoon is the way to dinner. Set the current date.';
   END IF;
END$$
DELIMITER ;

/*
 * Проверка
 */

INSERT INTO discounts (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`)
VALUES (21,1,11,5,'2021-09-14 04:15:05','2021-11-14 08:01:15','2021-09-14 21:01:29','2021-09-14 22:25:13');


