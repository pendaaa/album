-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: albumDB
-- ------------------------------------------------------
-- Server version	8.0.13

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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `utilisateur_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9l0v6nfn1mq4drbg609n4578o` (`utilisateur_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (17,'zertyui','Travel',1,1),(18,'fashion pic','Fashion',0,1),(20,'azertyuikl','fitness',1,2),(21,'azertyui','vacance',0,2),(30,'photo de soleil','Sun',1,2),(37,'photo avions','fly',1,34);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (64),(64),(64);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` bigint(20) NOT NULL,
  `date_creation` datetime DEFAULT NULL,
  `date_maj` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `hauteur` bigint(20) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `largeur` bigint(20) DEFAULT NULL,
  `mots_cles` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `album_id` bigint(20) DEFAULT NULL,
  `utilisateur_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKklgd5pxhpuh3nwik115myord` (`album_id`),
  KEY `FKl4kyvmxoybkk0gblklui0nuhj` (`utilisateur_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (27,NULL,NULL,'azerty',12,'sample.jpg',13,'az er','friends',18,1),(29,NULL,NULL,'photo de moi',12,'moi.jpg',15,'me my','me',20,2),(31,NULL,NULL,'Photo de eclipse luna',12,'2896.jpg',30,'eclipse soleil lune','eclipse luna',30,2),(32,NULL,NULL,'Photo de eclipse neon',13,'f4c83f490ec3dc548bfd03873b422646.jpg',16,'neon eclipse soleil','eclipse neon',30,2),(33,NULL,NULL,'Photo de eclipse lunar',5,'lunar-eclipse-folkestone--wallpaper.jpg',12,'lunar','eclipse lunar',30,2),(41,NULL,NULL,'tester',12,'1001310.jpg',14,'test test','test',18,1),(42,NULL,NULL,'avion',12,'aircraft-landing-sunset.jpg',34,'soleil vol','vol',18,1),(45,NULL,NULL,'azert',12,'the-morning-sun-wallpaper.jpg',13,'zer hj','pmo',18,1),(49,NULL,NULL,'testr',12,'Wallpaper-Lunar-Eclipse.jpg',14,'pp','testp',48,1),(55,NULL,NULL,'aze',12,'2896.jpg',43,'az','ze',NULL,NULL),(60,NULL,NULL,'sdfghjk',12,'310172.jpg',13,'az','qsdf',17,1),(62,NULL,NULL,'qsdfghjk',12,'1001310.jpg',23,'qsdfghj','yui',17,1),(63,'2020-02-27 12:56:11','2020-02-27 12:56:11','fruits',13,'1001310.jpg',32,'az om po','pomme',17,1);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateur` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,'Bachir','Diop','bach','passer',0),(2,'Penda','Faye','Peno','passer',1),(14,'Mami','Faye','mamii','passer',1),(46,'Mane','Fall','manx','passer',1),(34,'sophie','ndiaye','sonx','passer',0),(39,'Awa','Faye','eva','passer',1);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-27 14:15:34
