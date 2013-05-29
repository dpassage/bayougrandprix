-- MySQL dump 10.13  Distrib 5.1.43, for apple-darwin10.2.0 (i386)
--
-- Host: localhost    Database: bgpdev
-- ------------------------------------------------------
-- Server version	5.1.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drivers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,1,'Jazz',NULL,NULL),(2,2,'David Coulthard',NULL,NULL),(3,3,'Max Crash',NULL,NULL),(4,4,'Ayrton Senna',NULL,NULL),(5,5,'Jackie Stewart',NULL,NULL),(6,6,'Michael Schumacher',NULL,NULL),(7,7,'Kimi Raikk&ouml;nen',NULL,NULL),(8,8,'Mika H&auml;kkinen',NULL,NULL),(9,9,'Lorenzo Bandini',NULL,NULL),(10,10,'A.J. Foyt',NULL,NULL),(11,11,'Eileen Dover',NULL,NULL),(13,12,'Eville Coulthard',NULL,NULL),(14,13,'Mario Unser Jr.',NULL,NULL),(15,7,'Ben Dover',NULL,NULL),(16,14,'Dick Plunger',NULL,NULL),(17,15,'Franz Liependorf',NULL,NULL),(20,18,'Veera Cola',NULL,NULL),(21,19,'Pedro de la Rosa',NULL,NULL),(22,20,'Fernando Alonso',NULL,NULL),(23,21,'Kit Quick',NULL,NULL),(24,22,'Danica Patrick',NULL,NULL),(25,23,'Luca Badoer',NULL,NULL),(26,19,'Pedro de la Rosa',NULL,NULL),(27,25,'Rubens Barrichello',NULL,NULL),(28,26,'John Surtees',NULL,NULL),(29,28,'Nino Farina',NULL,NULL),(30,27,'Sebastian Vettel',NULL,NULL),(31,29,'Ricky Bobby',NULL,NULL),(32,30,'Sheila van Damm',NULL,NULL),(33,31,'Angel Rayo',NULL,NULL);
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Jeshua Rosestone','jeshuarosestone@hotmail.com',NULL,NULL),(2,'David Paschich','dpassage@balveda.com',NULL,NULL),(3,'Phil Sacks','',NULL,NULL),(4,'Peter Koning','',NULL,NULL),(5,'Andy Harris','',NULL,NULL),(6,'Ian Ricksecker','',NULL,NULL),(7,'Adam Rappoport','',NULL,NULL),(8,'Tim Hayman','',NULL,NULL),(9,'Ian Toll','',NULL,NULL),(10,'Robert Giedt','',NULL,NULL),(11,'Jen Rost','',NULL,NULL),(12,'David Ziring','zeke@thebayou.net',NULL,NULL),(13,'Porter Venn','',NULL,NULL),(14,'Eric Mueller','',NULL,NULL),(15,'Martin Taber','',NULL,NULL),(18,'Stacey Gould','',NULL,NULL),(19,'Steve Miller','s47miller@yahoo.com',NULL,NULL),(20,'Solomon Gorlick','solomongorlick@yahoo.com',NULL,NULL),(21,'Bridget Segurson','',NULL,NULL),(22,'Lisa Lutkenhouse','',NULL,NULL),(23,'Graah','',NULL,NULL),(25,'Bryan Duffel','',NULL,NULL),(26,'Simon Ka','',NULL,NULL),(27,'Bill Roper','',NULL,NULL),(28,'Kendrick Wright','',NULL,NULL),(29,'Michael Weiss','',NULL,NULL),(30,'Elspeth Golden','',NULL,NULL),(31,'Barak Engel','',NULL,NULL);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualresults`
--

DROP TABLE IF EXISTS `qualresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qualresults` (
  `race` int(11) NOT NULL,
  `driver` int(11) NOT NULL,
  `place` int(11) NOT NULL,
  `dnf` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualresults`
--

LOCK TABLES `qualresults` WRITE;
/*!40000 ALTER TABLE `qualresults` DISABLE KEYS */;
INSERT INTO `qualresults` VALUES (18,7,1,0),(18,6,2,0),(18,9,3,0),(18,3,9,0),(18,11,4,0),(18,5,10,0),(18,2,8,0),(18,10,6,0),(18,8,5,0),(18,1,7,0),(9,6,7,0),(9,10,4,0),(9,2,5,0),(9,5,6,0),(9,7,1,0),(9,3,3,0),(9,4,9,0),(9,1,8,0),(9,11,10,0),(9,8,2,0),(10,6,1,0),(10,7,2,0),(10,2,3,0),(10,10,4,0),(10,3,5,0),(10,8,6,0),(10,1,7,0),(10,11,8,0),(10,5,9,0),(10,4,10,0),(8,10,5,0),(8,6,1,0),(8,8,6,0),(8,1,4,0),(8,3,8,0),(8,2,2,0),(8,11,10,0),(8,5,7,0),(8,7,9,0),(8,4,3,0),(13,5,4,0),(13,8,1,0),(13,7,7,0),(13,4,8,0),(13,2,2,0),(13,3,3,0),(13,1,6,0),(13,11,9,0),(13,10,5,0),(11,7,6,0),(11,2,5,0),(11,3,4,0),(11,8,1,0),(11,6,3,0),(11,5,10,0),(11,10,7,0),(11,11,2,0),(11,1,9,0),(11,4,8,0),(12,6,5,0),(12,7,3,0),(12,3,2,0),(12,10,4,0),(12,8,8,0),(12,1,9,0),(12,2,1,0),(12,11,7,0),(12,5,6,0),(1,6,1,0),(1,10,2,0),(1,2,3,0),(1,1,4,0),(1,4,5,0),(1,11,6,0),(1,8,7,0),(1,5,8,0),(1,3,9,0),(1,7,10,0),(14,6,1,0),(14,8,2,0),(14,3,3,0),(14,9,4,0),(14,2,5,0),(14,10,6,0),(14,5,7,0),(14,1,8,0),(14,11,9,0),(14,4,10,0),(16,6,1,0),(16,10,2,0),(16,3,3,0),(16,8,4,0),(16,9,5,0),(16,5,6,0),(16,1,7,0),(16,11,8,0),(16,2,9,0),(16,4,10,0),(17,3,1,0),(17,10,2,0),(17,9,3,0),(17,6,4,0),(17,4,5,0),(17,8,6,0),(17,11,7,0),(17,2,8,0),(17,1,9,0),(17,5,10,0),(15,2,1,0),(15,9,2,0),(15,10,3,0),(15,1,4,0),(15,6,5,0),(15,11,6,0),(15,8,7,0),(15,3,8,0),(15,5,9,0),(15,13,10,0),(31,6,2,0),(31,2,9,0),(31,3,4,0),(31,8,1,0),(31,5,3,0),(31,10,5,0),(31,11,7,0),(31,9,6,0),(31,14,8,0),(31,16,10,0),(32,8,1,0),(32,9,2,0),(32,10,3,0),(32,2,4,0),(32,5,5,0),(32,16,6,0),(32,3,8,0),(32,14,9,0),(32,6,10,0),(32,11,7,0),(33,9,1,0),(33,16,2,0),(33,6,3,0),(33,5,4,0),(33,10,5,0),(33,3,6,0),(33,8,7,0),(33,11,8,0),(33,14,9,0),(34,10,5,0),(34,5,4,0),(34,6,2,0),(34,14,8,0),(34,8,9,0),(34,16,10,0),(34,11,6,0),(34,9,3,0),(34,3,1,0),(34,2,7,0),(35,6,1,0),(35,8,2,0),(35,5,3,0),(35,11,4,0),(35,9,5,0),(35,14,6,0),(35,2,7,0),(35,16,8,0),(35,3,9,0),(35,20,10,0),(36,9,4,0),(36,2,9,0),(36,8,2,0),(36,3,3,0),(36,14,10,0),(36,11,7,0),(36,5,6,0),(36,16,8,0),(36,6,1,0),(36,10,5,0),(37,8,1,0),(37,5,2,0),(37,6,3,0),(37,3,4,0),(37,9,5,0),(37,2,6,0),(37,16,7,0),(37,10,8,0),(37,14,9,0),(37,13,10,0),(38,8,1,0),(38,6,4,0),(38,2,2,0),(38,16,3,0),(38,10,5,0),(38,14,6,0),(38,3,9,0),(38,9,8,0),(38,11,7,0),(39,6,1,0),(39,8,2,0),(39,10,3,0),(39,14,4,0),(39,5,5,0),(39,11,6,0),(39,3,7,0),(39,16,8,0),(39,9,9,0),(39,13,10,0),(40,6,1,0),(40,2,2,0),(40,5,3,0),(40,8,4,0),(40,11,5,0),(40,14,6,0),(40,10,7,0),(40,3,8,0),(40,16,9,0),(41,6,1,0),(41,2,4,0),(41,3,6,0),(41,8,2,0),(41,11,5,0),(41,5,8,0),(41,10,3,0),(41,16,9,0),(41,9,7,0),(41,14,10,0),(42,6,1,0),(42,5,2,0),(42,3,3,0),(42,9,4,0),(42,10,5,0),(42,11,6,0),(42,8,7,0),(42,16,8,0),(43,9,1,0),(43,8,2,0),(43,16,3,0),(43,10,4,0),(43,6,5,0),(43,2,6,0),(43,5,7,0),(43,21,8,0),(43,3,9,0),(43,22,10,0),(44,10,1,0),(44,9,2,0),(44,3,3,0),(44,8,4,0),(44,14,5,0),(44,5,6,0),(44,2,7,0),(44,6,8,0),(44,16,9,0),(44,21,10,0),(49,10,1,0),(49,8,2,0),(49,21,3,0),(49,16,4,0),(49,2,5,0),(49,5,6,0),(49,9,7,0),(49,22,8,0),(45,6,1,0),(45,2,2,0),(45,3,3,0),(45,10,4,0),(45,9,5,0),(45,16,6,0),(45,8,7,0),(45,11,8,0),(45,14,9,0),(46,3,1,0),(46,6,2,0),(46,9,3,0),(46,8,4,0),(46,22,5,0),(46,10,6,0),(46,16,7,0),(46,2,8,0),(46,21,9,0),(48,5,8,0),(48,10,6,0),(48,3,4,0),(48,22,2,0),(48,8,7,0),(48,9,1,0),(48,16,5,0),(48,21,9,0),(48,2,3,0),(47,8,1,0),(47,5,2,0),(47,21,3,0),(47,6,4,0),(47,9,5,0),(47,16,6,0),(47,10,7,0),(47,3,8,0),(47,22,9,0),(47,14,10,0),(50,8,1,0),(50,5,2,0),(50,10,3,0),(50,2,5,0),(50,3,4,0),(50,16,6,0),(50,9,7,0),(50,22,8,0),(50,21,9,0),(51,9,10,0),(51,8,1,0),(51,2,3,0),(51,5,2,0),(51,3,4,0),(51,21,5,0),(51,16,7,0),(51,22,9,0),(51,10,6,0),(51,11,8,0),(52,3,4,0),(52,8,1,0),(52,9,3,0),(52,10,6,0),(52,2,8,0),(52,22,7,0),(52,5,2,0),(52,21,5,0),(52,16,10,0),(52,6,9,0),(53,21,8,0),(53,3,2,0),(53,5,4,0),(53,10,5,0),(53,2,6,0),(53,9,3,0),(53,8,1,0),(53,16,7,0),(54,10,7,0),(54,16,6,0),(54,21,9,0),(54,2,10,0),(54,5,2,0),(54,8,5,0),(54,3,3,0),(54,9,1,0),(54,22,8,0),(54,11,4,0),(70,30,1,0),(70,3,2,0),(70,23,3,0),(70,8,4,0),(70,10,5,0),(70,28,6,0),(70,29,7,0),(70,24,8,0),(70,14,9,0),(71,10,1,0),(71,8,2,0),(71,3,3,0),(71,29,4,0),(71,2,5,0),(71,28,6,0),(71,30,7,0),(72,3,2,0),(72,28,9,0),(72,10,7,0),(72,24,3,0),(72,23,8,0),(72,8,5,0),(72,29,6,0),(72,5,1,0),(72,2,4,0),(73,8,1,0),(73,30,2,0),(73,10,3,0),(73,3,4,0),(73,23,5,0),(73,28,6,0),(73,24,7,0),(74,5,1,0),(74,3,2,0),(74,29,3,0),(74,30,4,0),(74,8,5,0),(74,24,6,0),(74,23,7,0),(74,10,8,0),(75,3,5,0),(75,8,1,0),(75,10,3,0),(75,23,6,0),(75,30,9,0),(75,24,8,0),(75,29,4,0),(75,28,7,0),(75,2,2,0),(76,10,1,0),(76,30,3,0),(76,2,9,0),(76,29,7,0),(76,24,5,0),(76,3,8,0),(76,28,4,0),(76,8,6,0),(76,5,2,0),(77,10,9,0),(77,3,2,0),(77,30,4,0),(77,2,3,0),(77,24,8,0),(77,28,5,0),(77,8,1,0),(77,29,6,0),(77,23,7,0),(78,10,1,0),(78,8,2,0),(78,30,3,0),(78,23,4,0),(78,24,5,0),(78,3,6,0),(78,29,7,0),(79,8,3,0),(79,3,6,0),(79,10,1,0),(79,29,5,0),(79,23,7,1),(79,30,8,1),(79,24,4,0),(79,2,2,0),(80,29,7,1),(80,2,2,0),(80,8,1,0),(80,10,3,0),(80,30,6,0),(80,28,5,0),(80,5,4,0),(81,8,8,0),(81,30,5,0),(81,29,7,0),(81,10,4,0),(81,28,1,0),(81,5,3,0),(81,2,9,0),(81,24,6,0),(81,23,10,0),(81,3,1,0),(82,33,1,0),(82,30,2,0),(82,8,3,0),(82,31,4,0),(82,3,5,0),(82,5,6,0),(82,28,7,0),(82,10,8,0),(82,29,9,0),(82,32,10,0),(83,33,1,0),(83,28,2,0),(83,8,3,0),(83,3,4,0),(83,23,5,0),(83,30,6,0),(83,32,7,0),(83,31,8,0),(83,10,9,0);
/*!40000 ALTER TABLE `qualresults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `racedrivers`
--

DROP TABLE IF EXISTS `racedrivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `racedrivers` (
  `race` int(11) NOT NULL,
  `driver` int(11) NOT NULL,
  `team` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `racedrivers`
--

LOCK TABLES `racedrivers` WRITE;
/*!40000 ALTER TABLE `racedrivers` DISABLE KEYS */;
INSERT INTO `racedrivers` VALUES (1,1,1),(1,2,2),(1,5,3),(1,7,4),(1,4,1),(1,8,4),(1,3,2),(1,11,5),(1,10,5),(1,6,3),(8,6,3),(8,10,5),(8,2,2),(8,5,3),(8,3,2),(8,7,4),(8,4,1),(8,11,5),(8,1,1),(8,8,4),(9,7,4),(9,3,2),(9,2,2),(9,11,5),(9,6,3),(9,8,4),(9,1,1),(9,5,3),(9,4,1),(9,10,5),(10,2,2),(10,7,4),(10,3,2),(10,8,4),(10,6,3),(10,5,3),(10,10,5),(10,11,5),(10,1,1),(10,4,1),(11,6,3),(11,7,4),(11,3,2),(11,10,5),(11,8,4),(11,1,1),(11,2,2),(11,4,1),(11,11,5),(11,5,3),(12,2,2),(12,5,3),(12,6,3),(12,10,5),(12,3,2),(12,8,4),(12,7,4),(12,11,5),(12,1,1),(13,8,4),(13,2,2),(13,5,3),(13,7,4),(13,3,2),(13,11,5),(13,1,1),(13,4,1),(13,10,5),(14,6,3),(14,3,2),(14,8,4),(14,9,4),(14,1,1),(14,5,3),(14,10,5),(14,2,2),(14,4,1),(14,11,5),(15,3,2),(15,11,5),(15,8,4),(15,10,5),(15,13,1),(15,2,2),(15,6,3),(15,9,4),(15,5,3),(15,1,1),(16,8,4),(16,10,5),(16,11,5),(16,5,3),(16,3,2),(16,4,1),(16,1,1),(16,2,2),(16,6,3),(16,9,4),(17,6,3),(17,9,4),(17,3,2),(17,11,5),(17,5,3),(17,2,2),(17,4,1),(17,10,5),(17,8,4),(17,1,1),(18,9,4),(18,7,1),(18,11,5),(18,2,2),(18,10,5),(18,8,4),(18,3,2),(18,5,3),(18,6,3),(18,1,1),(19,10,5),(19,5,5),(19,2,4),(19,16,7),(19,1,6),(19,6,3),(20,14,3),(20,10,5),(20,1,6),(20,3,6),(20,5,5),(20,2,4),(20,6,3),(31,3,2),(31,6,3),(31,10,3),(31,11,5),(31,8,4),(31,5,10),(31,16,10),(31,2,5),(31,14,4),(31,9,2),(32,8,4),(32,10,3),(32,11,5),(32,5,10),(32,9,2),(32,2,5),(32,6,3),(32,14,4),(32,3,2),(32,16,10),(33,5,10),(33,6,3),(33,14,4),(33,8,4),(33,16,10),(33,10,3),(33,11,5),(33,9,2),(33,3,2),(34,16,10),(34,11,5),(34,2,5),(34,6,3),(34,5,10),(34,9,2),(34,8,4),(34,10,3),(34,3,2),(34,14,4),(35,9,2),(35,2,5),(35,8,4),(35,3,2),(35,14,4),(35,20,3),(35,11,5),(35,5,10),(35,16,10),(35,6,3),(36,10,3),(36,2,5),(36,9,2),(36,6,3),(36,5,10),(36,3,2),(36,16,10),(36,14,4),(36,11,5),(36,8,4),(37,8,4),(37,6,3),(37,2,5),(37,16,10),(37,10,3),(37,14,4),(37,3,2),(37,13,5),(37,9,2),(37,5,10),(38,3,2),(38,10,3),(38,2,5),(38,8,4),(38,6,3),(38,9,2),(38,16,10),(38,14,4),(38,11,5),(39,8,4),(39,9,2),(39,6,3),(39,10,3),(39,11,5),(39,3,2),(39,16,10),(39,13,5),(39,14,4),(39,5,10),(40,6,3),(40,2,5),(40,3,2),(40,8,4),(40,11,5),(40,5,10),(40,10,3),(40,16,10),(40,14,4),(41,3,2),(41,6,3),(41,10,3),(41,14,4),(41,16,10),(41,5,10),(41,11,5),(41,8,4),(41,9,2),(41,2,5),(42,6,3),(42,5,10),(42,3,2),(42,11,5),(42,10,3),(42,8,4),(42,16,10),(42,9,2),(43,16,11),(43,5,3),(43,8,4),(43,22,5),(43,3,2),(43,6,3),(43,10,11),(43,9,4),(43,2,5),(43,21,2),(44,9,4),(44,2,5),(44,10,11),(44,5,3),(44,3,2),(44,8,4),(44,6,3),(44,21,2),(44,14,5),(44,16,11),(49,16,11),(49,8,4),(49,10,11),(49,21,2),(49,22,5),(49,2,5),(49,9,4),(49,5,3),(45,16,11),(45,10,11),(45,6,3),(45,2,5),(45,14,3),(45,11,2),(45,8,4),(45,3,2),(45,9,4),(46,6,3),(46,22,5),(46,10,11),(46,3,2),(46,8,4),(46,21,2),(46,16,11),(46,9,4),(46,2,5),(48,8,4),(48,5,3),(48,10,11),(48,2,5),(48,21,2),(48,3,2),(48,16,11),(48,9,4),(48,22,5),(47,5,3),(47,10,11),(47,14,5),(47,3,2),(47,22,5),(47,8,4),(47,9,4),(47,16,11),(47,21,2),(47,6,3),(50,9,4),(50,8,4),(50,2,5),(50,5,3),(50,3,2),(50,21,2),(50,22,5),(50,16,11),(50,10,11),(51,3,2),(51,8,4),(51,11,3),(51,9,4),(51,10,11),(51,2,5),(51,22,5),(51,5,3),(51,21,2),(51,16,11),(52,21,2),(52,3,2),(52,5,3),(52,22,5),(52,10,11),(52,2,5),(52,9,4),(52,8,4),(52,16,11),(52,6,3),(53,10,11),(53,16,11),(53,21,2),(53,2,5),(53,5,3),(53,8,4),(53,3,2),(53,9,4),(54,3,2),(54,2,5),(54,8,4),(54,5,3),(54,22,5),(54,10,11),(54,11,3),(54,16,11),(54,21,2),(54,9,4),(56,5,3),(56,14,2),(56,8,4),(56,17,4),(56,16,3),(56,21,11),(56,3,2),(56,10,11),(57,14,2),(57,3,2),(57,2,11),(57,17,4),(57,16,3),(57,8,4),(57,5,3),(58,16,3),(58,2,11),(58,5,3),(58,27,4),(58,9,2),(58,8,4),(58,10,11),(59,8,4),(59,3,2),(59,5,3),(59,17,4),(59,27,11),(59,10,11),(59,16,3),(60,10,11),(60,16,3),(60,3,2),(60,24,11),(60,5,3),(60,8,4),(60,14,2),(60,27,4),(61,3,2),(61,8,4),(61,2,11),(61,16,3),(61,24,13),(61,14,2),(61,5,3),(61,27,4),(61,10,11),(62,3,2),(62,8,4),(62,10,11),(62,16,3),(62,2,11),(62,25,3),(62,24,2),(62,9,4),(63,3,2),(63,24,4),(63,10,11),(63,2,11),(63,27,3),(63,8,4),(63,25,2),(64,3,2),(64,10,11),(64,14,2),(64,17,4),(64,5,3),(64,8,4),(64,27,3),(65,17,4),(65,14,2),(65,2,11),(65,10,11),(65,3,2),(65,16,3),(65,8,4),(66,16,3),(66,10,11),(66,3,2),(66,2,11),(66,17,4),(67,2,11),(67,8,4),(67,16,3),(67,14,2),(67,10,11),(67,3,2),(70,3,2),(70,28,2),(70,10,11),(70,24,11),(70,23,3),(70,30,12),(70,14,3),(70,8,4),(70,29,4),(71,10,11),(71,2,12),(71,8,4),(71,28,2),(71,29,4),(71,30,12),(71,3,2),(72,10,11),(72,5,3),(72,24,11),(72,2,12),(72,23,3),(72,28,2),(72,29,4),(72,3,2),(72,8,4),(73,3,2),(73,30,12),(73,8,4),(73,24,11),(73,10,11),(73,23,3),(73,28,2),(74,3,2),(74,8,4),(74,10,11),(74,23,3),(74,5,3),(74,30,12),(74,24,11),(74,29,4),(75,10,11),(75,30,12),(75,2,12),(75,23,3),(75,29,4),(75,24,11),(75,3,2),(75,28,2),(75,8,4),(76,10,11),(76,5,3),(76,3,2),(76,30,12),(76,2,12),(76,24,11),(76,28,2),(76,8,4),(76,29,4),(77,28,2),(77,29,4),(77,3,2),(77,30,12),(77,10,11),(77,8,4),(77,2,12),(77,24,11),(77,23,3),(78,8,4),(78,3,2),(78,10,11),(78,29,4),(78,23,3),(78,30,12),(78,24,11),(79,29,4),(79,2,12),(79,8,4),(79,10,11),(79,24,11),(79,30,12),(79,23,3),(79,3,2),(80,8,4),(80,30,12),(80,29,4),(80,10,11),(80,28,2),(80,5,3),(80,2,12),(81,3,2),(81,29,4),(81,23,3),(81,24,11),(81,10,11),(81,28,2),(81,30,12),(81,2,12),(81,5,3),(81,8,4),(82,30,3),(82,31,11),(82,3,2),(82,10,11),(82,32,4),(82,8,4),(82,28,2),(82,33,3),(82,5,14),(82,29,14),(83,8,4),(83,31,11),(83,30,3),(83,32,4),(83,28,2),(83,23,14),(83,3,2),(83,10,11),(83,33,3);
/*!40000 ALTER TABLE `racedrivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raceresults`
--

DROP TABLE IF EXISTS `raceresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raceresults` (
  `race` int(11) NOT NULL,
  `driver` int(11) NOT NULL,
  `place` int(11) NOT NULL,
  `dnf` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raceresults`
--

LOCK TABLES `raceresults` WRITE;
/*!40000 ALTER TABLE `raceresults` DISABLE KEYS */;
INSERT INTO `raceresults` VALUES (1,1,1,0),(1,5,2,0),(1,2,3,0),(1,10,9,1),(1,7,4,0),(1,4,5,0),(1,8,6,0),(1,3,7,0),(1,11,8,0),(1,6,10,1),(8,6,1,0),(8,10,2,0),(8,2,3,0),(8,5,4,0),(8,3,5,0),(8,7,6,0),(8,4,7,0),(8,11,8,1),(8,1,9,1),(8,8,10,1),(9,7,1,0),(9,3,2,0),(9,2,3,0),(9,11,4,0),(9,6,5,0),(9,8,6,0),(9,1,7,1),(9,5,8,1),(9,4,9,1),(9,10,10,1),(10,2,1,0),(10,7,2,0),(10,3,3,0),(10,8,4,0),(10,6,5,0),(10,5,6,0),(10,10,7,0),(10,11,8,0),(10,1,9,1),(10,4,10,1),(11,6,1,0),(11,7,2,0),(11,3,3,0),(11,10,4,0),(11,8,5,0),(11,1,6,0),(11,2,7,0),(11,4,8,0),(11,11,9,1),(11,5,10,1),(12,2,1,0),(12,5,2,0),(12,6,4,0),(12,10,3,0),(12,3,5,0),(12,8,6,0),(12,7,7,1),(12,11,8,1),(12,1,9,1),(13,8,1,0),(13,2,2,0),(13,5,3,0),(13,7,4,0),(13,3,5,0),(13,11,6,0),(13,1,7,0),(13,4,8,1),(13,10,9,1),(14,6,1,0),(14,3,2,0),(14,8,3,0),(14,9,4,0),(14,1,5,0),(14,5,6,0),(14,10,7,0),(14,2,8,0),(14,4,9,1),(14,11,10,1),(15,3,1,0),(15,11,2,0),(15,8,3,0),(15,10,4,1),(15,13,5,1),(15,2,6,1),(15,6,7,1),(15,9,8,1),(15,5,9,1),(15,1,10,1),(16,8,1,0),(16,10,2,0),(16,11,3,0),(16,5,4,0),(16,3,5,0),(16,4,6,0),(16,1,7,0),(16,2,8,1),(16,6,9,1),(16,9,10,1),(17,6,1,0),(17,9,2,0),(17,3,3,0),(17,11,4,0),(17,5,5,0),(17,2,6,0),(17,4,7,0),(17,10,8,1),(17,8,9,1),(17,1,10,1),(18,9,1,0),(18,7,2,0),(18,11,3,0),(18,2,4,0),(18,10,5,0),(18,8,6,0),(18,3,7,0),(18,5,8,0),(18,6,9,1),(18,1,10,1),(19,10,1,0),(19,5,2,0),(19,2,3,0),(19,16,4,0),(19,1,5,0),(19,6,6,0),(20,14,1,0),(20,10,2,0),(20,1,3,0),(20,3,4,0),(20,5,5,0),(20,2,6,0),(20,6,7,0),(31,3,1,0),(31,6,2,0),(31,10,3,0),(31,11,4,0),(31,8,5,0),(31,5,6,0),(31,16,7,0),(31,2,8,0),(31,14,9,1),(31,9,10,1),(32,8,1,0),(32,10,2,0),(32,11,3,0),(32,5,4,0),(32,9,5,0),(32,2,6,0),(32,6,7,0),(32,14,8,1),(32,3,9,1),(32,16,10,1),(33,5,1,0),(33,6,2,0),(33,14,3,0),(33,8,4,0),(33,16,5,0),(33,10,6,0),(33,11,7,0),(33,9,8,0),(33,3,9,1),(34,16,1,0),(34,11,2,0),(34,2,3,0),(34,6,4,0),(34,5,5,0),(34,9,6,0),(34,8,7,1),(34,10,8,1),(34,3,9,1),(34,14,10,1),(35,9,1,0),(35,2,2,0),(35,8,3,0),(35,3,4,0),(35,14,5,0),(35,20,6,0),(35,11,7,0),(35,5,8,0),(35,16,9,1),(35,6,10,1),(36,10,1,0),(36,2,2,0),(36,9,3,0),(36,6,4,0),(36,5,5,0),(36,3,6,0),(36,16,7,0),(36,14,8,0),(36,11,9,0),(36,8,10,1),(37,8,1,0),(37,6,2,0),(37,2,3,0),(37,16,4,0),(37,10,5,0),(37,14,6,0),(37,3,7,0),(37,13,8,0),(37,9,9,1),(37,5,10,1),(38,3,1,0),(38,10,2,0),(38,2,3,0),(38,8,4,0),(38,6,5,0),(38,9,6,0),(38,16,7,0),(38,14,8,1),(38,11,9,1),(39,8,1,0),(39,9,2,0),(39,6,3,0),(39,10,4,0),(39,11,5,0),(39,3,6,0),(39,5,7,0),(39,16,8,0),(39,14,9,1),(39,13,10,1),(40,6,1,0),(40,2,2,0),(40,3,3,0),(40,8,4,0),(40,11,5,0),(40,5,6,0),(40,10,7,0),(40,16,8,0),(40,14,9,1),(41,3,1,0),(41,6,2,0),(41,10,3,0),(41,14,4,0),(41,16,5,0),(41,5,6,0),(41,11,7,1),(41,8,8,1),(41,9,9,1),(41,2,10,1),(42,6,1,0),(42,5,2,0),(42,3,3,0),(42,11,4,0),(42,10,5,0),(42,8,6,0),(42,16,7,0),(42,9,8,1),(43,16,1,0),(43,5,2,0),(43,8,3,0),(43,22,4,0),(43,3,9,1),(43,6,10,1),(43,10,5,1),(43,9,6,1),(43,2,7,1),(43,21,8,1),(44,9,1,0),(44,2,2,0),(44,10,3,0),(44,5,4,0),(44,3,5,0),(44,8,6,0),(44,6,7,0),(44,21,8,1),(44,14,9,1),(44,16,10,1),(49,5,1,0),(49,16,2,0),(49,8,3,0),(49,10,4,0),(49,21,5,0),(49,22,6,0),(49,2,7,0),(49,9,8,1),(45,16,1,0),(45,10,2,0),(45,6,3,0),(45,2,4,0),(45,14,5,0),(45,11,6,0),(45,8,7,0),(45,3,8,1),(45,9,9,1),(46,6,1,0),(46,22,2,0),(46,10,3,0),(46,3,4,0),(46,8,5,1),(46,21,6,1),(46,16,7,1),(46,9,8,1),(46,2,9,1),(48,8,1,0),(48,5,2,0),(48,10,3,0),(48,2,4,0),(48,21,5,0),(48,3,6,0),(48,16,7,0),(48,9,8,1),(48,22,9,1),(47,5,1,0),(47,10,2,0),(47,14,3,0),(47,3,4,0),(47,22,5,0),(47,8,6,0),(47,9,7,0),(47,16,8,0),(47,21,9,0),(47,6,10,1),(50,9,1,0),(50,8,2,0),(50,2,3,0),(50,5,4,0),(50,3,5,0),(50,21,6,0),(50,16,7,0),(50,22,8,0),(50,10,9,1),(51,3,1,0),(51,8,2,0),(51,11,3,0),(51,9,4,0),(51,10,5,0),(51,2,6,0),(51,22,7,0),(51,5,8,0),(51,21,9,1),(51,16,10,1),(52,21,1,0),(52,3,2,0),(52,5,3,0),(52,22,4,0),(52,10,5,0),(52,2,6,0),(52,9,7,0),(52,8,8,0),(52,16,9,0),(52,6,10,1),(53,10,1,0),(53,16,2,0),(53,21,3,0),(53,2,4,0),(53,5,5,0),(53,8,6,1),(53,3,7,1),(53,9,8,1),(54,3,1,0),(54,2,2,0),(54,8,3,0),(54,5,4,0),(54,22,5,0),(54,10,6,0),(54,11,7,0),(54,16,8,0),(54,21,9,1),(54,9,10,1),(56,5,1,0),(56,14,2,0),(56,8,3,0),(56,17,4,0),(56,16,5,0),(56,21,6,0),(56,3,7,0),(56,10,8,1),(57,14,1,0),(57,3,2,0),(57,2,3,0),(57,17,4,0),(57,16,5,0),(57,8,6,1),(57,5,7,1),(58,16,1,0),(58,2,2,0),(58,5,3,0),(58,27,4,0),(58,9,5,0),(58,8,6,1),(58,10,7,1),(59,8,1,0),(59,3,2,0),(59,5,3,0),(59,17,4,0),(59,27,5,0),(59,10,6,0),(59,16,7,0),(60,10,1,0),(60,16,2,0),(60,3,3,0),(60,24,4,0),(60,5,5,0),(60,8,6,1),(60,14,7,1),(60,27,8,1),(61,3,1,0),(61,8,2,0),(61,2,3,0),(61,16,4,0),(61,24,5,0),(61,14,6,0),(61,5,7,0),(61,27,8,0),(61,10,9,1),(62,3,1,0),(62,8,2,0),(62,10,3,0),(62,16,4,0),(62,2,5,0),(62,25,6,0),(62,24,7,1),(62,9,8,1),(63,3,1,0),(63,24,2,0),(63,10,3,0),(63,2,4,0),(63,27,5,0),(63,8,6,0),(63,25,7,0),(64,3,1,0),(64,10,2,0),(64,14,3,0),(64,17,4,0),(64,5,5,0),(64,8,6,0),(64,27,7,1),(65,17,1,0),(65,14,2,0),(65,2,3,0),(65,10,4,0),(65,3,5,0),(65,16,6,1),(65,8,7,1),(66,16,1,0),(66,10,2,1),(66,3,3,1),(66,2,4,1),(66,17,5,1),(67,2,1,0),(67,8,2,0),(67,16,3,0),(67,14,4,0),(67,10,5,0),(67,3,6,0),(70,3,1,0),(70,28,2,0),(70,10,3,0),(70,24,4,0),(70,23,5,0),(70,30,6,0),(70,14,7,0),(70,8,8,1),(70,29,9,1),(71,10,1,0),(71,2,2,0),(71,8,3,0),(71,28,4,0),(71,29,5,0),(71,30,6,0),(71,3,7,1),(72,10,1,0),(72,5,2,0),(72,24,3,0),(72,2,4,0),(72,23,5,0),(72,28,6,0),(72,29,7,1),(72,3,8,1),(72,8,9,1),(73,3,1,0),(73,30,2,0),(73,8,3,0),(73,24,4,0),(73,10,5,0),(73,23,6,0),(73,28,7,0),(74,3,1,0),(74,8,2,0),(74,10,3,0),(74,23,4,0),(74,5,5,0),(74,30,6,0),(74,24,7,0),(74,29,8,1),(75,10,1,0),(75,30,2,0),(75,2,3,0),(75,23,4,0),(75,29,5,0),(75,24,6,0),(75,3,7,0),(75,28,8,1),(75,8,9,1),(76,10,1,0),(76,5,2,0),(76,3,3,0),(76,30,4,0),(76,2,5,0),(76,24,6,0),(76,28,7,1),(76,8,8,1),(76,29,9,1),(77,28,1,0),(77,29,2,0),(77,3,3,0),(77,30,4,0),(77,10,5,0),(77,8,6,0),(77,2,7,0),(77,24,8,0),(77,23,9,1),(78,8,1,0),(78,3,2,0),(78,10,3,0),(78,29,4,0),(78,23,5,0),(78,30,6,0),(78,24,7,0),(79,29,1,0),(79,2,2,0),(79,8,3,0),(79,10,4,0),(79,24,5,0),(79,30,6,0),(79,23,7,0),(79,3,8,1),(80,8,1,0),(80,30,2,0),(80,29,3,0),(80,10,4,0),(80,28,5,0),(80,5,6,1),(80,2,7,1),(81,3,1,0),(81,29,2,0),(81,23,3,0),(81,24,4,0),(81,10,5,0),(81,28,6,0),(81,30,7,0),(81,2,8,0),(81,5,9,0),(81,8,10,1),(82,30,1,0),(82,31,2,0),(82,3,3,0),(82,10,4,0),(82,32,5,0),(82,8,6,0),(82,28,7,0),(82,33,8,1),(82,5,9,1),(82,29,10,1),(83,8,1,0),(83,31,2,0),(83,30,3,0),(83,32,4,0),(83,28,5,0),(83,23,6,0),(83,3,9,1),(83,10,8,1),(83,33,7,1);
/*!40000 ALTER TABLE `raceresults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `races`
--

DROP TABLE IF EXISTS `races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `races` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `races`
--

LOCK TABLES `races` WRITE;
/*!40000 ALTER TABLE `races` DISABLE KEYS */;
INSERT INTO `races` VALUES (1,1,'2002-04-30'),(8,20,'2002-02-12'),(9,32,'2002-02-26'),(10,10,'2002-03-12'),(11,6,'2002-04-02'),(12,16,'2002-04-16'),(13,22,'2002-05-14'),(14,12,'2002-06-11'),(15,15,'2002-06-25'),(16,21,'2002-07-09'),(17,26,'2002-07-23'),(18,19,'2002-08-06'),(19,20,'2001-01-01'),(20,10,'2001-02-02'),(21,17,'2001-03-03'),(22,18,'2001-04-04'),(23,16,'2001-05-05'),(24,1,'2001-06-06'),(25,7,'2001-07-07'),(26,12,'2001-08-08'),(27,15,'2001-09-09'),(28,8,'2001-10-10'),(29,23,'2001-11-11'),(30,19,'2001-12-12'),(31,20,'2003-02-11'),(32,10,'2003-02-25'),(33,6,'2003-03-11'),(34,18,'2003-03-25'),(35,16,'2003-04-08'),(36,1,'2003-04-22'),(37,13,'2003-05-06'),(38,12,'2003-05-20'),(39,15,'2003-06-03'),(40,8,'2003-06-17'),(41,23,'2003-07-15'),(42,19,'2003-07-29'),(43,20,'2004-02-22'),(44,32,'2004-03-15'),(45,18,'2004-05-24'),(46,1,'2004-06-14'),(47,29,'2004-07-12'),(48,12,'2004-07-26'),(49,6,'2004-04-05'),(50,15,'2004-08-09'),(51,21,'2004-08-23'),(52,8,'2004-09-27'),(53,19,'2004-10-11'),(54,10,'2004-10-25'),(56,20,'2005-05-12'),(57,6,'2005-05-26'),(58,1,'2005-06-09'),(59,22,'2005-07-07'),(60,13,'2005-07-21'),(61,11,'2005-08-04'),(62,24,'2005-09-15'),(63,12,'2005-09-29'),(64,15,'2005-10-13'),(65,8,'2005-10-27'),(66,17,'2005-11-10'),(67,10,'2005-12-01'),(70,18,'2008-09-23'),(71,20,'2008-09-10'),(72,1,'2008-10-22'),(73,13,'2008-11-19'),(74,7,'2008-12-03'),(75,12,'2008-12-16'),(76,15,'2009-01-14'),(77,21,'2009-01-28'),(78,8,'2009-03-18'),(79,19,'2009-04-01'),(80,31,'2009-06-09'),(81,10,'2009-06-25'),(82,34,'2011-01-26'),(83,20,'2011-02-08');
/*!40000 ALTER TABLE `races` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `season` int(11) NOT NULL,
  `race` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,1),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(4,31),(4,32),(4,33),(4,34),(4,35),(4,36),(4,37),(4,38),(4,39),(4,40),(4,41),(4,42),(5,43),(5,44),(5,45),(5,46),(5,47),(5,48),(5,49),(5,50),(5,51),(5,52),(5,53),(5,54),(7,56),(7,57),(7,58),(7,59),(7,60),(7,61),(7,62),(7,63),(7,64),(7,65),(7,66),(7,67),(6,70),(6,71),(6,72),(6,73),(6,74),(6,75),(6,76),(6,77),(6,78),(6,79),(6,80),(6,81),(8,82),(8,83);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20110220074154'),('20110220193021'),('20110223042501'),('20110223055440'),('20110224061050'),('20110228014025');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scoring`
--

DROP TABLE IF EXISTS `scoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scoring` (
  `place` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `scheme` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scoring`
--

LOCK TABLES `scoring` WRITE;
/*!40000 ALTER TABLE `scoring` DISABLE KEYS */;
INSERT INTO `scoring` VALUES (1,10,1),(2,6,1),(3,4,1),(4,3,1),(5,2,1),(6,1,1),(1,10,2),(2,8,2),(3,6,2),(4,5,2),(5,4,2),(6,3,2),(7,2,2),(8,1,2),(7,0,1),(8,0,1),(9,0,1),(10,0,1),(11,0,1),(9,0,2),(10,0,2),(11,0,2),(1,9,3),(2,6,3),(3,4,3),(4,3,3),(5,2,3),(6,1,3),(7,0,3),(8,0,3),(9,0,3),(10,0,3),(11,0,3);
/*!40000 ALTER TABLE `scoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scoringschemes`
--

DROP TABLE IF EXISTS `scoringschemes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scoringschemes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scoringschemes`
--

LOCK TABLES `scoringschemes` WRITE;
/*!40000 ALTER TABLE `scoringschemes` DISABLE KEYS */;
INSERT INTO `scoringschemes` VALUES (1,'10-6-4-3-2-1'),(2,'10-8-6-5-4-3-2-1'),(3,'9-6-4-3-2-1');
/*!40000 ALTER TABLE `scoringschemes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_entries`
--

DROP TABLE IF EXISTS `season_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_entries` (
  `season_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `defaultteam` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_entries`
--

LOCK TABLES `season_entries` WRITE;
/*!40000 ALTER TABLE `season_entries` DISABLE KEYS */;
INSERT INTO `season_entries` VALUES (1,1,1,1),(1,2,2,2),(1,3,2,3),(1,4,1,4),(1,5,3,5),(1,6,3,6),(1,7,4,7),(1,8,4,8),(1,9,4,9),(1,10,5,10),(1,11,5,11),(1,13,1,12),(2,6,3,13),(2,14,3,14),(2,2,4,15),(2,8,4,16),(2,10,5,17),(2,5,5,18),(2,1,6,19),(2,3,6,20),(2,15,7,21),(2,16,7,22),(2,13,8,23),(2,11,8,24),(2,17,9,25),(4,6,3,26),(4,10,3,27),(4,2,5,28),(4,11,5,29),(4,3,2,30),(4,9,2,31),(4,8,4,32),(4,5,10,33),(4,14,4,34),(4,16,10,35),(4,20,3,36),(4,13,5,37),(5,2,5,38),(5,9,4,39),(5,3,2,40),(5,6,3,41),(5,5,3,42),(5,8,4,43),(5,21,2,44),(5,22,5,45),(5,10,11,46),(5,16,11,47),(5,14,8,48),(5,11,8,49),(7,14,2,50),(7,3,2,51),(7,16,3,52),(7,5,3,53),(7,10,11,54),(7,2,11,55),(7,17,4,56),(7,8,4,57),(7,24,13,58),(7,9,13,59),(7,25,13,60),(7,21,13,61),(7,27,13,62),(6,3,2,63),(6,28,2,64),(6,5,3,65),(6,23,3,66),(6,8,4,67),(6,29,4,68),(6,2,12,69),(6,30,12,70),(6,10,11,71),(6,24,11,72),(6,14,8,73),(8,10,11,74),(8,31,11,75),(8,3,2,76),(8,28,2,77),(8,8,4,78),(8,32,4,79),(8,29,14,80),(8,5,14,81),(8,30,3,82),(8,33,3,83),(8,23,8,84);
/*!40000 ALTER TABLE `season_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `scheme` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons`
--

LOCK TABLES `seasons` WRITE;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
INSERT INTO `seasons` VALUES (1,'2002',1,NULL,NULL),(2,'2001',1,NULL,NULL),(4,'2003',2,NULL,NULL),(5,'2004',3,NULL,NULL),(6,'2008',3,NULL,NULL),(7,'2005',3,NULL,NULL),(8,'2011',3,NULL,NULL);
/*!40000 ALTER TABLE `seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fake` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Jaguar','#00FF00',0,NULL,NULL),(2,'Axle of Evil','#FFFF00',0,NULL,NULL),(3,'Ferrari','#FF0000',0,NULL,NULL),(4,'McLaren','#0099FF',0,NULL,NULL),(5,'Williams','#FFFFFF',0,NULL,NULL),(6,'PowerBran','#00FF00',0,NULL,NULL),(7,'Mediocrity','#FFFF00',0,NULL,NULL),(8,'Substitutes','#999999',1,NULL,NULL),(9,'Rogue','#9900CC',0,NULL,NULL),(10,'Acura','#00FF00',0,NULL,NULL),(11,'Lotus-Tesla','#00FF00',0,NULL,NULL),(12,'Brabham','#FFFFFF',0,NULL,NULL),(13,'Toyota','#FFFFFF',0,NULL,NULL),(14,'BMW/Sauber','#FFFFFF',0,NULL,NULL);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks`
--

DROP TABLE IF EXISTS `tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=931 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks`
--

LOCK TABLES `tracks` WRITE;
/*!40000 ALTER TABLE `tracks` DISABLE KEYS */;
INSERT INTO `tracks` VALUES (1,'Monte Carlo','Monaco'),(2,'Zandvoort','Netherlands'),(3,'Zandvoort 2','Netherlands'),(4,'Spa-Francorchamps','Belgium'),(5,'Kyalami','South Africa'),(6,'Imola','San Marino'),(7,'Magny-Cours','France'),(8,'Monza','Italy'),(9,'Estoril','Portugal'),(10,'Interlagos','Brazil'),(11,'Watkins Glen','USA'),(12,'Silverstone','Great Britain'),(13,'Montreal','Canada'),(14,'Long Beach','USA'),(15,'Hockenheim','Germany'),(16,'Zeltweg','Austria'),(17,'Buenos Aires','Argentina'),(18,'Barcelona','Spain'),(19,'Suzuka','Japan'),(20,'Melbourne','Australia'),(21,'Budapest','Hungary'),(22,'Nurburgring','Germany'),(23,'Laguna Seca','California'),(24,'Portland','Oregon'),(25,'Elkhart Lake','Wisconsin'),(26,'Indianapolis','Indiana'),(27,'Detroit','Michigan'),(28,'Lexington','Ohio'),(29,'Atlanta','Georgia'),(30,'Daytona Beach','Florida'),(31,'Zhuhai','China'),(32,'Sepang','Malaysia'),(33,'10th Anniversary',''),(34,'Bahrain','Bahrain'),(926,'Indianapolis Oval','Indiana'),(930,'Daytona Beach Oval','Florida');
/*!40000 ALTER TABLE `tracks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-02-27 19:05:06
