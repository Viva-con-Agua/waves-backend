-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: wavesdb
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `text` text,
  `state` enum('WAITING','ACCEPTED','REJECTED') NOT NULL DEFAULT 'WAITING',
  `poolevent_id` int(11) NOT NULL,
  `edited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_poolevent_idx` (`poolevent_id`),
  KEY `fk_user_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,1,'lorem ipsum','WAITING',298,'2019-11-18 20:13:56','2019-11-18 20:13:56'),(2,1,'lorem ipsum','REJECTED',304,'2019-11-19 21:24:33','2019-11-18 21:01:29'),(3,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.','ACCEPTED',304,'2019-11-19 21:27:14','2019-11-18 21:32:03'),(4,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.','REJECTED',306,'2019-11-20 21:33:25','2019-11-20 08:56:27'),(5,1,'lkfsadkjhfslkshfkihjsöifgjslkijgkrdhjlgkjdlkjflkdsjlkfjslkjfkjdslkfjdnflksjdflkjsd','ACCEPTED',344,'2019-11-24 17:46:58','2019-11-21 19:04:54');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badge_progress`
--

DROP TABLE IF EXISTS `badge_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `badge_progress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `progress` int(11) NOT NULL DEFAULT '0',
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` enum('comments','connections','votes','poolevents','profiles') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_badge_progress` (`user_id`,`badge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badge_progress`
--

LOCK TABLES `badge_progress` WRITE;
/*!40000 ALTER TABLE `badge_progress` DISABLE KEYS */;
INSERT INTO `badge_progress` VALUES (166,1,54,9,1,'2019-11-21 17:05:10','2019-12-01 14:55:49','poolevents'),(167,2,54,0,0,'2019-11-21 17:05:10','2019-11-21 17:05:10','poolevents'),(168,1,55,4,1,'2019-11-21 17:20:12','2019-11-30 21:38:16','comments'),(169,2,55,0,0,'2019-11-21 17:20:12','2019-11-21 17:20:12','comments'),(170,1,56,0,0,'2019-11-21 17:20:53','2019-11-21 17:20:53','profiles'),(171,2,56,0,0,'2019-11-21 17:20:53','2019-11-21 17:20:53','profiles');
/*!40000 ALTER TABLE `badge_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges`
--

DROP TABLE IF EXISTS `badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `badges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `desc` text,
  `type` enum('comments','poolevents','votes','connections','profiles') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `img_url` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges`
--

LOCK TABLES `badges` WRITE;
/*!40000 ALTER TABLE `badges` DISABLE KEYS */;
INSERT INTO `badges` VALUES (54,'first poolevent','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.','poolevents','2019-11-21 17:05:10','2019-11-21 17:05:10','https://i.ibb.co/CWVHL1p/badges.png '),(55,'comment','comment','comments','2019-11-21 17:20:11','2019-11-21 17:20:11',' https://i.ibb.co/2qwf5L9/game-badges-4.png'),(56,'profile','profile','profiles','2019-11-21 17:20:53','2019-11-21 17:20:53','https://i.ibb.co/3kM9YkF/Badges-Mileston-Profile.png');
/*!40000 ALTER TABLE `badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenges`
--

DROP TABLE IF EXISTS `challenges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `desc` text,
  `badge_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` enum('comments','poolevents','votes','connections','profiles') NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `edited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_challenges` (`badge_id`,`points`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenges`
--

LOCK TABLES `challenges` WRITE;
/*!40000 ALTER TABLE `challenges` DISABLE KEYS */;
INSERT INTO `challenges` VALUES (43,'poolevent','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.',54,'2019-11-21 17:05:10','poolevents',1,'2019-11-21 17:05:10'),(44,'comment','comment',55,'2019-11-21 17:20:12','comments',1,'2019-11-21 17:20:12'),(45,'profile','profile',56,'2019-11-21 17:20:53','profiles',4,'2019-11-21 17:20:53');
/*!40000 ALTER TABLE `challenges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `poolevent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_poolevent_idx` (`poolevent_id`),
  CONSTRAINT `fk_poolevent` FOREIGN KEY (`poolevent_id`) REFERENCES `poolevents` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (42,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.',1,344,'2019-11-22 09:23:03','2019-11-22 09:23:03',NULL),(43,'lorem300;',1,345,'2019-11-23 21:44:56','2019-11-23 21:44:56',NULL),(44,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.',1,344,'2019-11-24 17:47:30','2019-11-24 17:47:30',NULL),(45,'lorem',1,344,'2019-11-30 21:38:16','2019-11-30 21:38:16',NULL);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connections`
--

DROP TABLE IF EXISTS `connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connections` (
  `id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connections`
--

LOCK TABLES `connections` WRITE;
/*!40000 ALTER TABLE `connections` DISABLE KEYS */;
/*!40000 ALTER TABLE `connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descriptions`
--

DROP TABLE IF EXISTS `descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `html` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `poolevent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descriptions`
--

LOCK TABLES `descriptions` WRITE;
/*!40000 ALTER TABLE `descriptions` DISABLE KEYS */;
INSERT INTO `descriptions` VALUES (249,'','<p>loremlorem</p>','2019-11-21 17:34:46','2019-11-21 17:34:46',344),(250,'','<p>lorelorem</p>','2019-11-22 16:31:42','2019-11-22 16:31:42',345),(251,'','<p>lorem lorem</p>','2019-11-24 17:41:12','2019-11-24 17:41:12',346),(252,'','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum. Nunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent condimentum eget felis ut laoreet. Aliquam sodales dolor id mi iaculis, non fermentum leo viverra. Aenean aliquet condimentum placerat. Aenean aliquet diam arcu. Curabitur ac ligula sem. Mauris tincidunt mauris at ligula tincidunt interdum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus sagittis, eros.</p>','2019-12-01 12:46:20','2019-12-01 12:46:20',347),(253,'','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum. Nunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent condimentum eget felis ut laoreet. Aliquam sodales dolor id mi iaculis, non fermentum leo viverra. Aenean aliquet condimentum placerat. Aenean aliquet diam arcu. Curabitur ac ligula sem. Mauris tincidunt mauris at ligula tincidunt interdum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus sagittis, eros.</p>','2019-12-01 12:46:45','2019-12-01 12:46:45',348),(254,'','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum. Nunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent condimentum eget felis ut laoreet. Aliquam sodales dolor id mi iaculis, non fermentum leo viverra. Aenean aliquet condimentum placerat. Aenean aliquet diam arcu. Curabitur ac ligula sem. Mauris tincidunt mauris at ligula tincidunt interdum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus sagittis, eros.</p>','2019-12-01 12:47:22','2019-12-01 12:47:22',349),(255,'','<p>lorem lorem</p>','2019-12-01 14:39:28','2019-12-01 14:39:28',350),(256,'','<p>lorem lorem</p>','2019-12-01 14:53:02','2019-12-01 14:53:02',351),(257,'','<p>lorem lorem</p>','2019-12-01 14:55:49','2019-12-01 14:55:49',352),(258,'','<p>lorem</p>','2019-12-01 15:06:50','2019-12-01 15:06:50',353),(259,'','<p>lorem</p>','2019-12-01 15:16:05','2019-12-01 15:16:05',354),(260,'','<p>lorem</p>','2019-12-01 15:16:08','2019-12-01 15:16:08',355),(261,'','<p>lorem</p>','2019-12-01 15:16:09','2019-12-01 15:16:09',356);
/*!40000 ALTER TABLE `descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poolevent_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `uq_waves_p_u` (`poolevent_id`,`user_id`),
  KEY `userfave_idx` (`user_id`),
  KEY `poolevent_fave_idx` (`poolevent_id`),
  CONSTRAINT `poolevent_fave` FOREIGN KEY (`poolevent_id`) REFERENCES `poolevents` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (15,344,1,'2019-11-22 08:34:57'),(17,345,1,'2019-11-22 16:33:57'),(18,344,0,'2019-12-01 19:45:03'),(19,345,0,'2019-12-01 19:45:16'),(23,345,4,'2019-12-01 19:48:33'),(24,344,4,'2019-12-01 19:48:41');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poolevent_id` int(11) NOT NULL,
  `street_name` varchar(45) NOT NULL,
  `street_number` varchar(45) NOT NULL,
  `full_address` varchar(45) DEFAULT NULL,
  `long` varchar(45) NOT NULL,
  `lat` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `country` varchar(45) DEFAULT NULL,
  `post_code` varchar(45) DEFAULT NULL,
  `desc` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (274,344,'Lothstraße','12',NULL,'11.54889030000004','48.1510766','München','Deutschland','80335','loremlorem'),(275,345,'Bernauer Straße','21',NULL,'13.291279400000008','52.5753501','Berlin','Deutschland','13507',''),(276,346,'Am Hauptbahnhof','12',NULL,'8.664729999999963','50.10814','Frankfurt am Main','Deutschland','60329','Am Hauptbahnhof 12, Frankfurt am Main, Deutschland'),(277,347,'Aschauer Straße','20',NULL,'11.60024629999998','48.10564299999999','München','Deutschland','81549','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante'),(278,348,'Aschauer Straße','20',NULL,'11.60024629999998','48.10564299999999','München','Deutschland','81549','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante'),(279,349,'Aschauer Straße','20',NULL,'11.60024629999998','48.10564299999999','München','Deutschland','81549','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante'),(280,350,'Aßmannshauser Straße','23',NULL,'13.313441699999998','52.4774985','Berlin','Deutschland','14197','lorem lorem'),(281,351,'Lorettostraße','12',NULL,'6.7668826999999965','51.2144985','Düsseldorf','Deutschland','40219','lorem lorem'),(282,352,'Lorettostraße','12',NULL,'6.7668826999999965','51.2144985','Düsseldorf','Deutschland','40219','lorem lorem'),(283,353,'Lothstraße','12',NULL,'11.54889030000004','48.1510766','München','Deutschland','80335','lorem'),(284,354,'Lothstraße','12',NULL,'11.54889030000004','48.1510766','München','Deutschland','80335','lorem'),(285,355,'Lothstraße','12',NULL,'11.54889030000004','48.1510766','München','Deutschland','80335','lorem'),(286,356,'Lothstraße','12',NULL,'11.54889030000004','48.1510766','München','Deutschland','80335','lorem');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_badges`
--

DROP TABLE IF EXISTS `notification_badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_badges` (
  `id` int(11) NOT NULL,
  `notification_type` enum('NEW') DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_badges`
--

LOCK TABLES `notification_badges` WRITE;
/*!40000 ALTER TABLE `notification_badges` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_poolevents`
--

DROP TABLE IF EXISTS `notification_poolevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_poolevents` (
  `id` int(11) NOT NULL,
  `notification_type` enum('NEW') DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_poolevents`
--

LOCK TABLES `notification_poolevents` WRITE;
/*!40000 ALTER TABLE `notification_poolevents` DISABLE KEYS */;
INSERT INTO `notification_poolevents` VALUES (440,'NEW',352),(441,'NEW',352),(442,'NEW',352),(443,'NEW',353),(444,'NEW',353),(445,'NEW',353),(446,'NEW',354),(447,'NEW',354),(448,'NEW',354),(449,'NEW',355),(450,'NEW',355),(451,'NEW',355),(452,'NEW',356),(453,'NEW',356),(454,'NEW',356);
/*!40000 ALTER TABLE `notification_poolevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` enum('poolevents','comments','votes') NOT NULL COMMENT 'ENUM(''PE_NEW'', \\\\n''PE_RELEASED'',\\\\n ''PE_CANCELLED'', \\\\n''NEW_COMMENT'', \\\\n''NEW_VOTE'', \\\\n''APPLICATION_REJECTED'',\\\\n ''APPLICATION_ACCEPETED’,\\\\n)',
  `desc` text,
  `source_id` int(11) NOT NULL,
  `dirty` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trigger_id` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (415,1,'',NULL,344,1,'2019-11-21 17:34:46',NULL),(416,2,'',NULL,344,0,'2019-11-21 17:34:46',NULL),(417,1,'',NULL,0,1,'2019-11-21 17:34:46',NULL),(418,2,'',NULL,0,0,'2019-11-21 17:34:46',NULL),(419,1,'',NULL,0,1,'2019-11-22 09:23:04',NULL),(420,2,'',NULL,0,0,'2019-11-22 09:23:04',NULL),(421,1,'',NULL,345,1,'2019-11-22 16:31:42',NULL),(422,2,'',NULL,345,0,'2019-11-22 16:31:42',NULL),(423,1,'',NULL,346,1,'2019-11-24 17:41:12',NULL),(424,2,'',NULL,346,0,'2019-11-24 17:41:12',NULL),(425,1,'',NULL,0,1,'2019-12-01 12:46:20',NULL),(426,2,'',NULL,0,0,'2019-12-01 12:46:20',NULL),(427,4,'',NULL,0,0,'2019-12-01 12:46:20',NULL),(428,1,'',NULL,0,1,'2019-12-01 12:46:45',NULL),(429,2,'',NULL,0,0,'2019-12-01 12:46:45',NULL),(430,4,'',NULL,0,0,'2019-12-01 12:46:45',NULL),(431,1,'',NULL,0,1,'2019-12-01 12:47:22',NULL),(432,2,'',NULL,0,0,'2019-12-01 12:47:22',NULL),(433,4,'',NULL,0,0,'2019-12-01 12:47:22',NULL),(434,1,'',NULL,0,1,'2019-12-01 14:39:28',NULL),(435,2,'',NULL,0,0,'2019-12-01 14:39:28',NULL),(436,4,'',NULL,0,0,'2019-12-01 14:39:28',NULL),(437,1,'poolevents',NULL,0,1,'2019-12-01 14:53:02',NULL),(438,2,'poolevents',NULL,0,0,'2019-12-01 14:53:02',NULL),(439,4,'poolevents',NULL,0,0,'2019-12-01 14:53:02',NULL),(440,1,'poolevents',NULL,0,1,'2019-12-01 14:55:49',NULL),(441,2,'poolevents',NULL,0,0,'2019-12-01 14:55:49',NULL),(442,4,'poolevents',NULL,0,0,'2019-12-01 14:55:49',NULL),(443,1,'poolevents',NULL,0,1,'2019-12-01 15:06:50',NULL),(444,2,'poolevents',NULL,0,0,'2019-12-01 15:06:50',NULL),(445,4,'poolevents',NULL,0,0,'2019-12-01 15:06:50',NULL),(446,1,'poolevents',NULL,0,1,'2019-12-01 15:16:05',NULL),(447,2,'poolevents',NULL,0,0,'2019-12-01 15:16:05',NULL),(448,4,'poolevents',NULL,0,0,'2019-12-01 15:16:05',NULL),(449,1,'poolevents',NULL,0,1,'2019-12-01 15:16:08',NULL),(450,2,'poolevents',NULL,0,0,'2019-12-01 15:16:08',NULL),(451,4,'poolevents',NULL,0,0,'2019-12-01 15:16:08',NULL),(452,1,'poolevents',NULL,0,1,'2019-12-01 15:16:09',NULL),(453,2,'poolevents',NULL,0,0,'2019-12-01 15:16:09',NULL),(454,4,'poolevents',NULL,0,0,'2019-12-01 15:16:09',NULL);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poolevents`
--

DROP TABLE IF EXISTS `poolevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poolevents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `event_start` datetime DEFAULT NULL,
  `event_end` datetime DEFAULT NULL,
  `application_start` datetime DEFAULT NULL,
  `application_end` datetime DEFAULT NULL,
  `asp_event_Id` int(11) DEFAULT NULL,
  `website` text,
  `supporter_lim` int(11) DEFAULT '0',
  `active_user_only` tinyint(1) DEFAULT '0',
  `user_id` varchar(128) NOT NULL,
  `edited_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` enum('UNRELEASED','RELEASED','REJECTED','DRAFT') NOT NULL DEFAULT 'UNRELEASED',
  `type` enum('FESTIVAL','GOLDEIMER_FESTIVAL','RUN4WASH','CONCERT','OTHER') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poolevents`
--

LOCK TABLES `poolevents` WRITE;
/*!40000 ALTER TABLE `poolevents` DISABLE KEYS */;
INSERT INTO `poolevents` VALUES (344,'lorem','2019-11-21 17:34:46','2019-11-21 17:34:19','2019-11-21 17:34:20','2019-11-21 17:34:42','2019-11-21 17:34:43',0,'loremlorem',1,0,'1','2019-11-21 17:35:39','RELEASED','FESTIVAL'),(345,'Tocotronic','2019-11-22 16:31:42','2019-11-22 16:31:16','2019-11-22 16:31:17','2019-11-22 16:31:36','2019-11-22 16:31:37',0,'www.tocotronic.com',4,0,'1','2019-11-22 16:32:26','RELEASED','FESTIVAL'),(346,'Schönhauser allee','2019-11-24 17:41:12','2019-11-24 17:40:39','2019-11-24 17:40:40','2019-11-24 17:41:06','2019-11-24 17:41:07',0,'www.a9.com',1,0,'1','2019-11-24 20:42:36','RELEASED','GOLDEIMER_FESTIVAL'),(347,'loremrew','2019-12-01 12:46:20','2019-12-01 12:43:53','2019-12-01 12:43:52','2019-12-01 12:43:34','2019-12-01 12:43:36',0,'loremlorem',1,0,'1','2019-12-01 12:46:20','UNRELEASED','CONCERT'),(348,'loremrew','2019-12-01 12:46:45','2019-12-01 12:43:53','2019-12-01 12:43:52','2019-12-01 12:43:34','2019-12-01 12:43:36',0,'loremlorem',1,0,'1','2019-12-01 12:46:45','UNRELEASED','CONCERT'),(349,'loremrew','2019-12-01 12:47:22','2019-12-01 12:43:53','2019-12-01 12:43:52','2019-12-01 12:43:34','2019-12-01 12:43:36',0,'loremlorem',1,0,'1','2019-12-01 12:47:22','UNRELEASED','CONCERT'),(350,'lorem lorem','2019-12-01 14:39:28','2019-12-01 14:38:32','2019-12-01 14:38:33','2019-12-01 14:38:47','2019-12-01 14:38:57',0,'lorem',1,0,'1','2019-12-01 14:39:28','UNRELEASED','GOLDEIMER_FESTIVAL'),(351,'lorem lorem lorem ','2019-12-01 14:53:02','2019-12-01 14:52:34','2019-12-01 14:52:36','2019-12-01 14:52:57','2019-12-01 14:52:58',0,'loremlore',4,0,'1','2019-12-01 14:53:02','UNRELEASED','CONCERT'),(352,'lorem lorem lorem ','2019-12-01 14:55:49','2019-12-01 14:52:34','2019-12-01 14:52:36','2019-12-01 14:52:57','2019-12-01 14:52:58',0,'loremlore',4,0,'1','2019-12-01 14:55:49','UNRELEASED','CONCERT'),(353,'lorem','2019-12-01 15:06:50','2019-12-01 15:06:08','2019-12-01 15:06:09','2019-12-01 15:06:24','2019-12-01 15:06:24',0,'lorem',1,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2019-12-01 15:06:50','UNRELEASED','FESTIVAL'),(354,'lorem','2019-12-01 15:16:05','2019-12-01 15:06:08','2019-12-01 15:06:09','2019-12-01 15:06:24','2019-12-01 15:06:24',0,'lorem',1,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2019-12-01 15:16:05','UNRELEASED','FESTIVAL'),(355,'lorem','2019-12-01 15:16:08','2019-12-01 15:06:08','2019-12-01 15:06:09','2019-12-01 15:06:24','2019-12-01 15:06:24',0,'lorem',1,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2019-12-01 15:16:08','UNRELEASED','FESTIVAL'),(356,'lorem','2019-12-01 15:16:09','2019-12-01 15:06:08','2019-12-01 15:06:09','2019-12-01 15:06:24','2019-12-01 15:06:24',0,'lorem',1,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2019-12-01 15:16:09','UNRELEASED','FESTIVAL');
/*!40000 ALTER TABLE `poolevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(128) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email_address` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `access_token` text,
  `full_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1','John','Doe','2019-11-06 21:53:08','2019-11-06 21:53:08','john.doe@scoop.com',NULL,NULL,NULL,NULL),('2','Jane','Doe','2019-11-07 11:46:49','2019-11-07 11:46:49',NULL,NULL,NULL,NULL,NULL),('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','','Bilal','2019-12-01 11:20:44','2019-12-01 11:20:44',NULL,NULL,'supporter','7af98a2fdaea1a23cbbf5907','Bilal');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_uservote_id_idx` (`user_id`),
  KEY `fk_votecomment_id_idx` (`comment_id`),
  CONSTRAINT `fk_votecomment_id` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
INSERT INTO `votes` VALUES (21,1,'2019-11-22 10:37:32',42),(23,1,'2019-11-23 21:45:01',43),(24,1,'2019-11-24 17:47:36',44);
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-01 22:36:06
