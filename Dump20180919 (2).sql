CREATE DATABASE  IF NOT EXISTS `euroleague_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `euroleague_db`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: euroleague_db
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `country` (
  `country_id` varchar(10) NOT NULL,
  `country_name` text,
  `town_name` text,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('01','Turkey','Instabul'),('02','Italy','Milan'),('03','Germany','Munich'),('04','Montenegro','Podgorica'),('05','Russia','Moscow'),('06','Spain','Barcelona'),('07','Spain','Las Palmas'),('08','Russia','Khimki'),('09','Spain','Vitoria'),('10','Israel','Tel Aviv'),('11','Greece','Piraeus'),('12','Greece','Athens'),('13','Lithuania','Kaunas'),('14','Spain','Madrid');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `player` (
  `player_id` varchar(10) NOT NULL,
  `first_name` text,
  `last_name` text,
  `age` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES ('01','Shane','Larkin',26),('02','Brock','Motum',28),('03','Mike','James',28),('04','Arturas','Gudaitis',25),('05','Brayton','Hobbs',29),('06','Alex','King',32),('07','Earl','Clark',31),('08','Nikola','Ivanovic',24),('09','Nando','de Colo',33),('10','Clyburn','Will',28),('11','Oguz','Savas',32),('12','Emircan','Kosut',25),('13','Adam','Hanga',29),('14','Thomas','Ertel',29),('15','Luigi','Datome',33),('16','Kostas','Sloukas',28),('17','DJ','Strawberry',34),('18','Luke','Fisher',24),('19','Alexey','Shved',30),('20','Petr','Gubanov',33),('21','Marcelo','Huertas',37),('22','Matt','Janning',30),('23','Alex','Tyus',30),('24','Jeremy','Pargo',36),('25','Vasilis','Spanoulis',37),('26','Giorgos','Printezis',33),('27','Nick','Kalathis',29),('28','James','Gist',35),('29','Rudy','Fernadez',33),('30','Sergio','Llull',32),('31','Brandon','Daves',27),('32','Arturas','Milaknis',32);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_statistics`
--

DROP TABLE IF EXISTS `player_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `player_statistics` (
  `player_id` varchar(10) NOT NULL,
  `stats_id` varchar(10) NOT NULL,
  PRIMARY KEY (`player_id`,`stats_id`),
  KEY `stats_id` (`stats_id`),
  CONSTRAINT `player_statistics_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`),
  CONSTRAINT `player_statistics_ibfk_2` FOREIGN KEY (`stats_id`) REFERENCES `statistics` (`stats_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_statistics`
--

LOCK TABLES `player_statistics` WRITE;
/*!40000 ALTER TABLE `player_statistics` DISABLE KEYS */;
INSERT INTO `player_statistics` VALUES ('01','01'),('03','01'),('05','01'),('14','01'),('17','01'),('22','01'),('25','01'),('26','01'),('04','02'),('09','02'),('11','02'),('15','02'),('23','02'),('30','02'),('02','03'),('06','03'),('08','03'),('12','03'),('16','03'),('18','03'),('24','03'),('31','03'),('32','03'),('07','04'),('13','04'),('19','04'),('27','04'),('10','05'),('20','05'),('21','05'),('28','05'),('29','05');
/*!40000 ALTER TABLE `player_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `statistics` (
  `stats_id` varchar(10) NOT NULL,
  `position` text,
  PRIMARY KEY (`stats_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
INSERT INTO `statistics` VALUES ('01','Guard'),('02','Center'),('03','Power Forward'),('04','Shooting Guard'),('05','Small Forward');
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `team` (
  `team_id` varchar(10) NOT NULL,
  `team_name` text,
  `year_of_creation` decimal(4,0) DEFAULT NULL,
  `team_owner` text,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES ('01','Anadolu Efes',1976,'Tuncay Özilhan'),('02','Armani Milano',1930,'Livio Proli '),('03',' Bayern Munich',1946,'Uli Hoeneß'),('04','KK Budućnost',1949,'Dragan Bokan'),('05','CSKA Moscow',1923,'Andrey Vatutin'),('06','Darusafaka',1951,'Ümit Başkırt'),('07','Barcelona',1926,'Josep Maria Bartomeu'),('08','Fenerbahce',1913,'Ali Koç'),('09','Gran Canaria',1963,'Salva Maldonado'),('10','Khimki',1997,'Dmitry Golubkov'),('11','Basconia',1959,'José Antonio Querejeta'),('12','Macabi Tel Aviv',1932,'Shimon Mizrahi'),('13','Olympiakos',1925,'Panagiotis Angelopoulos'),('14','Panathinaikos',1908,'Emmanouil Papadopoulos'),('15','Real Madrid',1931,'Florentino Pérez'),('16','Zalgiris',1944,'Paulius Motiejūnas');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_country`
--

DROP TABLE IF EXISTS `team_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `team_country` (
  `team_id` varchar(10) NOT NULL,
  `country_id` varchar(10) NOT NULL,
  PRIMARY KEY (`team_id`,`country_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `team_country_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `team_country_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_country`
--

LOCK TABLES `team_country` WRITE;
/*!40000 ALTER TABLE `team_country` DISABLE KEYS */;
INSERT INTO `team_country` VALUES ('01','01'),('06','01'),('08','01'),('02','02'),('03','03'),('04','04'),('05','05'),('07','06'),('09','07'),('10','08'),('11','09'),('12','10'),('13','11'),('14','12'),('16','13'),('15','14');
/*!40000 ALTER TABLE `team_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_player`
--

DROP TABLE IF EXISTS `team_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `team_player` (
  `team_id` varchar(10) NOT NULL,
  `player_id` varchar(10) NOT NULL,
  PRIMARY KEY (`team_id`,`player_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `team_player_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `team_player_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_player`
--

LOCK TABLES `team_player` WRITE;
/*!40000 ALTER TABLE `team_player` DISABLE KEYS */;
INSERT INTO `team_player` VALUES ('01','01'),('01','02'),('02','03'),('02','04'),('03','05'),('03','06'),('04','07'),('04','08'),('05','09'),('05','10'),('06','11'),('06','12'),('07','13'),('07','14'),('08','15'),('08','16'),('09','17'),('09','18'),('10','19'),('10','20'),('11','21'),('11','22'),('12','23'),('12','24'),('13','25'),('13','26'),('14','27'),('14','28'),('15','29'),('15','30'),('16','31'),('16','32');
/*!40000 ALTER TABLE `team_player` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-19 21:32:46
