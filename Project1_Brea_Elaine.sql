CREATE DATABASE  IF NOT EXISTS `career_coaching_db` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `career_coaching_db`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: career_coaching_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `career_coach`
--

DROP TABLE IF EXISTS `career_coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `career_coach` (
  `coach_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `bio` varchar(500) DEFAULT NULL,
  `expertise_area` varchar(100) NOT NULL,
  PRIMARY KEY (`coach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `career_coach`
--

LOCK TABLES `career_coach` WRITE;
/*!40000 ALTER TABLE `career_coach` DISABLE KEYS */;
INSERT INTO `career_coach` VALUES (4,'Daniel','Smith','daniel.smith@careercoach.com','555-404-4004','Career coach with experience helping clients with job searches and interviews.','Interview Preparation'),(5,'Rachel','Brown','rachel.brown@careercoach.com','555-505-5005','Career coach specializing in resumes and professional development.','Resume Development'),(6,'Michael','Davis','michael.davis@careercoach.com','555-606-6006','Career coach helping clients plan career changes and professional goals.','Career Planning');
/*!40000 ALTER TABLE `career_coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `date_joined` date NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Maria','Lopez','maria.lopez@email.com','555-101-1001','2026-09-01'),(2,'James','Wilson','james.wilson@email.com','555-202-2002','2026-09-05'),(3,'Sofia','Martinez','sofia.martinez@email.com','555-303-3003','2026-09-10');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaching_session`
--

DROP TABLE IF EXISTS `coaching_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaching_session` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `coach_id` int NOT NULL,
  `session_date` date NOT NULL,
  `session_time` time NOT NULL,
  `session_type` varchar(50) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `status` varchar(30) NOT NULL,
  `notes` varchar(500) NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `fk_Coaching_session_Client_idx` (`client_id`),
  KEY `fk_coaching_session_coach_idx` (`coach_id`),
  CONSTRAINT `fk_Coaching_session_Client` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  CONSTRAINT `fk_coaching_session_coach` FOREIGN KEY (`coach_id`) REFERENCES `career_coach` (`coach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaching_session`
--

LOCK TABLES `coaching_session` WRITE;
/*!40000 ALTER TABLE `coaching_session` DISABLE KEYS */;
INSERT INTO `coaching_session` VALUES (13,1,4,'2026-09-15','10:00:00','Virtual',60,'Completed','Interview preparation session.'),(14,2,5,'2026-09-18','14:00:00','Virtual',45,'Completed','Resume review session.'),(15,3,6,'2026-09-25','11:30:00','Virtual',60,'Completed','Career planning session.');
/*!40000 ALTER TABLE `coaching_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `session_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` varchar(30) NOT NULL,
  `payment_status` varchar(30) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fk_payment_session_idx` (`session_id`),
  CONSTRAINT `fk_payment_session` FOREIGN KEY (`session_id`) REFERENCES `coaching_session` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,13,75.00,'2026-09-15','Credit Card','Paid'),(2,14,60.00,'2026-09-18','Debit Card','Paid'),(3,15,80.00,'2026-09-25','Credit Card','Paid');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `coach_id` int NOT NULL,
  `session_id` int NOT NULL,
  `rating` int NOT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `review_date` date NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `fk_review_client_idx` (`client_id`),
  KEY `fk_review_coach_idx` (`coach_id`),
  KEY `fk_review_session_idx` (`session_id`),
  CONSTRAINT `fk_review_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  CONSTRAINT `fk_review_coach` FOREIGN KEY (`coach_id`) REFERENCES `career_coach` (`coach_id`),
  CONSTRAINT `fk_review_session` FOREIGN KEY (`session_id`) REFERENCES `coaching_session` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,4,13,5,'Great interview preparation session.','2026-09-15'),(2,2,5,14,5,'Very helpful resume advice.','2026-09-18'),(3,3,6,15,4,'Helpful career planning session.','2026-09-25');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-28 18:15:53
