-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: sre
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `ecosystem`
--

DROP TABLE IF EXISTS `ecosystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecosystem` (
  `ecosystem` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `special1` varchar(100) DEFAULT NULL,
  `special2` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ecosystem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecosystem`
--

LOCK TABLES `ecosystem` WRITE;
/*!40000 ALTER TABLE `ecosystem` DISABLE KEYS */;
INSERT INTO `ecosystem` VALUES ('Agricultural','Anthropogenic','',''),('Anthropogenic','Anthropogenic','',''),('Beach','Coastal','Gull',''),('Beaver Pond','Wetland','Beaver',''),('Dunes','Coastal','Salt Grass',''),('Lake','Wetland','',''),('n/a','none',NULL,NULL),('Oak-Pine Forest','Forest','Oak','Pine'),('Pine Forest','Forest','Pine',''),('Pine-Maple Forest','Forest','Pine','Maple'),('River','Wetland','',''),('Salt Marsh','Coastal','Salt Grass','');
/*!40000 ALTER TABLE `ecosystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `owner` varchar(100) DEFAULT NULL,
  `latc` decimal(8,6) NOT NULL,
  `longc` decimal(8,6) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'Crane Beach','Trustees of the Reservation',42.686226,-70.763662,'Coastal'),(2,'Highland Lake','Various',44.076863,-70.737248,'Wetland'),(3,'Bradley Palmer State Park','Massachusetts Dept. of Conservation and Recreation',42.650257,-70.899343,'Forest'),(4,'Willowdale State Forest','Massachusetts Dept. of Conservation and Recreation',42.674215,-70.907788,'Forest'),(5,'Ipswich River Wildlife Sanctuary','Mass Audubon',42.631623,-70.921578,'Forest'),(6,'Swamp Walk','Danvers Rail Trail',42.604114,-70.932968,'Wetland'),(7,'Rough Medows','Mass Audubon',42.745825,-70.847020,'Coastal'),(8,'Riverwalk','Town of Ipswich',42.678187,-70.837759,'Anthropogenic'),(9,'Honeymoon Island State Park','Florida Department of Environmental Protection',28.066139,-82.831011,'Coastal'),(10,'Backyard Woods','Various',42.688301,-70.904538,'Forest');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `species` (
  `common_name` varchar(100) NOT NULL,
  `scientific` varchar(100) NOT NULL,
  `sgroup` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `kingdom` varchar(100) NOT NULL,
  PRIMARY KEY (`scientific`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `species`
--

LOCK TABLES `species` WRITE;
/*!40000 ALTER TABLE `species` DISABLE KEYS */;
INSERT INTO `species` VALUES ('Balsam Fir','Abies balsamea','Conifer','Tree','Plant'),('Red Maple','Acer rubrum','Maple','Tree','Plant'),('Red-winged Blackbird','Agelasius phoeniceus','Songbird','Bird','Animal'),('Beachgrass','Ammophila breviligulata','Salt Grass','Grass-like','Plant'),('Mallard','Anas platyrhynchos','Duck','Bird','Animal'),('Tufted Titmouse','Baeolophus bicolor','Songbird','Bird','Animal'),('Great Horned Owl','Bubo virginianus','Bird of Prey','Bird','Animal'),('Sedge','Carex pensylvanica','','Grass-like','Plant'),('House Finch','Carpodacus mexicanus','Songbird','Bird','Animal'),('Shagbark Hickory','Carya ovata','','Tree','Plant'),('Beaver','Castor canadensis','Beaver','Mammal','Animal'),('Turkey Vultures','Cathartes aura','Vulture','Bird','Animal'),('Bittersweet','Celastrus orbiculatus','','Vine','Plant'),('Black Vulture','Coragyps atratus','Vulture','Bird','Animal'),('Crow','Corvus brachyrhynchos','','Bird','Animal'),('swamp- loosestrife','Decodon verticillatus','','Shrub','Plant'),('Beech','Fagus grandifolia','','Tree','Plant'),('Cat','Felis catus','','Mammal','Animal'),('Grass','Festuca filiformis','Grass','Grass-like','Plant'),('Floppy Grass','Festuca rubra','Grass','Grass-like','Plant'),('Glossy Buckthorn','Frangula alnus','','Shrub','Plant'),('Loon','Gavia immer','','Bird','Animal'),('Gopher Tortoise','Gopherus polyphemus','Turtle','Reptile','Animal'),('Bald Eagle','Haliaeetus leucocephalus','Bird of Prey','Bird','Animal'),('Dark-eyed Junco','Junco hyemalis','Songbird','Bird','Animal'),('Rush','Juncus brevicaudatus','','Grass-like','Plant'),('Common Juniper','Juniperus communis','Conifer','Shrub','Plant'),('Ring-Billed Gulls','Larus delawarensis','Gull','Bird','Animal'),('Herring Gulls','Larus smithsonianus','Gull','Bird','Animal'),('Hairy Woodpecker','Leuconotopicus villosus','Woodpecker','Bird','Animal'),('Green Frog','Lithobates clamitans','Frog','Amphibian','Animal'),('Turkey','Meleagris gallopavo','','Bird','Animal'),('Soft Shell Clam','Mya arenaria','Clam','Mollusk','Animal'),('White-Tailed Deer','Odocoileus virginianus','','Mammal','Animal'),('cinnamon fern','Osmundastrum cinnamomeum','Fern','Fern','Plant'),('Pachysandra','Pachysandra terminalis','','Herbaceous','Plant'),('Osprey','Pandion haliaetus','Bird of Prey','Bird','Animal'),('Norway Spruce','Picea abies','Conifer','Tree','Plant'),('Downy Woodpecker','Picoides pubescens','Woodpecker','Bird','Animal'),('Shortleaf Pine','Pinus echinata','Pine','Tree','Plant'),('Red Pine','Pinus resinosa','Pine','Tree','Plant'),('White Pine','Pinus strobus','Pine','Tree','Plant'),('Other Moss','Pleurozium schreberi','Moss','Moss','Plant'),('Black-capped Chickadee','Poecile atricapillus','Songbird','Bird','Animal'),('Moss','Polytrichum commune','Moss','Moss','Plant'),('Beach Plum','Prunus maritima','','Shrub','Plant'),('Peepers','Pseudacris crucifer','Frog','Amphibian','Animal'),('Eastern White Oak','Quercus alba','Oak','Tree','Plant'),('Swamp White Oak','Quercus bicolor','Oak','Tree','Plant'),('Scarlet Oak','Quercus coccinea','Oak','Tree','Plant'),('Black Oak','Quercus velutina','Oak','Tree','Plant'),('Buttercup','Ranunculus repens','','Herbaceous','Plant'),('Rhododendron','Rhododendron maximum','','Shrub','Plant'),('Raspberry','Rubus idaeus','Raspberry','Herbaceous','Plant'),('Black Raspberry','Rubus occidentalis','Raspberry','Herbaceous','Plant'),('Cabbage palm','Sabal palmetto','Palm','Tree','Plant'),('Small Willow','Salix eriocephala','','Shrub','Plant'),('Other Grass','Schedonorus pratensis','Grass','Grass-like','Plant'),('Grey Squirrel','Sciurus carolinensis','Squirrel','Mammal','Animal'),('Skunk Cabbage','Symplocarpus foetidus','','Herbaceous','Plant'),('Chipmunk','Tamias striatus','Squirrel','Mammal','Animal'),('Red Squirrel','Tamiasciurus hudsonicus','Squirrel','Mammal','Animal'),('Dandelion','Taraxacum laevigatum','Dandelion','Herbaceous','Plant'),('Dandelion','Taraxacum officinale','Dandelion','Herbaceous','Plant'),('Yew','Taxus canadensis','Conifer','Shrub','Plant'),('Cedar','Thuja occidentalis','Conifer','Tree','Plant'),('Spanish Moss','Tillandsia usneoides','','Epiphyte','Plant'),('Poison Ivy','Toxicodendron radicans','','Vine','Plant'),('Steplike Fungi','Trichaptum biforme','Fungi','Fungi','Fungi'),('White Clover','Trifolium repens','','Herbaceous','Plant'),('Cattail','Typha latifolia','','Grass-like','Plant'),('Lowbush Blueberry','Vaccinium angustifolium','Blueberry','Shrub','Plant'),('Highbush Blueberry','Vaccinium corymbosum','Blueberry','Shrub','Plant'),('Corn','Zea mays','','Grass-like','Plant'),('Mourning Dove','Zenaida macroura','Songbird','Bird','Animal');
/*!40000 ALTER TABLE `species` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subregion`
--

DROP TABLE IF EXISTS `subregion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subregion` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `region` int NOT NULL,
  `latc` decimal(8,6) NOT NULL,
  `longc` decimal(8,6) NOT NULL,
  `sediment` varchar(100) DEFAULT NULL,
  `water` varchar(100) NOT NULL,
  `ecosystem` varchar(100) DEFAULT NULL,
  `recorddate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `region` (`region`),
  KEY `water` (`water`),
  KEY `ecosystem` (`ecosystem`),
  CONSTRAINT `subregion_ibfk_1` FOREIGN KEY (`region`) REFERENCES `region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `subregion_ibfk_2` FOREIGN KEY (`water`) REFERENCES `water` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `subregion_ibfk_3` FOREIGN KEY (`ecosystem`) REFERENCES `ecosystem` (`ecosystem`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subregion`
--

LOCK TABLES `subregion` WRITE;
/*!40000 ALTER TABLE `subregion` DISABLE KEYS */;
INSERT INTO `subregion` VALUES (1,'Dunes',1,42.686629,-70.767998,'Sand','None','Dunes','2019-10-05'),(2,'Steep Hill',1,42.690812,-70.781851,'Sand','Plum Island Sound','Beach','2019-10-05'),(3,'Main Beach',1,42.686226,-70.763662,'Sand','Ipswich Bay','Beach','2019-10-05'),(4,'Parking Lot',1,42.683938,-70.767664,'Sand','None','Anthropogenic','2019-10-05'),(5,'Blueberry Island',2,44.060323,-70.718716,'Not Sand','Highland Lake','Lake','2019-08-09'),(6,'Northern Islands',2,44.084202,-70.739472,'Not Sand','Highland Lake','Lake','2019-08-09'),(7,'Cabins by Grady\'s',2,44.060468,-70.727666,'Not Sand','Highland Lake','n/a','2019-08-09'),(8,'Riverside Trail',3,42.659173,-70.897573,'Not Sand','Ipswich River','n/a','2020-02-23'),(9,'Moon Hill',3,42.655070,-70.899515,'Not Sand','None','n/a','2020-02-23'),(10,'Fire Road',4,42.682134,-70.902260,'Not Sand','None','Oak-Pine Forest','2020-03-19'),(12,'Red Pine Grove',4,42.684409,-70.900485,'Not Sand','None','Pine Forest','2020-03-19'),(13,'Drumlins',4,42.684543,-70.899082,'Not Sand','Nameless Streams','Oak-Pine Forest','2020-03-19'),(14,'Feilds',4,42.683415,-70.895616,'Not Sand','None','Agricultural','2020-03-19'),(15,'Winding Trail',4,42.681900,-70.900020,'Not Sand','Nameless Streams','Oak-Pine Forest','2020-03-19'),(16,'Near Linebrook',4,42.683187,-70.903348,'Not Sand','Nameless Ponds','Oak-Pine Forest','2020-03-19'),(17,'Rockery',5,42.636284,-70.920155,'Not Sand','Rockery Pond','Beaver Pond','2020-03-22'),(18,'Trail to Rockery',5,42.634240,-70.920622,'Not Sand','None','Pine-Maple Forest','2020-03-22'),(19,'Boardwalk',6,42.604114,-70.932968,'Not Sand','Wenham Great Swamp','n/a','0000-00-00'),(20,'Main Trail',7,42.745825,-70.847020,'Not Sand','The Great Marsh','Salt Marsh','2020-02-21'),(21,'The Dam',8,42.677747,-70.837755,'Gravel','Ipswich River','River','2020-03-20'),(22,'Osprey Trail',9,28.072586,-82.830625,'Not Sand','None','Pine Forest','2020-03-04'),(23,'Yard',10,42.688651,-70.904800,'Not Sand','None','n/a','2020-03-19');
/*!40000 ALTER TABLE `subregion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `town`
--

DROP TABLE IF EXISTS `town`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `town` (
  `zip` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `state` varchar(2) NOT NULL,
  PRIMARY KEY (`zip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `town`
--

LOCK TABLES `town` WRITE;
/*!40000 ALTER TABLE `town` DISABLE KEYS */;
INSERT INTO `town` VALUES (1921,'Boxford','MA'),(1923,'Danvers','MA'),(1936,'Hamilton','MA'),(1938,'Ipswich','MA'),(1969,'Rowley','MA'),(1983,'Topsfield','MA'),(1984,'Wenham','MA'),(4009,'Bridgton','ME'),(34698,'Dunedin','FL');
/*!40000 ALTER TABLE `town` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `townlink`
--

DROP TABLE IF EXISTS `townlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `townlink` (
  `property` int NOT NULL,
  `town` int NOT NULL,
  PRIMARY KEY (`property`,`town`),
  KEY `town` (`town`),
  CONSTRAINT `townlink_ibfk_1` FOREIGN KEY (`property`) REFERENCES `region` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `townlink_ibfk_2` FOREIGN KEY (`town`) REFERENCES `town` (`zip`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `townlink`
--

LOCK TABLES `townlink` WRITE;
/*!40000 ALTER TABLE `townlink` DISABLE KEYS */;
INSERT INTO `townlink` VALUES (4,1921),(6,1923),(3,1936),(1,1938),(4,1938),(8,1938),(10,1938),(7,1969),(3,1983),(4,1983),(5,1983),(6,1984),(2,4009),(9,34698);
/*!40000 ALTER TABLE `townlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water`
--

DROP TABLE IF EXISTS `water`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `water` (
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water`
--

LOCK TABLES `water` WRITE;
/*!40000 ALTER TABLE `water` DISABLE KEYS */;
INSERT INTO `water` VALUES ('Bull Brook Marsh','Wetland'),('Highland Lake','Lake'),('Ipswich Bay','Ocean'),('Ipswich River','River'),('Name','Type'),('Nameless Ponds','Pond'),('Nameless Streams','Stream'),('None','None'),('Plum Island Sound','Estuary'),('Rockery Pond','Pond'),('The Great Marsh','Wetland'),('Wenham Great Swamp','Wetland');
/*!40000 ALTER TABLE `water` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wherespecies`
--

DROP TABLE IF EXISTS `wherespecies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wherespecies` (
  `subregion` int NOT NULL,
  `species` varchar(100) NOT NULL,
  `attribute` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`subregion`,`species`),
  KEY `species` (`species`),
  CONSTRAINT `wherespecies_ibfk_1` FOREIGN KEY (`subregion`) REFERENCES `subregion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wherespecies_ibfk_2` FOREIGN KEY (`species`) REFERENCES `species` (`scientific`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wherespecies`
--

LOCK TABLES `wherespecies` WRITE;
/*!40000 ALTER TABLE `wherespecies` DISABLE KEYS */;
INSERT INTO `wherespecies` VALUES (1,'Ammophila breviligulata','Foundational'),(1,'Juniperus communis',''),(1,'Prunus maritima',''),(3,'Larus delawarensis',''),(3,'Larus smithsonianus',''),(3,'Mya arenaria',''),(4,'Toxicodendron radicans',''),(5,'Pinus strobus',''),(5,'Vaccinium corymbosum',''),(6,'Gavia immer',''),(6,'Pinus strobus',''),(6,'Vaccinium corymbosum',''),(10,'Frangula alnus','Invasive'),(10,'Pinus strobus',''),(10,'Quercus alba',''),(10,'Quercus bicolor',''),(10,'Quercus coccinea',''),(10,'Quercus velutina',''),(12,'Abies balsamea',''),(12,'Pinus resinosa',''),(13,'Carya ovata',''),(13,'Cathartes aura',''),(13,'Polytrichum commune',''),(13,'Quercus velutina',''),(13,'Symplocarpus foetidus',''),(14,'Acer rubrum',''),(14,'Carex pensylvanica',''),(14,'Junco hyemalis',''),(14,'Juncus brevicaudatus',''),(14,'Trifolium repens',''),(14,'Zea mays',NULL),(15,'Acer rubrum',''),(15,'Festuca filiformis',''),(15,'Frangula alnus','Invasive'),(15,'Odocoileus virginianus',''),(15,'Picoides pubescens',''),(15,'Pinus strobus',''),(15,'Quercus alba',''),(15,'Quercus velutina',''),(15,'Trichaptum biforme',''),(16,'Decodon verticillatus',''),(16,'Fagus grandifolia',''),(16,'Frangula alnus',''),(16,'Leuconotopicus villosus',''),(16,'Lithobates clamitans',''),(16,'Pinus strobus',''),(16,'Pseudacris crucifer',''),(17,'Abies balsamea',''),(17,'Agelasius phoeniceus',''),(17,'Anas platyrhynchos',''),(17,'Castor canadensis',''),(17,'Celastrus orbiculatus',''),(17,'Fagus grandifolia',''),(17,'Frangula alnus',''),(17,'Odocoileus virginianus',''),(17,'Osmundastrum cinnamomeum',''),(17,'Pinus strobus',''),(17,'Pleurozium schreberi',''),(17,'Quercus coccinea',''),(17,'Rhododendron maximum',''),(17,'Salix eriocephala',''),(17,'Tamiasciurus hudsonicus',''),(17,'Taxus canadensis',''),(17,'Thuja occidentalis',''),(17,'Typha latifolia',''),(17,'Zenaida macroura',''),(18,'Acer rubrum',''),(18,'Baeolophus bicolor',''),(18,'Fagus grandifolia',''),(18,'Pachysandra terminalis',''),(18,'Picea abies',''),(18,'Poecile atricapillus',''),(18,'Tamias striatus',''),(18,'Tamiasciurus hudsonicus',''),(21,'Anas platyrhynchos',''),(22,'Bubo virginianus',''),(22,'Coragyps atratus',''),(22,'Gopherus polyphemus','Keystone'),(22,'Haliaeetus leucocephalus',''),(22,'Pandion haliaetus',''),(22,'Picoides pubescens',''),(22,'Pinus echinata','Foundational'),(22,'Sabal palmetto',''),(22,'Tillandsia usneoides',''),(23,'Carpodacus mexicanus',''),(23,'Corvus brachyrhynchos',''),(23,'Felis catus',''),(23,'Festuca rubra',''),(23,'Frangula alnus',''),(23,'Meleagris gallopavo',''),(23,'Odocoileus virginianus',''),(23,'Pinus strobus',''),(23,'Pleurozium schreberi',''),(23,'Poecile atricapillus',''),(23,'Polytrichum commune',''),(23,'Ranunculus repens',''),(23,'Rubus idaeus',''),(23,'Rubus occidentalis',''),(23,'Schedonorus pratensis',''),(23,'Sciurus carolinensis',''),(23,'Taraxacum laevigatum',''),(23,'Taraxacum officinale','');
/*!40000 ALTER TABLE `wherespecies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sre'
--
/*!50003 DROP PROCEDURE IF EXISTS `create_species4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_species4`(
	IN	s_cn	VARCHAR(100),
    IN 	s_sn	VARCHAR(100),
	IN 	cat		VARCHAR(100),
    IN 	king	VARCHAR(100)
)
BEGIN
	INSERT INTO sre.species(common_name, scientific, type, kingdom)
    VALUES (s_cn, s_sn, cat, king);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_species5` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_species5`(
	IN	s_cn	VARCHAR(100),
    IN 	s_sn	VARCHAR(100),
    IN 	s_grp	VARCHAR(100),
	IN 	cat		VARCHAR(100),
    IN 	king	VARCHAR(100)
)
BEGIN
	INSERT INTO sre.species(common_name, scientific, sgroup, type, kingdom)
    VALUES (s_cn, s_sn, s_grp, cat, king);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_subdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_subdate`(
	IN	copy	INT,
    IN	n_date	DATE
)
BEGIN
	DECLARE n_id	INT;
    DECLARE n_name	VARCHAR(100);
    DECLARE n_region	INT;
    DECLARE n_latc	DECIMAL(8,6);
	DECLARE n_longc	DECIMAL(8,6);
    DECLARE n_sediment	VARCHAR(100);
    DECLARE n_water	VARCHAR(100);
    DECLARE n_ecosystem	VARCHAR(100);
    
    SELECT MAX(id)+1 INTO n_id FROM subregion;
    SELECT name INTO n_name FROM subregion WHERE id = copy;
    SELECT region INTO n_region FROM subregion WHERE id = copy;
    SELECT latc INTO n_latc FROM subregion WHERE id = copy;
    SELECT longc INTO n_longc FROM subregion WHERE id = copy;
    SELECT sediment INTO n_sediment FROM subregion WHERE id = copy;
    SELECT water INTO n_water FROM subregion WHERE id = copy;
    SELECT ecosystem INTO n_ecosystem FROM subregion WHERE id = copy;
    
	INSERT INTO sre.subregion(id, name, region, latc, longc, sediment, water, ecosystem, recorddate)
    VALUES (n_id, n_name, n_region, n_latc, n_longc, n_sediment, n_water, n_ecosystem, n_date);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_where2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_where2`(
	IN 	s_sn	VARCHAR(100),
	IN	sr_id	INT
)
BEGIN
	INSERT INTO sre.wherespecies(subregion, species)
    VALUES (sr_id, s_sn);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_where3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_where3`(
	IN 	s_sn	VARCHAR(100),
	IN	sr_id	INT,
    IN 	att		VARCHAR(100)
)
BEGIN
	INSERT INTO sre.wherespecies(subregion, species, attribute)
    VALUES (sr_id, s_sn, att);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_species` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_species`(
    IN 	s_sn	VARCHAR(100)
)
BEGIN
	DELETE FROM sre.species
    WHERE scientific = s_sn;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_subregion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_subregion`(
	IN	s_id	INT
 )
BEGIN
	DELETE FROM sre.subregion
    WHERE id = s_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_where` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_where`(
	IN 	s_sn	VARCHAR(100),
	IN	sr_id	INT
 )
BEGIN
	DELETE FROM sre.wherespecies
    WHERE species = s_sn AND subregion = sr_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `track_species` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `track_species`(IN num INT)
BEGIN
SELECT 
    common_name, sub.name
FROM
    species AS s
        JOIN
    wherespecies AS w ON s.scientific = w.species
        JOIN
    subregion AS sub ON w.subregion = sub.id
ORDER BY subregion
LIMIT num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_species` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_species`(
	IN 	new_v	VARCHAR(100),
    IN 	pk		VARCHAR(100)
)
BEGIN
	UPDATE sre.species
    SET common_name = new_v
    WHERE scientific = pk;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_subregion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_subregion`(
	IN 	new_water	VARCHAR(100),
    IN 	pk			INT
)
BEGIN
	UPDATE sre.subregion
    SET water = new_water
    WHERE id = pk;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_subregion_location` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_subregion_location`(
	IN  new_latc    DECIMAL(8,6),
    IN  new_longc   DECIMAL(8,6),
    IN 	pk			INT
)
BEGIN
	UPDATE sre.subregion
    SET latc = new_latc, longc = new_longc
    WHERE id = pk;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_subregion_water` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_subregion_water`(
	IN 	new_water	VARCHAR(100),
    IN 	pk			INT
)
BEGIN
	UPDATE sre.subregion
    SET water = new_water
    WHERE id = pk;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_where` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_where`(
	IN 	new_v	VARCHAR(100),
    IN 	pk1		INT,
    IN 	pk2		VARCHAR(100)
)
BEGIN
	UPDATE sre.wherespecies JOIN species on species = scientific
    SET common_name = new_v
    WHERE subregion = pk1 AND species = pk2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `veiw_regions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `veiw_regions`()
BEGIN
	SELECT id, name, latc, longc, type FROM sre.region;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `veiw_species` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `veiw_species`(
    IN 	sr_id	INT
)
BEGIN
	SELECT common_name, scientific, sgroup, type, kingdom FROM sre.species AS sp
	JOIN sre.wherespecies AS ws ON sp.scientific = ws.species AND sr_id = ws.subregion
	ORDER BY kingdom, type, sgroup DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `veiw_subregions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `veiw_subregions`()
BEGIN
	SELECT id, name, region, water, ecosystem, recorddate FROM sre.subregion
    ORDER BY region;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_regions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_regions`()
BEGIN
	SELECT id, name, latc, longc, type FROM sre.region;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_species` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_species`(
    IN 	sr_name	VARCHAR(45)
)
BEGIN
	SELECT 
    common_name, scientific, sgroup, type, kingdom
FROM
    wherespecies AS ws
        JOIN
    subregion AS sr ON ws.subregion = sr.id
        JOIN
    species AS s ON ws.species = s.scientific
WHERE
    sr.name = sr_name
ORDER BY kingdom , type , sgroup DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_subregions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_subregions`()
BEGIN
	SELECT id, name, region, water, ecosystem, recorddate FROM sre.subregion
    ORDER BY region;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-14 15:41:27
