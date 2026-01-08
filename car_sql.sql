-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: car_sql
-- ------------------------------------------------------
-- Server version	8.4.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `seats` int DEFAULT NULL,
  `consum` decimal(5,1) DEFAULT NULL,
  `productdate` date DEFAULT NULL,
  `rentmoney` decimal(10,2) DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_username` (`username`),
  CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (13,'MITSUBISHI LANCER EVOLUTION','蓝',4,64.0,'2024-12-20',5000.00,'2024-12-20','admin'),(14,'BMW Z4 LCI E89','红',4,52.5,'2024-12-20',5000.00,'2024-12-20','admin'),(15,'CHEVROLET CAMARO LT','黄',4,63.3,'2024-12-20',5000.00,'2024-12-20','admin'),(16,'NISSAN 370Z NISMO','白',4,67.1,'2024-12-20',5000.00,'2024-12-20','admin'),(17,'DODGE CHALLENGER SRT8','黑',4,52.5,'2024-12-20',5200.00,'2024-12-20','admin'),(18,'VOLKSWANGEN XL SPORT CONCEPT','蓝',4,51.3,'2024-12-20',5000.00,'2024-12-20','admin'),(19,'BMW 3.0 CSL HOMMAGE','黄绿',4,46.6,'2024-12-20',7500.00,'2024-12-20','admin'),(20,'CHEVROLET CAMARO ZL1 50TH EDITION','黄',4,47.9,'2024-12-20',7500.00,'2024-12-20','admin'),(21,'DS AUTOMOBILES DS E-TENSE','深蓝',4,65.8,'2024-12-20',7500.00,'2024-12-20','admin'),(22,'PORSCHE Boxster 25th','白',4,38.8,'2024-12-20',16500.00,'2024-12-20','admin'),(23,'INFINITI PROJECT BLACK S','黑',4,47.9,'2024-12-20',10000.00,'2024-12-20','admin'),(24,'Praga R1','白',1,42.3,'2024-12-20',22500.00,'2024-12-20','admin'),(25,'LOTUS EVORA SPORT 410','深绿',4,38.7,'2024-12-20',9000.00,'2024-12-20','admin'),(26,'DODGE CHALLENGER 392 HEMI SCAT PACK','紫',4,54.1,'2024-12-20',9000.00,'2024-12-20','admin'),(27,'PORSCHE 911 GTS COUPE','黄',2,46.8,'2024-12-20',9000.00,'2024-12-20','admin'),(28,'MERCEDES-BENZ AMG GT S','黄',4,44.1,'2024-12-20',10000.00,'2024-12-20','admin'),(29,'PORSCHE 718 CAYMAN','灰',4,46.9,'2024-12-20',10000.00,'2024-12-20','admin'),(30,'BMW M4 GTS','黑',4,43.1,'2024-12-20',10000.00,'2024-12-20','admin'),(31,'HONDA CIVIC TYPE-R','红',4,40.5,'2024-12-20',12500.00,'2024-12-20','admin'),(32,'PORSCHE TAYCAN TURBO S','灰白',4,40.9,'2024-12-20',12500.00,'2024-12-20','admin'),(33,'CHEVROLET CORVETTE C7.R','黄',2,41.3,'2024-12-20',15000.00,'2024-12-20','admin'),(34,'EXOTIC RIDES W70','红',2,43.1,'2024-12-20',12500.00,'2024-12-20','admin'),(35,'LAMBORGHINI ASTERION','深蓝',4,58.1,'2024-12-20',14200.00,'2024-12-20','admin'),(36,'PORSCHE 911 GT1 EVOLUTION','灰',2,60.1,'2024-12-20',17500.00,'2024-12-20','admin'),(37,'ASTON MARTIN DB12','深绿',4,55.8,'2024-12-20',27000.00,'2024-12-20','admin'),(38,'PORSCHE 911 GT2 RS CLUBSPORT','白+黄',2,55.0,'2024-12-20',45000.00,'2024-12-20','admin');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `unique_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','123456');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'car_sql'
--

--
-- Dumping routines for database 'car_sql'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-23  0:39:54
