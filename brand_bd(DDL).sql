

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


/*таблица с перечислением названий брендов*/
DROP TABLE IF EXISTS brand_name;
CREATE TABLE brand_name(
	id SERIAL,
	name VARCHAR(150) NOT NULL,
    INDEX brand_name_idx(name)
);


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


/*таблица размеров товара*/
DROP TABLE IF EXISTS product_size;
CREATE TABLE product_size(
	id SERIAL,
	sizes CHAR (4) NOT NULL,
	product_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (product_id) REFERENCES products(id)
);


/*таблица цветов товара*/
DROP TABLE IF EXISTS product_colors;
CREATE TABLE product_colors(
	id SERIAL,
	colors CHAR (30) NOT NULL,
	product_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (product_id) REFERENCES products(id)
);


/*таблица категорий товара*/
DROP TABLE IF EXISTS product_category;
CREATE TABLE product_category(
	id SERIAL,
	category ENUM ('men', 'women', 'kids', 'accesories'),
	product_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (product_id) REFERENCES products(id)
);


/*таблица видов товара*/
DROP TABLE IF EXISTS types_goods;
CREATE TABLE types_goods(
	id SERIAL,
	types VARCHAR (255) NOT NULL,
	product_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (product_id) REFERENCES products(id)
);


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

