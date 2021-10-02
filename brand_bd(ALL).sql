/*
  В качестве курсового проекта планирую создание базы магазина одежды.
  Выбор связан  с созданием, для размещения в портфолио, работ на основе макета "BRAND".
  База должна содержать сведения о:
    1) зарегистрированном пользователе;
    2) товаре;
    3) заказе;
    4) отзывах посетителей.
  Таблица пользователей, исходя из макета содержит сведения:
    1) имя;
    2) фамилия;
    3) пол;
    4) адрес электронной почты;
    5) пароль.
  Сведения о пользователе можно хранить в одной таблице и она будет соответствовать требованиям третьей форме.
  Информация о товаре должна включать: артикул, название, бренд, вид товара, категория товара, цвет товара, 
  размер, фото, количество, описание товара, цену, скидку, количество на складе и отзыв.
  Информация о товаре содержит много сведений и один и тот же товар может, к примеру, иметь разный цвет, размер. 
  Бренд может иметь несколько видов товара. 
  В связи с чем информация о товаре будет содержаться в нескольких таблицах:
    1) таблица с перечислением названий брендов;
    2) таблица размеров товара;
    3) таблица цветов товара;
    4) таблица категорий товара (мужская, женская, детская);
    5) таблица видов одежды (брюки, платья, кофты...);
    6) таблица фотографий (картинок) товара;
    7) таблица количества товаров.
  В таблице товара соответственно будет содержаться артикул, название продукта, описание товара, цену, а также ссылки на внешние ключи описаных выше таблиц.
  Сведения о заказе составят таблицу содержащую в себе информацию о товаре (ссылка на внешний ключ) и информацию о пользователе (ссылка на внешний ключ), 
  количество приобретенного товара, дате заказа, а так же адрес доставки.
  Отзывы важная часть рекламы, поэтому они должны быть как о работе магазина в целом, так и о продаваемом продукте.
  Первая таблица будет содержать информацию о пользователе (ссылка на внешний ключ) и текст сообщения.
  Вторая - информацию о пользователе (ссылка на внешний ключ), информацию о товаре (ссылка на внешний ключ) и текст сообщения.  
  */


DROP DATABASE IF EXISTS brand;
CREATE DATABASE brand;
USE brand;

/* база фотографий (рисунков) */
DROP TABLE IF EXISTS media;
CREATE TABLE media(
	id SERIAL,
	filename VARCHAR(255),
 	metadata JSON	
);

INSERT INTO media (`id`, `filename`, `metadata`)
VALUES 
(1,'quia',NULL),
(2,'suscipit',NULL),
(3,'omnis',NULL),
(4,'iste',NULL),
(5,'doloremque',NULL),
(6,'suscipit',NULL),
(7,'qui',NULL),
(8,'aperiam',NULL),
(9,'enim',NULL),
(10,'nulla',NULL);


/* Таблица пользователей*/
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(120) UNIQUE,
    gender CHAR(1),
    password VARCHAR(100),
    photo_id BIGINT UNSIGNED,
    created_at DATETIME DEFAULT NOW(),
    
    INDEX users_firstname_lastname_idx(firstname,lastname),
    FOREIGN KEY (photo_id) REFERENCES media(id)
);

INSERT INTO users (`id`, `firstname`, `lastname`, `email`, `gender`, `password`, `photo_id`, `created_at`)
VALUES 
(1,'Wanda','Auer','khalid77@example.net','f','615dfc1b72c143c3b957d9c461411c825c1912dc',1,'2021-06-19 06:19:40'),
(2,'Gonzalo','Hansen','lcrist@example.com','m','1b3d4a1b7abb60ce7e430351e81b572cf061461c',2,'2021-06-15 20:43:57'),
(3,'Leopold','Runte','alanis77@example.net','f','e942b4f327e458d2eaf9a90f504db5fceef75c40',3,'2021-03-18 15:09:47'),
(4,'Merle','Armstrong','tlind@example.com','f','7bdaff3dbd3ab5994cc0825c43cc9414a5a0da36',4,'2021-07-21 21:23:35'),
(5,'Dariana','Ebert','kaelyn.kling@example.org','m','836d2af116ac726787266c3a17e074ff7aa743af',5,'2021-09-30 08:08:57'),
(6,'Merritt','Rowe','nstehr@example.com','m','8d735cf6ebfe92d8ec8d9c21db69723bd8eed598',6,'2021-12-08 17:43:42'),
(7,'Rhett','Murazik','elna90@example.net','m','df8264139876e54418d93ba24d106b3a4ce126d8',7,'2021-07-03 11:40:24'),
(8,'Jaime','Renner','watson75@example.com','f','0e4e27fdb422290fb18a26cb9e45f8e6b1bc489c',8,'2021-10-19 07:49:01'),
(9,'Leonor',"O\'Conner",'brock.kuvalis@example.org','f','e4a548ba8af17ce01f97c041ddabe6ac685b2982',9,'2021-08-24 15:40:57'),
(10,'Ressie','Hessel','walker.becker@example.net','f','8ca1d81689d4d51b39cbdb749c5950c64ab4881a',10,'2021-11-17 09:54:24');


/*таблица с адресом доставки (сверить с макетом)*/
DROP TABLE IF EXISTS adress;
CREATE TABLE adress(
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	country VARCHAR(50),
	city VARCHAR(50),
	street VARCHAR(50),
	home VARCHAR(50),

	FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO adress (`id`, `user_id`, `country`, `city`, `street`, `home`)
VALUES 
(1,1,'Malawi','Jonestown','02117 Kianna Springs Suite 699','1'),
(2,2,'Togo','East Jovan','635 Leopoldo Prairie Apt. 817','7'),
(3,3,'Bosnia and Herzegovina','New Misaeltown','7688 Maribel Union Suite 444','4'),
(4,4,'French Guiana','West Blancaborough','2892 Blick Shoals Apt. 913','8'),
(5,5,'Eritrea','Lake Jeanette','485 Lauren Walk Apt. 340','8'),
(6,6,'Iran','Nitzscheport','91421 Paul Bridge Apt. 669','8'),
(7,7,'Madagascar','Janessaland','73010 Moore Stream Suite 588','3'),
(8,8,'Azerbaijan','Lake Chandlerstad','81371 Macie Green Apt. 983','2'),
(9,9,'Mexico','Port Robertoburgh','91782 Zoe Stravenue','3'),
(10,10,'United States Minor Outlying Islands','West Lavonneberg','577 Reyes Rue','2');




/*таблица с перечислением названий брендов*/
DROP TABLE IF EXISTS brand_name;
CREATE TABLE brand_name(
	id SERIAL,
	name VARCHAR(150) NOT NULL,
    INDEX brand_name_idx(name)
);

INSERT INTO brand_name (`id`, `name`)
VALUES 
(1,'sint'),
(2,'quibusdam'),
(3,'eos'),
(4,'et'),
(5,'vero'),
(6,'neque'),
(7,'tempore'),
(8,'voluptatem'),
(9,'consequatur'),
(10,'esse');


/* Таблица товара*/
DROP TABLE IF EXISTS products;
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    article INT UNSIGNED NOT NULL,
    name VARCHAR(255),
    brand_id BIGINT UNSIGNED,
    description TEXT,
    price DECIMAL (11,2), 
    
    FOREIGN KEY (brand_id) REFERENCES brand_name(id)
);

INSERT INTO products (`id`, `article`, `name`, `brand_id`, `description`, `price`)
VALUES 
(1,2560,'ad',1,'Et mollitia et est minus ut repudiandae delectus odio. Rerum fugit pariatur quod iste similique sit quasi. Maxime consequatur animi possimus aut provident laudantium. Vero rerum iure eveniet fugit adipisci ut.',6399.00),
(2,254364,'sunt',2,'Repellat pariatur ab cum quos nobis. Et non placeat iure qui. Distinctio unde facere quam provident.',320.00),
(3,4836052,'perspiciatis',3,'Et occaecati officiis omnis accusamus voluptatum nemo voluptatum alias. Autem omnis ut quod quidem. Sit ut omnis quia laborum. Distinctio dolorem eveniet omnis rem fugit hic dolorem.',475.01),
(4,85786,'excepturi',4,'Eos temporibus sunt necessitatibus harum nihil harum itaque. Consectetur dolorem aut inventore pariatur dolore dolorem sed. Vitae quas qui qui perferendis et quasi voluptatem. Qui ut doloribus aut deleniti quia ut.',364.18),
(5,867325,'error',5,'Reiciendis vero enim minus doloribus et dolores consequatur sint. Sed debitis et voluptatem enim. Laudantium ea modi vitae sunt reiciendis. Nostrum officia et placeat eos aut voluptate dolores.',250.00),
(6,25867,'voluptatibus',6,'Nostrum omnis voluptatem quia esse sit veniam est. At cumque mollitia distinctio reiciendis consequatur iure. Qui sit et molestiae quae corrupti aliquam voluptas.',508.42),
(7,3866,'cum',7,'Accusamus eius ipsam quia. Velit et quisquam quisquam autem debitis. Consequuntur dignissimos nostrum esse voluptas expedita omnis.',364.00),
(8,876788,'nihil',8,'Odit autem et praesentium sint eius libero quas. Dolores autem quis modi quia repudiandae suscipit. Minima quo nihil aliquam qui.',222.20),
(9,897676,'perferendis',9,'Voluptas eligendi ipsum omnis incidunt quia omnis. Hic ratione nihil nemo hic. Laboriosam ad repellat quidem laborum minima molestiae.',842.76),
(10,3987569,'distinctio',10,'Voluptatibus qui repudiandae id cum odit consequatur animi. Et repellat accusamus eveniet architecto nulla pariatur adipisci. Sed accusantium sequi et pariatur illo. Consequatur distinctio impedit voluptatem minima.',605.80),
(11,3333333,'xnjnj',5,'Nostrum omnis voluptatem quia esse sit veniam est. At cumque mollitia distinctio reiciendis consequatur iure. Qui sit et molestiae quae corrupti aliquam voluptas.',123.00),
(12,8587,'rjtrfr',1,'Reiciendis vero enim minus doloribus et dolores consequatur sint. Sed debitis et voluptatem enim. Laudantium ea modi vitae sunt reiciendis. Nostrum officia et placeat eos aut voluptate dolores.',15.00),
(13,54653,'yebye',5,'Nostrum omnis voluptatem quia esse sit veniam est. At cumque mollitia distinctio reiciendis consequatur iure. Qui sit et molestiae quae corrupti aliquam voluptas.',152.00),
(14,85369,'ndjqadre',5,'Repellat pariatur ab cum quos nobis. Et non placeat iure qui. Distinctio unde facere quam provident.',65.15);


/*таблица размеров товара*/
DROP TABLE IF EXISTS product_size;
CREATE TABLE product_size(
	id SERIAL,
	sizes CHAR (4) NOT NULL,
	product_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO product_size (`id`, `sizes`, `product_id`)
VALUES 
(1,'56',1),
(2,'38',2),
(3,'0',3),
(4,'48',4),
(5,'21',5),
(6,'0',6),
(7,'52',7),
(8,'24',8),
(9,'0',9),
(10,'42',10),
(11,'48',7),
(12,'40',10),
(13,'48',11),
(14,'48',12),
(15,'48',13),
(16,'48',14);


/*таблица цветов товара*/
DROP TABLE IF EXISTS product_colors;
CREATE TABLE product_colors(
	id SERIAL,
	colors CHAR (30) NOT NULL,
	product_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO product_colors (`id`, `colors`, `product_id`)
VALUES 
(1,'фиолетовый',1),
(2,'Голубой колокольчик Крайола',2),
(3,'Темный пастельно-зеленый',3),
(4,'Пастельно-бирюзовый',4),
(5,'Очень светлый синий',5),
(6,'Персидский индиго',6),
(7,'Темная орхидея',7),
(8,'Бабушкины яблоки',8),
(9,'Королевский синий',9),
(10,'Синяя лазурь (Лазурно-голубой)',10),
(11,'Очень светлый синий',10),
(12,'Королевский синий',7),
(13,'Королевский синий',11),
(14,'Темная орхидея',12),
(15,'Королевский синий',13),
(16,'Темная орхидея',14);


/*таблица категорий товара*/
DROP TABLE IF EXISTS product_category;
CREATE TABLE product_category(
	id SERIAL,
	category ENUM ('men', 'women', 'kids', 'accesories'),
	product_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO product_category (`id`, `category`, `product_id`)
VALUES 
(1,'men',1),
(2,'kids',2),
(3,'accesories',3),
(4,'men',4),
(5,'kids',5),
(6,'accesories',6),
(7,'women',7),
(8,'kids',8),
(9,'accesories',9),
(10,'women',10),
(11,'men',11),
(12,'men',12),
(13,'men',13),
(14,'men',14);


/*таблица видов товара*/
DROP TABLE IF EXISTS types_goods;
CREATE TABLE types_goods(
	id SERIAL,
	types VARCHAR (255) NOT NULL,
	product_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO types_goods ( `id`, `types`, `product_id`) 
VALUES 
(1,'shirt',1),
(2,'polo',2),
(3,'belt of trousers',3),
(4,'trousers',4),
(5,'shorts',5),
(6,'wallet',6),
(7,'sweater',7),
(8,'pullover',8),
(9,'scarf',9),
(10,'skirt',10),
(11,'sweater',11),
(12,'shirt',12),
(13,'shirt',13),
(14,'sweater',14);


/*таблица количества товара*/
DROP TABLE IF EXISTS product_quantity;
CREATE TABLE product_quantity(
  id SERIAL PRIMARY KEY,
  product_id BIGINT UNSIGNED NOT NULL,
  color_id BIGINT UNSIGNED NOT NULL,
  size_id BIGINT UNSIGNED NOT NULL,
  quantity INT UNSIGNED DEFAULT 0,
  
  FOREIGN KEY (product_id) REFERENCES products(id),
  FOREIGN KEY (color_id) REFERENCES product_colors(id),
  FOREIGN KEY (size_id) REFERENCES product_size(id) 
);

INSERT INTO product_quantity (`id`, `product_id`, `color_id`, `size_id`, `quantity`) 
VALUES 
(1,1,1,1,16),
(2,1,2,2,16),
(3,1,3,3,16),
(4,2,4,4,24),
(5,2,5,5,23),
(6,2,6,6,21),
(7,3,7,7,24),
(8,3,8,8,25),
(9,3,9,9,21),
(10,4,10,10,21),
(11,4,1,1,16),
(12,4,2,2,16),
(13,5,3,3,16),
(14,5,4,4,24),
(15,5,5,5,23),
(16,6,6,6,21),
(17,6,7,7,24),
(18,6,8,8,25),
(19,7,9,10,21),
(20,7,7,7,21),
(21,8,1,1,16),
(22,9,2,2,16),
(23,9,3,3,16),
(24,10,10,7,24),
(25,10,5,10,23),
(26,11,13,13,23),
(27,12,14,14,23),
(28,13,15,15,23),
(29,14,16,16,23);


/*таблицы фотографий (картинок) товара*/
DROP TABLE IF EXISTS photo_products;
CREATE TABLE photo_products(
	id SERIAL,
    photo_id BIGINT UNSIGNED NOT NULL,
    product_id BIGINT UNSIGNED NOT NULL,
	color_id BIGINT UNSIGNED,
 	
 	FOREIGN KEY (photo_id) REFERENCES media(id),
	FOREIGN KEY (product_id) REFERENCES products(id),
 	FOREIGN KEY (color_id) REFERENCES product_colors(id)
);

INSERT INTO photo_products ( `id`, `photo_id`, `product_id`, `color_id`)
VALUES 
(1,1,1,1),
(2,2,2,2),
(3,3,3,3),
(4,4,4,4),
(5,5,5,5),
(6,6,6,6),
(7,7,7,7),
(8,8,8,8),
(9,9,9,9),
(10,10,10,10);


/*Таблица заказанного продукта*/
DROP TABLE IF EXISTS orders_product;
CREATE TABLE orders_product(
  id SERIAL PRIMARY KEY,
  product_id BIGINT UNSIGNED NOT NULL,
  color_id BIGINT UNSIGNED NOT NULL,
  size_id BIGINT UNSIGNED NOT NULL,
  total INT UNSIGNED DEFAULT 1,
  
  FOREIGN KEY (product_id) REFERENCES products(id),
  FOREIGN KEY (color_id) REFERENCES product_colors(id),
  FOREIGN KEY (size_id) REFERENCES product_size(id) 
);

INSERT INTO orders_product (`id`, `product_id`, `color_id`, `size_id`, `total`) 
VALUES 
(1,1,1,1,2),
(2,2,2,2,6),
(3,3,3,3,1),
(4,4,4,4,4),
(5,5,5,5,3),
(6,6,6,6,1),
(7,7,7,7,4),
(8,8,8,8,5),
(9,9,9,9,1),
(10,10,10,10,1),
(11,11,13,13,2);


/*Таблица заказа*/
DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
  id SERIAL PRIMARY KEY,
  user_id BIGINT UNSIGNED NOT NULL,
  order_product_id BIGINT UNSIGNED NOT NULL,
  adress_id BIGINT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
  
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (adress_id) REFERENCES adress(id),
  FOREIGN KEY (order_product_id) REFERENCES orders_product(id) 
);

INSERT INTO orders (`id`, `user_id`, `order_product_id`, `adress_id`, `created_at`, `updated_at`)
VALUES 
(1,1,1,1,'2021-09-28 02:03:34','2021-10-03 22:17:32'),
(2,2,2,2,'2021-08-27 17:48:13','2021-09-06 22:02:41'),
(3,3,3,3,'2021-09-01 11:09:31','2021-10-06 19:46:36'),
(4,4,4,4,'2021-08-26 09:13:17','2021-09-16 06:07:12'),
(5,5,5,5,'2021-09-15 11:21:31','2021-10-02 04:22:49'),
(6,6,6,6,'2021-02-16 05:52:42','2021-03-02 10:15:55'),
(7,7,7,7,'2021-06-30 01:26:20','2021-07-23 23:26:43'),
(8,8,8,8,'2021-04-13 04:20:19','2021-05-10 17:21:37'),
(9,9,9,9,'2021-08-03 05:19:11','2021-09-21 10:05:02'),
(10,10,10,10,'2021-04-01 03:02:13','2021-08-18 13:52:15'),
(11,1,11,1,'2021-09-17 11:21:31','2021-10-17 04:22:49');


/*Таблица отзывов о магазине*/
DROP TABLE IF EXISTS reviews_shop;
CREATE TABLE reviews_shop(
  id SERIAL PRIMARY KEY,
  user_id BIGINT UNSIGNED NOT NULL,
  body TEXT NOT NULL,
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
 
  FOREIGN KEY (user_id) REFERENCES users(id) 
);

INSERT INTO reviews_shop (`id`, `user_id`, `body`, `created_at`, `updated_at`)
VALUES 
(1,1,'Voluptatem accusamus odio provident labore aperiam voluptatem molestias deserunt. Incidunt dolor saepe magnam ipsam. Magnam error odio neque.','2021-01-29 06:05:04','2021-06-13 08:45:52'),
(2,2,'Vero quia sint id. Harum consequatur a saepe non odit provident ex. Quisquam incidunt aperiam ipsam assumenda.','2021-01-15 09:44:58','2021-01-25 15:51:43'),
(3,3,'Eos optio quia repellendus et. Nam deleniti unde porro nostrum aut. Qui odit soluta quae qui. Dolorem ea distinctio labore.','2021-03-08 17:09:54','2021-07-10 07:57:17'),
(4,4,'Id quo earum animi commodi laboriosam dolorum. Rerum ut quas totam. Rem id placeat delectus voluptas necessitatibus nam dolorum.','2021-02-26 23:54:50','2021-03-25 12:46:49'),
(5,5,'Incidunt ab aliquam cupiditate commodi saepe modi iure. Molestias voluptatibus quam est repudiandae vel.','2021-04-28 11:34:49','2021-05-11 23:26:30'),
(6,6,'Sed quo nostrum et eos voluptatum. Sapiente sapiente non voluptate voluptatum. Vel modi voluptatem possimus consequatur illo sunt labore et. Minus quis sunt facere voluptas.','2021-09-05 18:59:45','2021-09-12 01:23:49'),
(7,7,'Consequatur voluptas libero laborum magni esse ipsam eaque. Maxime et minima soluta ipsum cumque ipsum.','2021-01-13 11:28:32','2021-01-29 13:46:46'),
(8,8,'Maxime debitis magnam deleniti accusantium. Voluptatem incidunt cum autem voluptatem ut animi praesentium. Quod autem quasi porro ex minima officia. Cumque culpa vel voluptas.','2021-06-29 23:50:46','2021-07-14 13:30:11'),
(9,9,'Dolore autem commodi dolor sunt. Consequatur voluptate nam suscipit tempora. Eum aut officiis delectus eaque consectetur repudiandae velit sit.','2021-05-20 20:07:49','2021-06-08 22:05:24'),
(10,10,'Commodi debitis perspiciatis optio aspernatur non. Necessitatibus aut omnis ipsum fugiat natus numquam omnis. Occaecati minima est alias occaecati officiis aut.','2021-09-08 00:08:44','2021-09-10 08:42:22');


/*Таблица отзывов о товаре*/
DROP TABLE IF EXISTS reviews_product;
CREATE TABLE reviews_product(
  id SERIAL PRIMARY KEY,
  user_id BIGINT UNSIGNED NOT NULL,
  product_id BIGINT UNSIGNED NOT NULL,
  body TEXT NOT NULL,
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
   
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (product_id) REFERENCES products(id) 
);

INSERT INTO reviews_product (`id`, `user_id`, `product_id`, `body`, `created_at`, `updated_at`)
VALUES 
(1,1,1,'Reiciendis voluptas voluptate repudiandae est itaque explicabo. Qui vero laborum necessitatibus consequatur ea pariatur. Ut omnis debitis atque ea consequatur pariatur aut. Quibusdam voluptatem corrupti eos odio eius.','2021-03-08 15:56:25','2021-05-24 13:54:04'),
(2,2,2,'Dolores enim non ipsa nam voluptas aliquam pariatur. Modi dignissimos eligendi deleniti sint rerum corporis. Mollitia voluptates aut sapiente excepturi. Commodi assumenda amet voluptatem et cupiditate.','2021-08-02 07:50:18','2021-09-30 21:49:37'),
(3,3,3,'In voluptatibus suscipit et quia voluptatem nihil nulla. Sit provident rem deserunt deserunt veniam esse repudiandae. Et enim sunt quia sint aut autem voluptates.','2021-05-05 03:59:25','2021-09-18 05:57:32'),
(4,4,4,'Assumenda ut labore omnis aut vitae eos. Delectus quis hic est quidem exercitationem omnis inventore. Aut molestiae velit voluptatum animi dicta. Ut minus sit cupiditate fuga molestiae cumque impedit.','2021-02-16 20:05:50','2021-03-29 12:04:12'),
(5,5,5,'Pariatur perferendis quisquam cum amet non facere. Sapiente nesciunt ut tempore dolorum nostrum dolorum. Deserunt voluptates qui quod quis ex quo. Accusamus sed quibusdam optio atque.','2021-06-06 14:42:23','2021-07-27 12:35:13'),
(6,6,6,'Quod nemo dolorem sapiente consequatur deserunt est. At ea et soluta necessitatibus aspernatur autem. Officiis nisi vero assumenda aut aut totam. Perferendis eos doloribus accusantium soluta ipsam cum.','2021-06-09 07:10:29','2021-08-30 12:43:13'),
(7,7,7,'Commodi dolor ut voluptas ut. Qui et excepturi eaque nesciunt omnis. Commodi et quibusdam consequatur doloribus. Iste nihil ut ut.','2021-09-01 12:33:22','2021-09-11 14:43:16'),
(8,8,8,'Eos hic est soluta repudiandae pariatur qui quia. Error doloremque maiores est pariatur commodi. Sequi quo aliquam magni totam expedita.','2021-09-04 16:51:07','2021-09-09 18:04:39'),
(9,9,9,'Quos neque nemo fugit iusto eaque culpa. Laborum dicta voluptatibus id fugit aut sed quasi. Et cum ut ad accusamus culpa recusandae iste. Nihil aperiam et aperiam itaque et ab ducimus.','2021-09-08 09:07:20','2021-09-25 14:01:05'),
(10,10,10,'Doloremque optio autem rerum harum voluptatum incidunt est. Soluta non voluptatem perspiciatis est id. Aut quo nulla voluptas unde porro.','2021-09-11 14:31:24','2021-09-10 02:46:31');


/*Таблица скидок*/
DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
  id SERIAL PRIMARY KEY,
  user_id BIGINT UNSIGNED,
  product_id BIGINT UNSIGNED,
  discount FLOAT UNSIGNED,
  started_at DATETIME,
  finished_at DATETIME,
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
  
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
);


INSERT INTO discounts (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`)
VALUES 
(1,1,1,5,'2021-10-14 04:15:05','2021-11-14 08:01:15','2021-09-14 21:01:29','2021-09-14 22:25:13'),
(2,2,2,4,'2021-09-11 08:16:19','2021-09-11 05:41:41','2021-10-11 17:56:32','2021-09-11 18:39:14'),
(3,3,3,8,'2021-11-29 03:23:56','2021-12-12 23:38:24','2021-09-16 20:37:46','2021-09-16 21:27:44'),
(4,4,4,0,'2021-11-12 01:13:12','2021-12-12 07:53:48','2021-09-16 17:38:22','2021-09-16 19:05:47'),
(5,5,5,6,'2021-01-20 16:24:14','2021-02-20 12:48:17','2021-01-20 22:01:53','2021-01-20 23:01:37'),
(6,6,6,7,'2021-11-24 21:45:13','2021-12-24 20:31:57','2021-09-14 15:14:51','2021-09-14 22:32:27'),
(7,7,7,50,'2021-07-27 17:19:46','2021-08-27 08:41:37','2021-07-27 04:39:10','2021-07-27 22:51:14'),
(8,8,8,4,'2021-10-16 19:05:50','2021-11-16 15:28:41','2021-09-16 18:28:56','2021-09-16 20:17:34'),
(9,9,9,10,'2021-05-30 17:50:21','2021-06-20 23:13:42','2021-05-30 12:04:13','2021-05-30 18:30:36'),
(10,10,10,15,'2021-09-14 16:03:49','2021-10-14 03:51:36','2021-09-14 18:06:22','2021-09-14 19:43:52');



/*=======================================================================================================*/



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
    WHERE pq.product_id =  for_product_id;
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




























