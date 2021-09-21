-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: brand
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adress`
--

DROP TABLE IF EXISTS `adress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adress` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `home` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `adress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adress`
--

LOCK TABLES `adress` WRITE;
/*!40000 ALTER TABLE `adress` DISABLE KEYS */;
INSERT INTO `adress` VALUES (1,1,'Malawi','Jonestown','02117 Kianna Springs Suite 699','1'),(2,2,'Togo','East Jovan','635 Leopoldo Prairie Apt. 817','7'),(3,3,'Bosnia and Herzegovina','New Misaeltown','7688 Maribel Union Suite 444','4'),(4,4,'French Guiana','West Blancaborough','2892 Blick Shoals Apt. 913','8'),(5,5,'Eritrea','Lake Jeanette','485 Lauren Walk Apt. 340','8'),(6,6,'Iran','Nitzscheport','91421 Paul Bridge Apt. 669','8'),(7,7,'Madagascar','Janessaland','73010 Moore Stream Suite 588','3'),(8,8,'Azerbaijan','Lake Chandlerstad','81371 Macie Green Apt. 983','2'),(9,9,'Mexico','Port Robertoburgh','91782 Zoe Stravenue','3'),(10,10,'United States Minor Outlying Islands','West Lavonneberg','577 Reyes Rue','2');
/*!40000 ALTER TABLE `adress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_name`
--

DROP TABLE IF EXISTS `brand_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand_name` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `brand_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_name`
--

LOCK TABLES `brand_name` WRITE;
/*!40000 ALTER TABLE `brand_name` DISABLE KEYS */;
INSERT INTO `brand_name` VALUES (9,'consequatur'),(3,'eos'),(10,'esse'),(4,'et'),(6,'neque'),(2,'quibusdam'),(1,'sint'),(7,'tempore'),(5,'vero'),(8,'voluptatem');
/*!40000 ALTER TABLE `brand_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `discount` float unsigned DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `discounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `discounts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,1,1,5,'2021-10-14 04:15:05','2021-11-14 08:01:15','2021-09-14 21:01:29','2021-09-14 22:25:13'),(2,2,2,4,'2021-09-11 08:16:19','2021-09-11 05:41:41','2021-10-11 17:56:32','2021-09-11 18:39:14'),(3,3,3,8,'2021-11-29 03:23:56','2021-12-12 23:38:24','2021-09-16 20:37:46','2021-09-16 21:27:44'),(4,4,4,0,'2021-11-12 01:13:12','2021-12-12 07:53:48','2021-09-16 17:38:22','2021-09-16 19:05:47'),(5,5,5,6,'2021-01-20 16:24:14','2021-02-20 12:48:17','2021-01-20 22:01:53','2021-01-20 23:01:37'),(6,6,6,7,'2021-11-24 21:45:13','2021-12-24 20:31:57','2021-09-14 15:14:51','2021-09-14 22:32:27'),(7,7,7,50,'2021-07-27 17:19:46','2021-08-27 08:41:37','2021-07-27 04:39:10','2021-07-27 22:51:14'),(8,8,8,4,'2021-10-16 19:05:50','2021-11-16 15:28:41','2021-09-16 18:28:56','2021-09-16 20:17:34'),(9,9,9,10,'2021-05-30 17:50:21','2021-06-20 23:13:42','2021-05-30 12:04:13','2021-05-30 18:30:36'),(10,10,10,15,'2021-09-14 16:03:49','2021-10-14 03:51:36','2021-09-14 18:06:22','2021-09-14 19:43:52');
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'quia',NULL),(2,'suscipit',NULL),(3,'omnis',NULL),(4,'iste',NULL),(5,'doloremque',NULL),(6,'suscipit',NULL),(7,'qui',NULL),(8,'aperiam',NULL),(9,'enim',NULL),(10,'nulla',NULL);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `order_product_id` bigint unsigned NOT NULL,
  `adress_id` bigint unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `adress_id` (`adress_id`),
  KEY `order_product_id` (`order_product_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`adress_id`) REFERENCES `adress` (`id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`order_product_id`) REFERENCES `orders_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,1,'2021-09-28 02:03:34','2021-10-03 22:17:32'),(2,2,2,2,'2021-08-27 17:48:13','2021-09-06 22:02:41'),(3,3,3,3,'2021-09-01 11:09:31','2021-10-06 19:46:36'),(4,4,4,4,'2021-08-26 09:13:17','2021-09-16 06:07:12'),(5,5,5,5,'2021-09-15 11:21:31','2021-10-02 04:22:49'),(6,6,6,6,'2021-02-16 05:52:42','2021-03-02 10:15:55'),(7,7,7,7,'2021-06-30 01:26:20','2021-07-23 23:26:43'),(8,8,8,8,'2021-04-13 04:20:19','2021-05-10 17:21:37'),(9,9,9,9,'2021-08-03 05:19:11','2021-09-21 10:05:02'),(10,10,10,10,'2021-04-01 03:02:13','2021-08-18 13:52:15');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_product`
--

DROP TABLE IF EXISTS `orders_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `color_id` bigint unsigned NOT NULL,
  `size_id` bigint unsigned NOT NULL,
  `total` int unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `product_id` (`product_id`),
  KEY `color_id` (`color_id`),
  KEY `size_id` (`size_id`),
  CONSTRAINT `orders_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `orders_product_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `product_colors` (`id`),
  CONSTRAINT `orders_product_ibfk_3` FOREIGN KEY (`size_id`) REFERENCES `product_size` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_product`
--

LOCK TABLES `orders_product` WRITE;
/*!40000 ALTER TABLE `orders_product` DISABLE KEYS */;
INSERT INTO `orders_product` VALUES (1,1,1,1,2),(2,2,2,2,6),(3,3,3,3,1),(4,4,4,4,4),(5,5,5,5,3),(6,6,6,6,1),(7,7,7,7,4),(8,8,8,8,5),(9,9,9,9,1),(10,10,10,10,1);
/*!40000 ALTER TABLE `orders_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_products`
--

DROP TABLE IF EXISTS `photo_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `photo_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `color_id` bigint unsigned DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `photo_id` (`photo_id`),
  KEY `product_id` (`product_id`),
  KEY `color_id` (`color_id`),
  CONSTRAINT `photo_products_ibfk_1` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`),
  CONSTRAINT `photo_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `photo_products_ibfk_3` FOREIGN KEY (`color_id`) REFERENCES `product_colors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_products`
--

LOCK TABLES `photo_products` WRITE;
/*!40000 ALTER TABLE `photo_products` DISABLE KEYS */;
INSERT INTO `photo_products` VALUES (1,1,1,1),(2,2,2,2),(3,3,3,3),(4,4,4,4),(5,5,5,5),(6,6,6,6),(7,7,7,7),(8,8,8,8),(9,9,9,9),(10,10,10,10);
/*!40000 ALTER TABLE `photo_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category` enum('men','women','kids','accesories') DEFAULT NULL,
  `product_id` bigint unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'men',1),(2,'kids',2),(3,'accesories',3),(4,'men',4),(5,'kids',5),(6,'accesories',6),(7,'women',7),(8,'kids',8),(9,'accesories',9),(10,'women',10);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_colors`
--

DROP TABLE IF EXISTS `product_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_colors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `colors` char(30) NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_colors_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_colors`
--

LOCK TABLES `product_colors` WRITE;
/*!40000 ALTER TABLE `product_colors` DISABLE KEYS */;
INSERT INTO `product_colors` VALUES (1,'#561e5b',1),(2,'#9fa3d6',2),(3,'#02cb31',3),(4,'#78aaad',4),(5,'#9acad7',5),(6,'#6f128b',6),(7,'#932f95',7),(8,'#9edb8e',8),(9,'#4b39ea',9),(10,'#212ecd',10);
/*!40000 ALTER TABLE `product_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_size`
--

DROP TABLE IF EXISTS `product_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_size` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sizes` char(4) NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_size_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_size`
--

LOCK TABLES `product_size` WRITE;
/*!40000 ALTER TABLE `product_size` DISABLE KEYS */;
INSERT INTO `product_size` VALUES (1,'56',1),(2,'38',2),(3,'0',3),(4,'48',4),(5,'21',5),(6,'0',6),(7,'52',7),(8,'24',8),(9,'0',9),(10,'42',10);
/*!40000 ALTER TABLE `product_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `article` int unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `brand_id` bigint unsigned DEFAULT NULL,
  `description` text,
  `price` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand_name` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,2560,'ad',1,'Et mollitia et est minus ut repudiandae delectus odio. Rerum fugit pariatur quod iste similique sit quasi. Maxime consequatur animi possimus aut provident laudantium. Vero rerum iure eveniet fugit adipisci ut.',6399.00),(2,254364,'sunt',2,'Repellat pariatur ab cum quos nobis. Et non placeat iure qui. Distinctio unde facere quam provident.',320.00),(3,4836052,'perspiciatis',3,'Et occaecati officiis omnis accusamus voluptatum nemo voluptatum alias. Autem omnis ut quod quidem. Sit ut omnis quia laborum. Distinctio dolorem eveniet omnis rem fugit hic dolorem.',475.01),(4,85786,'excepturi',4,'Eos temporibus sunt necessitatibus harum nihil harum itaque. Consectetur dolorem aut inventore pariatur dolore dolorem sed. Vitae quas qui qui perferendis et quasi voluptatem. Qui ut doloribus aut deleniti quia ut.',364.18),(5,867325,'error',5,'Reiciendis vero enim minus doloribus et dolores consequatur sint. Sed debitis et voluptatem enim. Laudantium ea modi vitae sunt reiciendis. Nostrum officia et placeat eos aut voluptate dolores.',250.00),(6,25867,'voluptatibus',6,'Nostrum omnis voluptatem quia esse sit veniam est. At cumque mollitia distinctio reiciendis consequatur iure. Qui sit et molestiae quae corrupti aliquam voluptas.',508.42),(7,3866,'cum',7,'Accusamus eius ipsam quia. Velit et quisquam quisquam autem debitis. Consequuntur dignissimos nostrum esse voluptas expedita omnis.',364.00),(8,876788,'nihil',8,'Odit autem et praesentium sint eius libero quas. Dolores autem quis modi quia repudiandae suscipit. Minima quo nihil aliquam qui.',222.20),(9,897676,'perferendis',9,'Voluptas eligendi ipsum omnis incidunt quia omnis. Hic ratione nihil nemo hic. Laboriosam ad repellat quidem laborum minima molestiae.',842.76),(10,3987569,'distinctio',10,'Voluptatibus qui repudiandae id cum odit consequatur animi. Et repellat accusamus eveniet architecto nulla pariatur adipisci. Sed accusantium sequi et pariatur illo. Consequatur distinctio impedit voluptatem minima.',605.80);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_product`
--

DROP TABLE IF EXISTS `reviews_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `body` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `reviews_product_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `reviews_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_product`
--

LOCK TABLES `reviews_product` WRITE;
/*!40000 ALTER TABLE `reviews_product` DISABLE KEYS */;
INSERT INTO `reviews_product` VALUES (1,1,1,'Reiciendis voluptas voluptate repudiandae est itaque explicabo. Qui vero laborum necessitatibus consequatur ea pariatur. Ut omnis debitis atque ea consequatur pariatur aut. Quibusdam voluptatem corrupti eos odio eius.','2021-03-08 15:56:25','2021-05-24 13:54:04'),(2,2,2,'Dolores enim non ipsa nam voluptas aliquam pariatur. Modi dignissimos eligendi deleniti sint rerum corporis. Mollitia voluptates aut sapiente excepturi. Commodi assumenda amet voluptatem et cupiditate.','2021-08-02 07:50:18','2021-09-30 21:49:37'),(3,3,3,'In voluptatibus suscipit et quia voluptatem nihil nulla. Sit provident rem deserunt deserunt veniam esse repudiandae. Et enim sunt quia sint aut autem voluptates.','2021-05-05 03:59:25','2021-09-18 05:57:32'),(4,4,4,'Assumenda ut labore omnis aut vitae eos. Delectus quis hic est quidem exercitationem omnis inventore. Aut molestiae velit voluptatum animi dicta. Ut minus sit cupiditate fuga molestiae cumque impedit.','2021-02-16 20:05:50','2021-03-29 12:04:12'),(5,5,5,'Pariatur perferendis quisquam cum amet non facere. Sapiente nesciunt ut tempore dolorum nostrum dolorum. Deserunt voluptates qui quod quis ex quo. Accusamus sed quibusdam optio atque.','2021-06-06 14:42:23','2021-07-27 12:35:13'),(6,6,6,'Quod nemo dolorem sapiente consequatur deserunt est. At ea et soluta necessitatibus aspernatur autem. Officiis nisi vero assumenda aut aut totam. Perferendis eos doloribus accusantium soluta ipsam cum.','2021-06-09 07:10:29','2021-08-30 12:43:13'),(7,7,7,'Commodi dolor ut voluptas ut. Qui et excepturi eaque nesciunt omnis. Commodi et quibusdam consequatur doloribus. Iste nihil ut ut.','2021-09-01 12:33:22','2021-09-11 14:43:16'),(8,8,8,'Eos hic est soluta repudiandae pariatur qui quia. Error doloremque maiores est pariatur commodi. Sequi quo aliquam magni totam expedita.','2021-09-04 16:51:07','2021-09-09 18:04:39'),(9,9,9,'Quos neque nemo fugit iusto eaque culpa. Laborum dicta voluptatibus id fugit aut sed quasi. Et cum ut ad accusamus culpa recusandae iste. Nihil aperiam et aperiam itaque et ab ducimus.','2021-09-08 09:07:20','2021-09-25 14:01:05'),(10,10,10,'Doloremque optio autem rerum harum voluptatum incidunt est. Soluta non voluptatem perspiciatis est id. Aut quo nulla voluptas unde porro.','2021-09-11 14:31:24','2021-09-10 02:46:31');
/*!40000 ALTER TABLE `reviews_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_shop`
--

DROP TABLE IF EXISTS `reviews_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_shop` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `body` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_shop_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_shop`
--

LOCK TABLES `reviews_shop` WRITE;
/*!40000 ALTER TABLE `reviews_shop` DISABLE KEYS */;
INSERT INTO `reviews_shop` VALUES (1,1,'Voluptatem accusamus odio provident labore aperiam voluptatem molestias deserunt. Incidunt dolor saepe magnam ipsam. Magnam error odio neque.','2021-01-29 06:05:04','2021-06-13 08:45:52'),(2,2,'Vero quia sint id. Harum consequatur a saepe non odit provident ex. Quisquam incidunt aperiam ipsam assumenda.','2021-01-15 09:44:58','2021-01-25 15:51:43'),(3,3,'Eos optio quia repellendus et. Nam deleniti unde porro nostrum aut. Qui odit soluta quae qui. Dolorem ea distinctio labore.','2021-03-08 17:09:54','2021-07-10 07:57:17'),(4,4,'Id quo earum animi commodi laboriosam dolorum. Rerum ut quas totam. Rem id placeat delectus voluptas necessitatibus nam dolorum.','2021-02-26 23:54:50','2021-03-25 12:46:49'),(5,5,'Incidunt ab aliquam cupiditate commodi saepe modi iure. Molestias voluptatibus quam est repudiandae vel.','2021-04-28 11:34:49','2021-05-11 23:26:30'),(6,6,'Sed quo nostrum et eos voluptatum. Sapiente sapiente non voluptate voluptatum. Vel modi voluptatem possimus consequatur illo sunt labore et. Minus quis sunt facere voluptas.','2021-09-05 18:59:45','2021-09-12 01:23:49'),(7,7,'Consequatur voluptas libero laborum magni esse ipsam eaque. Maxime et minima soluta ipsum cumque ipsum.','2021-01-13 11:28:32','2021-01-29 13:46:46'),(8,8,'Maxime debitis magnam deleniti accusantium. Voluptatem incidunt cum autem voluptatem ut animi praesentium. Quod autem quasi porro ex minima officia. Cumque culpa vel voluptas.','2021-06-29 23:50:46','2021-07-14 13:30:11'),(9,9,'Dolore autem commodi dolor sunt. Consequatur voluptate nam suscipit tempora. Eum aut officiis delectus eaque consectetur repudiandae velit sit.','2021-05-20 20:07:49','2021-06-08 22:05:24'),(10,10,'Commodi debitis perspiciatis optio aspernatur non. Necessitatibus aut omnis ipsum fugiat natus numquam omnis. Occaecati minima est alias occaecati officiis aut.','2021-09-08 00:08:44','2021-09-10 08:42:22');
/*!40000 ALTER TABLE `reviews_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_goods`
--

DROP TABLE IF EXISTS `types_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types_goods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `types` varchar(255) NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `types_goods_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_goods`
--

LOCK TABLES `types_goods` WRITE;
/*!40000 ALTER TABLE `types_goods` DISABLE KEYS */;
INSERT INTO `types_goods` VALUES (1,'shirt',1),(2,'polo',2),(3,'belt of trousers',3),(4,'trousers',4),(5,'shorts',5),(6,'wallet',6),(7,'sweater',7),(8,'pullover',8),(9,'scarf',9),(10,'skirt',10);
/*!40000 ALTER TABLE `types_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `photo_id` bigint unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`),
  KEY `photo_id` (`photo_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Wanda','Auer','khalid77@example.net','f','615dfc1b72c143c3b957d9c461411c825c1912dc',1,'2021-06-19 06:19:40'),(2,'Gonzalo','Hansen','lcrist@example.com','m','1b3d4a1b7abb60ce7e430351e81b572cf061461c',2,'2021-06-15 20:43:57'),(3,'Leopold','Runte','alanis77@example.net','f','e942b4f327e458d2eaf9a90f504db5fceef75c40',3,'2021-03-18 15:09:47'),(4,'Merle','Armstrong','tlind@example.com','f','7bdaff3dbd3ab5994cc0825c43cc9414a5a0da36',4,'2021-07-21 21:23:35'),(5,'Dariana','Ebert','kaelyn.kling@example.org','m','836d2af116ac726787266c3a17e074ff7aa743af',5,'2021-09-30 08:08:57'),(6,'Merritt','Rowe','nstehr@example.com','m','8d735cf6ebfe92d8ec8d9c21db69723bd8eed598',6,'2021-12-08 17:43:42'),(7,'Rhett','Murazik','elna90@example.net','m','df8264139876e54418d93ba24d106b3a4ce126d8',7,'2021-07-03 11:40:24'),(8,'Jaime','Renner','watson75@example.com','f','0e4e27fdb422290fb18a26cb9e45f8e6b1bc489c',8,'2021-10-19 07:49:01'),(9,'Leonor','O\'Conner','brock.kuvalis@example.org','f','e4a548ba8af17ce01f97c041ddabe6ac685b2982',9,'2021-08-24 15:40:57'),(10,'Ressie','Hessel','walker.becker@example.net','f','8ca1d81689d4d51b39cbdb749c5950c64ab4881a',10,'2021-11-17 09:54:24');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-21 20:38:55
