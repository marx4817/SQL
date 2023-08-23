-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: mache_elektwonik
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `acha`
--

DROP TABLE IF EXISTS `acha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acha` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dat` date NOT NULL,
  `pwodwi` int NOT NULL,
  `itilizate` int NOT NULL,
  `kategori` int NOT NULL,
  `kantite` int NOT NULL DEFAULT '1',
  `kach_total` decimal(10,0) NOT NULL,
  `eskont` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_iti` (`itilizate`),
  KEY `Fk_pwo` (`pwodwi`),
  KEY `Fk_kate` (`kategori`),
  CONSTRAINT `Fk_iti` FOREIGN KEY (`itilizate`) REFERENCES `itilizate` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `Fk_kate` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`id`),
  CONSTRAINT `Fk_pwo` FOREIGN KEY (`pwodwi`) REFERENCES `pwodwi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acha`
--

LOCK TABLES `acha` WRITE;
/*!40000 ALTER TABLE `acha` DISABLE KEYS */;
INSERT INTO `acha` VALUES (1,'2023-08-22',1,1,1,2,2400,0),(2,'2023-08-22',2,1,1,1,600,100),(3,'2023-08-22',3,1,2,1,1000,50);
/*!40000 ALTER TABLE `acha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itilizate`
--

DROP TABLE IF EXISTS `itilizate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itilizate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `non` varchar(50) NOT NULL,
  `siyati` varchar(30) DEFAULT NULL,
  `imel` varchar(100) NOT NULL,
  `telefon` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `imel` (`imel`),
  UNIQUE KEY `telefon` (`telefon`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itilizate`
--

LOCK TABLES `itilizate` WRITE;
/*!40000 ALTER TABLE `itilizate` DISABLE KEYS */;
INSERT INTO `itilizate` VALUES (1,'Yousenie','Dorsainvil','youse@gmail.com','194949900'),(2,'Charleine','Lordeus','charleine@gmail.com','109309493');
/*!40000 ALTER TABLE `itilizate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategori` (
  `id` int NOT NULL AUTO_INCREMENT,
  `non` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES (1,'telefon'),(2,'laptop'),(3,'eneji');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panye`
--

DROP TABLE IF EXISTS `panye`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `panye` (
  `id` int NOT NULL AUTO_INCREMENT,
  `itilizate` int NOT NULL,
  `total` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_iti_pa` (`itilizate`),
  CONSTRAINT `Fk_iti_pa` FOREIGN KEY (`itilizate`) REFERENCES `itilizate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panye`
--

LOCK TABLES `panye` WRITE;
/*!40000 ALTER TABLE `panye` DISABLE KEYS */;
INSERT INTO `panye` VALUES (1,1,0);
/*!40000 ALTER TABLE `panye` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panyepwodwi`
--

DROP TABLE IF EXISTS `panyepwodwi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `panyepwodwi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pwodwi` int NOT NULL,
  `panye` int NOT NULL,
  `dat` date NOT NULL,
  `kantite` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_panye` (`panye`),
  KEY `FkPwod` (`pwodwi`),
  CONSTRAINT `FK_panye` FOREIGN KEY (`panye`) REFERENCES `panye` (`id`),
  CONSTRAINT `FkPwod` FOREIGN KEY (`pwodwi`) REFERENCES `pwodwi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panyepwodwi`
--

LOCK TABLES `panyepwodwi` WRITE;
/*!40000 ALTER TABLE `panyepwodwi` DISABLE KEYS */;
INSERT INTO `panyepwodwi` VALUES (1,4,1,'2023-08-20',2),(2,3,1,'2023-08-20',2);
/*!40000 ALTER TABLE `panyepwodwi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwodwi`
--

DROP TABLE IF EXISTS `pwodwi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pwodwi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `non` varchar(40) NOT NULL,
  `deskripsyon` text,
  `kantite_disponib` int NOT NULL DEFAULT '1',
  `foto` varchar(150) DEFAULT NULL,
  `vre_pri` decimal(10,0) NOT NULL,
  `ansyen_pri` decimal(10,0) DEFAULT NULL,
  `aktif` varchar(5) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwodwi`
--

LOCK TABLES `pwodwi` WRITE;
/*!40000 ALTER TABLE `pwodwi` DISABLE KEYS */;
INSERT INTO `pwodwi` VALUES (1,'iPhone 14 prox  max',NULL,5,NULL,1200,NULL,'yes'),(2,'Samsung Galaxie S9',NULL,10,NULL,500,NULL,'Yes'),(3,'Lenovo Thinkpad',NULL,15,NULL,950,NULL,'yes'),(4,'Batterie Trojan',NULL,3,NULL,150,NULL,'yes');
/*!40000 ALTER TABLE `pwodwi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwodwikategori`
--

DROP TABLE IF EXISTS `pwodwikategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pwodwikategori` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pwodwi` int NOT NULL,
  `kategori` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_pwodwi` (`pwodwi`),
  KEY `Fk_kategori` (`kategori`),
  CONSTRAINT `Fk_kategori` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Fk_pwodwi` FOREIGN KEY (`pwodwi`) REFERENCES `pwodwi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwodwikategori`
--

LOCK TABLES `pwodwikategori` WRITE;
/*!40000 ALTER TABLE `pwodwikategori` DISABLE KEYS */;
INSERT INTO `pwodwikategori` VALUES (1,1,1),(2,2,1),(3,3,2),(4,4,3);
/*!40000 ALTER TABLE `pwodwikategori` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-22 21:24:14
