-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: webshop_bk
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

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
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `id` int NOT NULL COMMENT 'id de la provincia',
  `desc_provincia` varchar(45) NOT NULL COMMENT 'nombre de la provincia',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='provincias';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'alava/araba'),(2,'albacete'),(3,'alicante'),(4,'almerÃ­a'),(5,'avila'),(6,'badajoz'),(7,'islas baleares'),(8,'barcelona'),(9,'burgos'),(10,'cÃ¡ceres'),(11,'cÃ¡diz'),(12,'castellÃ³n'),(13,'ciudad real'),(14,'cÃ³rdoba'),(15,'a coruÃ±a/la coruÃ±a'),(16,'cuenca'),(17,'gerona/girona'),(18,'granada'),(19,'guadalajara'),(20,'gipuzkoa/guipuzcoa'),(21,'huelva'),(22,'huesca'),(23,'jaen'),(24,'leÃ³n'),(25,'lÃ©rida/lleida'),(26,'la rioja'),(27,'lugo'),(28,'madrid'),(29,'mÃ¡laga'),(30,'murcia'),(31,'navarra'),(32,'orense/ourense'),(33,'asturias'),(34,'palencia'),(35,'las palmas'),(36,'pontevedra'),(37,'salamanca'),(38,'s.c.tenerife'),(39,'cantabria'),(40,'segovia'),(41,'sevilla'),(42,'soria'),(43,'tarragona'),(44,'teruel'),(45,'toledo'),(46,'valencia'),(47,'valladolid'),(48,'bizkaia/vizcaya'),(49,'zamora'),(50,'zaragoza'),(51,'ceuta'),(52,'melilla');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-04 19:19:10
