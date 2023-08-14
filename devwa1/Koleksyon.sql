-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: Koleksyon
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
-- Table structure for table `veyikil`
--

DROP TABLE IF EXISTS `veyikil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veyikil` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Mak` varchar(15) NOT NULL,
  `Model` varchar(20) NOT NULL,
  `Ane` int NOT NULL,
  `Pri` decimal(10,0) NOT NULL,
  `Seri` varchar(17) NOT NULL,
  `Total Plas` int NOT NULL,
  `Tip` char(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veyikil`
--

LOCK TABLES `veyikil` WRITE;
/*!40000 ALTER TABLE `veyikil` DISABLE KEYS */;
INSERT INTO `veyikil` VALUES (1,'Toyota','Rav4',2008,7771,'00AA6390439PPA',5,'MC'),(2,'Toyota','Land Cruiser',2009,25425,'29434BA0GF90032',8,'MC'),(3,'Suzuki','Grand Vitara',2010,7934,'856AG1200',5,'MC'),(4,'Subaru','Forester',2008,8320,'PPL45300A',5,'MC'),(5,'Jeep','Wrangler',2009,14076,'ZZA973JHA',4,'MC'),(6,'Nissan','Rogue',2010,6575,'258589YYY',5,'MC'),(7,'Honda','Pantheon',2008,1651,'AA28283',2,'MT'),(8,'Yamaha','YZF-R1',2009,8915,'MYQ11022',2,'MT'),(9,'Kawasaki','Teryx',2010,11699,'KL019879923A1',3,'MT');
/*!40000 ALTER TABLE `veyikil` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-14 14:25:53
