CREATE DATABASE  IF NOT EXISTS `trivia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `trivia`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: trivia
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `award`
--

DROP TABLE IF EXISTS `award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `award` (
  `idaward` int NOT NULL AUTO_INCREMENT,
  `score` int DEFAULT NULL,
  PRIMARY KEY (`idaward`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `award`
--

LOCK TABLES `award` WRITE;
/*!40000 ALTER TABLE `award` DISABLE KEYS */;
INSERT INTO `award` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `idcategory` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) DEFAULT NULL,
  `difficultId` int DEFAULT NULL,
  PRIMARY KEY (`idcategory`),
  KEY `DC_idx` (`difficultId`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`difficultId`) REFERENCES `difficult` (`iddifficult`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Deportes',1),(2,'Entretenimiento',2),(3,'Geografía',3),(4,'Ciencia',4),(5,'Historia',5);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `count`
--

DROP TABLE IF EXISTS `count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `count` (
  `idcount` int NOT NULL AUTO_INCREMENT,
  `totalcount` int DEFAULT NULL,
  `playerId` int DEFAULT NULL,
  `roundcountId` int DEFAULT NULL,
  PRIMARY KEY (`idcount`),
  KEY `pj_idx` (`playerId`),
  KEY `rc_idx` (`roundcountId`),
  CONSTRAINT `count_ibfk_1` FOREIGN KEY (`playerId`) REFERENCES `jugador` (`idjugador`),
  CONSTRAINT `count_ibfk_2` FOREIGN KEY (`roundcountId`) REFERENCES `round` (`idround`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `count`
--

LOCK TABLES `count` WRITE;
/*!40000 ALTER TABLE `count` DISABLE KEYS */;
/*!40000 ALTER TABLE `count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `difficult`
--

DROP TABLE IF EXISTS `difficult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `difficult` (
  `iddifficult` int NOT NULL AUTO_INCREMENT,
  `lvl` int NOT NULL,
  `roundId` int DEFAULT NULL,
  PRIMARY KEY (`iddifficult`),
  KEY `dr_idx` (`roundId`),
  CONSTRAINT `difficult_ibfk_1` FOREIGN KEY (`roundId`) REFERENCES `round` (`idround`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difficult`
--

LOCK TABLES `difficult` WRITE;
/*!40000 ALTER TABLE `difficult` DISABLE KEYS */;
INSERT INTO `difficult` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5);
/*!40000 ALTER TABLE `difficult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugador` (
  `idjugador` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idjugador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option`
--

DROP TABLE IF EXISTS `option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `option` (
  `idoption` int NOT NULL AUTO_INCREMENT,
  `option` varchar(5000) NOT NULL,
  `true` tinyint NOT NULL,
  `questionId` int NOT NULL,
  PRIMARY KEY (`idoption`),
  KEY `OQ_idx` (`questionId`),
  CONSTRAINT `option_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `preguntas` (`idpreguntas`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option`
--

LOCK TABLES `option` WRITE;
/*!40000 ALTER TABLE `option` DISABLE KEYS */;
INSERT INTO `option` VALUES (1,'120',1,1),(2,'90',0,1),(3,'85',0,1),(4,'80',0,1),(5,'Verde y amarillo',0,2),(6,'Rojo y azul',0,2),(7,'Rojo y blanco',1,2),(8,'Blanco y verde',0,2),(9,'Fútbol',0,3),(10,'Baloncesto',0,3),(11,'Rugby',0,3),(12,'Lucha libre',1,3),(13,'Felipe',0,4),(14,'Andrés',1,4),(15,'Johan',0,4),(16,'Camilo',0,4),(17,'Johan Cruyff',0,5),(18,'Michel platini',0,5),(19,'Marco Van Basten',0,5),(20,'Lionel Messi',1,5),(21,'Una piña',1,1),(22,'Una papá',0,1),(23,'Una esponja',0,1),(24,'No tenía casa',0,1),(25,'Ethan Hawke',0,2),(26,'Brad Pitt',1,2),(27,'Jared Leto',0,2),(28,'Timothy Hutton',0,2),(29,'Moradas',0,3),(30,'Negras',0,3),(31,'Blancas',1,3),(32,'Azules ',0,3),(33,'Dumbo',0,4),(34,'Pinocho',0,4),(35,'Blancanieves',1,4),(36,'Bambi',0,4),(37,'1940',1,5),(38,'1937',0,5),(39,'1941',0,5),(40,'1942',0,5),(41,'Punta Arenas',0,1),(42,'Viña del Mar',1,1),(43,'Santiago de Chile',0,1),(44,'Concepción',0,1),(45,'Groenlandia',0,2),(46,'Indonesia',0,2),(47,'Canadá',0,2),(48,'Francia',1,2),(49,'Tromso',0,3),(50,'Trondheim',0,3),(51,'Bergen',0,3),(52,'Oslo',1,3),(53,'15',0,4),(54,'17',1,4),(55,'19',0,4),(56,'10',0,4),(57,'Dinamarca',0,5),(58,'Holanda',1,5),(59,'Finlandia',0,5),(60,'Islandia',0,5),(61,'Bromatología',1,1),(62,'Geología',0,1),(63,'Biología ',0,1),(64,'Micología',0,1),(65,'Neurona',1,2),(66,'Neurita',0,2),(67,'Célula',0,2),(68,'Ninguna es correcta',0,2),(69,'Musaraña elefante',0,3),(70,'Lagarto basilisco',1,3),(71,'Uakari',0,3),(72,'Aye Aye',0,3),(73,'HO',0,4),(74,'FeO',0,4),(75,'CIH',0,4),(76,'HCl',1,4),(77,'Una bacteria en forma de esfera',0,5),(78,'Una bacteria en forma de bastón',1,5),(79,'Una bacteria en forma de espiral',0,5),(80,'Una bacteria sin forma',0,5),(81,'Max Montgelas',0,1),(82,'Otto von Marchtaler',0,1),(83,'Joseph Goebbels',1,1),(84,'Markus Meckel',0,1),(85,'Acta est fabula',0,2),(86,'Alea iacta est',1,2),(87,'Cogito, ergo sum',0,2),(88,'Ab imo pectore',0,2),(89,'Tribus Galas',0,3),(90,'Vénetos',0,3),(91,'Helvecios',0,3),(92,'Todas las respuestas son correctas',1,3),(93,'La escritura',1,4),(94,'Descubrimiento del fuego',0,4),(95,'Fin de la era glaciar',0,4),(96,'Inicio de la industria microlítica',0,4),(97,'660',0,5),(98,'649',1,5),(99,'650',0,5),(100,'640',0,5);
/*!40000 ALTER TABLE `option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntas` (
  `idpreguntas` int NOT NULL AUTO_INCREMENT,
  `question` varchar(5000) DEFAULT NULL,
  `categoryId` int DEFAULT NULL,
  PRIMARY KEY (`idpreguntas`),
  KEY `PC_idx` (`categoryId`),
  CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`idcategory`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (1,'¿Qué duración tiene un partido de fútbol que llega a la tanda de penaltis? ',1),(2,'¿De qué colores es la camiseta del Atlético de Madrid?',1),(3,'¿A qué deporte pertenece la WWE?',1),(4,'¿Cómo se llama Iniesta?',1),(5,'¿Quién tiene más balones de oro? ',1),(6,'¿Qué fruta es la casa de Bob Esponja?',2),(7,'¿Quién es el marido de la actriz Angelina Jolie?',2),(8,'¿En la serie Los Simpson de qué color son las perlas de Lisa?',2),(9,'¿Cuál fue la primera película de Disney?',2),(10,'¿En qué año se estrenó la película de Disney Pinocho?',2),(11,'¿En qué ciudad de Chile se realiza el festival de la Canción más importante de Latinoamérica?',3),(12,'¿En qué país está la Costa Azul?',3),(13,'¿Cuál es la capital de Noruega? ',3),(14,'¿Cuántas comunidades autónomas hay en España?',3),(15,'¿En qué país se encuentra la ciudad de Eindhoven?',3),(16,'¿Cómo se llama el estudio de los alimentos?',4),(17,'¿De dónde forman parte los axones?',4),(18,'¿Qué animal puede correr sobre el agua?',4),(19,'¿Cuál es la fórmula química del ácido clorhídrico?',4),(20,'¿Qué es un bacilo?',4),(21,'¿Quién dijo la frase: miente, miente que algo quedará?',5),(22,'¿Cómo se decía en latín la famosa expresión: la suerte está echada?',5),(23,'¿A qué pueblo derrotó Julio César?',5),(24,'¿Qué evento marca el fin de la prehistoria?',5),(25,'¿Cuántos soldados argentinos murieron en la Guerra de las Malvinas?',5);
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `round`
--

DROP TABLE IF EXISTS `round`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `round` (
  `idround` int NOT NULL AUTO_INCREMENT,
  `roundN` int NOT NULL,
  `awardId` int DEFAULT NULL,
  PRIMARY KEY (`idround`),
  KEY `awardround_idx` (`awardId`),
  CONSTRAINT `round_ibfk_1` FOREIGN KEY (`awardId`) REFERENCES `award` (`idaward`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `round`
--

LOCK TABLES `round` WRITE;
/*!40000 ALTER TABLE `round` DISABLE KEYS */;
INSERT INTO `round` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5);
/*!40000 ALTER TABLE `round` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-25  9:46:30
