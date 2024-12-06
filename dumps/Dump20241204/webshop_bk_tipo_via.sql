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
-- Table structure for table `tipo_via`
--

DROP TABLE IF EXISTS `tipo_via`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_via` (
  `id` int NOT NULL COMMENT 'id del tipo de via',
  `desc_tipo_via` varchar(32) NOT NULL COMMENT 'denominacion del tipo de via',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='tipos de via';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_via`
--

LOCK TABLES `tipo_via` WRITE;
/*!40000 ALTER TABLE `tipo_via` DISABLE KEYS */;
INSERT INTO `tipo_via` VALUES (1,'acceso'),(2,'acequia'),(3,'acera'),(4,'alameda'),(5,'aldea'),(6,'alqueria'),(7,'alto'),(8,'andador'),(9,'angosta'),(10,'apartamentos'),(11,'apeadero'),(12,'arboleda'),(13,'arrabal'),(14,'arroyo'),(15,'atajo'),(16,'autopista'),(17,'autovia'),(18,'avenida'),(19,'bajada'),(20,'balneario'),(21,'barranco'),(22,'barreduela'),(23,'barriada'),(24,'barrio'),(25,'belena'),(26,'bloque'),(27,'brazal'),(28,'bulevar'),(29,'calexon'),(30,'caleya'),(31,'calle'),(32,'calleja'),(33,'callejon'),(34,'callejuela'),(35,'callizo'),(36,'calzada'),(37,'calzadas'),(38,'camino'),(39,'campa'),(40,'camping'),(41,'canal'),(42,'canella'),(43,'cantera'),(44,'cantina'),(45,'canton'),(46,'caÃ±ada'),(47,'carrera'),(48,'carrerada'),(49,'carrero'),(50,'carretera'),(51,'carreterin'),(52,'carretil'),(53,'carril'),(54,'casa'),(55,'cerro'),(56,'chalet'),(57,'cinturon'),(58,'circunvalacion'),(59,'cobertizo'),(60,'colonia'),(61,'complejo'),(62,'conjunto'),(63,'convento'),(64,'cooperativa'),(65,'corral'),(66,'corralillo'),(67,'corredor'),(68,'corrillo'),(69,'corriol'),(70,'cortijo'),(71,'costa'),(72,'costanilla'),(73,'costera'),(74,'cuadra'),(75,'cuesta'),(76,'cueva/s'),(77,'dehesa'),(78,'demarcacion'),(79,'diseminado'),(80,'dreÃ§era'),(81,'edificio/s'),(82,'eirado'),(83,'empresa'),(84,'entrada'),(85,'escalera/s'),(86,'escalinata'),(87,'espalda'),(88,'espigo'),(89,'estacion'),(90,'estrada'),(91,'explanada'),(92,'extramuros'),(93,'extrarradio'),(94,'fabrica'),(95,'falda'),(96,'finca'),(97,'galeria'),(98,'gallizo'),(99,'glorieta'),(100,'gran via'),(101,'granja'),(102,'grupo/s'),(103,'hegi'),(104,'hipodromo'),(105,'hoya'),(106,'illa'),(107,'inda'),(108,'jardin/es'),(109,'ladera'),(110,'lago'),(111,'llanura'),(112,'loma'),(113,'lomo'),(114,'lugar'),(115,'malecon'),(116,'masia/s'),(117,'mazo'),(118,'mercado'),(119,'mirador'),(120,'monasterio'),(121,'monte'),(122,'muelle'),(123,'nave/s'),(124,'nucleo'),(125,'nudo'),(126,'pago'),(127,'palacio'),(128,'pantano'),(129,'paraje'),(130,'parque'),(131,'particular'),(132,'partida'),(133,'pas'),(134,'pasadizo'),(135,'pasaje'),(136,'paseo'),(137,'paseo maritimo'),(138,'pasillo'),(139,'patio'),(140,'pinar'),(141,'pista'),(142,'pla'),(143,'playa'),(144,'plaza'),(145,'plazoleta'),(146,'poblado'),(147,'poligono'),(148,'portal'),(149,'praciÃ±a'),(150,'prolongacion'),(151,'puente'),(152,'puerta'),(153,'puerto'),(154,'pujada'),(155,'pujada, subida'),(156,'raconada'),(157,'ramal'),(158,'rambla'),(159,'rampa'),(160,'rento'),(161,'residencial'),(162,'ribera'),(163,'rincon'),(164,'rinconada'),(165,'ronda'),(166,'rotonda'),(167,'rua'),(168,'rueiro'),(169,'sanatorio'),(170,'santuario'),(171,'sector'),(172,'senda'),(173,'sendera'),(174,'sendero'),(175,'subida'),(176,'torrente'),(177,'transito'),(178,'transversal'),(179,'trasera'),(180,'travesia'),(181,'urbanizacion'),(182,'valle'),(183,'vecindario'),(184,'vega'),(185,'veinat'),(186,'venela'),(187,'vereda'),(188,'via'),(189,'viaducto'),(190,'vial'),(191,'villa'),(192,'viviendas'),(193,'zona'),(194,'apartado de correos');
/*!40000 ALTER TABLE `tipo_via` ENABLE KEYS */;
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
