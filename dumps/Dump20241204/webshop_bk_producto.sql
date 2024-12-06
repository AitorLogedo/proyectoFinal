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
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'identificador del producto',
  `codigo` varchar(32) NOT NULL COMMENT 'codigo de producto',
  `titulo` varchar(128) NOT NULL COMMENT 'titulo para el producto',
  `desc_producto` longtext NOT NULL COMMENT 'descripción ampliada del producto',
  `stock` int NOT NULL COMMENT 'nº articulos en stock',
  `stock_minimo` int NOT NULL,
  `precio` decimal(8,2) NOT NULL COMMENT 'precio del producto',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  FULLTEXT KEY `busqueda` (`titulo`,`desc_producto`) COMMENT '''busqueda fulltext sobre un articulo\\n''' /*!80000 INVISIBLE */
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='productos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'x33456-xfg','PcCom Ready Intel Core i5-12400F / 32GB / 1TB SSD / RTX 4060 Ti','Domina cada batalla con los PcCom Ready. Equipos gaming con configuraciones perfectamente equilibradas, ofrecen una experiencia de juego fluida y veloz como ninguna otra. Respaldados por más de 18 años de experiencia, estos equipos son configurados y probados por nuestros expertos en España y enviados rápidamente para que juegues desde el primer día.\n\nPc Gaming pensado para un uso general en el hogar o en la oficina, el PcCom Ready se presenta como un potente equipo en el que su procesador Intel Core i5, sus 32GB de RAM DDR4, el rápido disco SSD de 1TB M.2 NVMe y la potente gráfica Nvidia RTX 4060Ti permiten trabajar de forma holgada en muy diferentes tareas, lo que lo hace ideal para entornos domésticos o de oficina.',10,2,1200.00),(2,'p3544-dgsf','PcCom Imperial AMD Ryzen 7 7800X3D / 32GB / SSD 2TB / RTX 4070 Super','Pc Gaming para un uso general en el hogar o en la oficina, el PcCom Imperial se presenta como un potente equipo en el que su procesador AMD Ryzen 7, sus 32GB de RAM DDR5, el rápido disco SSD de 2TB M.2 NVMe y la potente gráfica Nvidia RTX 4070 Super permiten trabajar de forma holgada en muy diferentes tareas, lo que lo hace ideal para entornos domésticos o de oficina.\n\nEspecificaciones PcCom Imperial\nCaja: Forgeon Mithril ARGB Mesh Torre ATX Blanca\nFuente de alimentación: Forgeon Bolt PSU 750W 80+ Gold Full Modular Fuente de Alimentación\nProcesador: AMD Ryzen 7 7800X3D 4.2 GHz/5 GHz\nPlaca base: MSI PRO B650-S WIFI\nDisco duro: WD BLACK SN770 2TB NVMe SSD\nMemoria RAM: Acer Predator Vesta II RGB DDR5 6000MHz 32GB 2x16GB CL32\nTarjeta gráfica: RTX 4070 Super 12GB OC\n1xHDMI / 3xDisplayPorts\nTarjeta de sonido: Integrada\nTarjeta de red: Integrada\nRefrigeración CPU: Nfortec ATRIA X Kit de Refrigeración Líquida 240mm Negro\nConexiones delanteras:\n2x USB 3.0\n1x USB 2.0\n1x USB-C\nAuricular/Micrófono x1\nEncendido/Apagado\nLED\nReinicio\nConexiones traseras\nCantidad de puertos tipo A USB 3.2 Gen 1 (3.1 Gen 1): 4\nCantidad de puertos tipo A USB 3.2 Gen 2 (3.1 Gen 2): 3\nNúmero de puertos USB 3.2 Gen 2x2 Tipo C: 1\nEthernet LAN (RJ-45) cantidad de puertos: 1\nNúmero de puertos HDMI: 1\nVersión HDMI: 2.1\nSalidas para auriculares: 1\nEntrada de línea: Si\nMicrófono, jack de entrada: Si\nDimensiones: (L x An x Al) 460mm x 231mm x 490mm\nEquipo totalmente montado y testeado.\nGarantía completa con recogida y entrega en domicilio.',5,4,1300.00);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-04 19:19:11
