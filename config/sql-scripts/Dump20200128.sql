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
  `user_id` varchar(128) NOT NULL,
  `text` text,
  `state` enum('WAITING','ACCEPTED','REJECTED') NOT NULL DEFAULT 'WAITING',
  `poolevent_id` int(11) NOT NULL,
  `edited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_uid_peid` (`user_id`,`poolevent_id`),
  KEY `fk_poolevent_idx` (`poolevent_id`),
  KEY `fk_user_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (65,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.','ACCEPTED',457,'2020-01-11 23:06:49','2020-01-11 23:05:39'),(66,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','Adressbeschreibung: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.\n\n','REJECTED',458,'2020-01-15 08:58:33','2020-01-11 23:12:30'),(67,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.','ACCEPTED',459,'2020-01-17 18:29:54','2020-01-12 16:58:33'),(68,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.','ACCEPTED',458,'2020-01-14 20:36:53','2020-01-12 22:03:23'),(69,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum.\n\nNunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent cond','WAITING',463,'2020-01-13 19:47:50','2020-01-13 19:47:50'),(70,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.','ACCEPTED',461,'2020-01-24 09:59:22','2020-01-23 20:13:14'),(71,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.','ACCEPTED',471,'2020-01-26 16:50:44','2020-01-26 16:44:55'),(72,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.','ACCEPTED',465,'2020-01-26 17:11:14','2020-01-26 17:09:50');
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
  `user_id` varchar(128) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `progress` int(11) NOT NULL DEFAULT '0',
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` enum('comments','connections','votes','poolevents','profiles','info','applications') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_badge_progress` (`user_id`,`badge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=788 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badge_progress`
--

LOCK TABLES `badge_progress` WRITE;
/*!40000 ALTER TABLE `badge_progress` DISABLE KEYS */;
INSERT INTO `badge_progress` VALUES (762,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',374,0,1,'2020-01-12 08:27:11','2020-01-22 07:50:55','info'),(763,'8d411dc4-e76f-4d0e-a027-056a0bc43be5',374,0,1,'2020-01-12 08:27:11','2020-01-16 08:29:36','info'),(764,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',375,8,0,'2020-01-12 08:27:11','2020-01-12 11:33:14','profiles'),(765,'8d411dc4-e76f-4d0e-a027-056a0bc43be5',375,8,0,'2020-01-12 08:27:11','2020-01-12 11:02:35','profiles'),(766,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',376,19,0,'2020-01-12 08:27:11','2020-01-27 13:38:06','poolevents'),(767,'8d411dc4-e76f-4d0e-a027-056a0bc43be5',376,0,0,'2020-01-12 08:27:11','2020-01-12 08:27:11','poolevents'),(768,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',377,19,0,'2020-01-12 08:27:11','2020-01-27 13:38:06','poolevents'),(769,'8d411dc4-e76f-4d0e-a027-056a0bc43be5',377,0,0,'2020-01-12 08:27:11','2020-01-12 08:27:11','poolevents'),(770,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',378,10,1,'2020-01-12 08:27:11','2020-01-12 09:26:48','poolevents'),(771,'8d411dc4-e76f-4d0e-a027-056a0bc43be5',378,0,0,'2020-01-12 08:27:11','2020-01-12 08:27:11','poolevents'),(772,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',379,1,1,'2020-01-12 08:27:11','2020-01-16 13:50:53','comments'),(773,'8d411dc4-e76f-4d0e-a027-056a0bc43be5',379,1,1,'2020-01-12 08:27:11','2020-01-12 11:06:11','comments'),(774,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',380,5,1,'2020-01-12 08:27:11','2020-01-22 08:18:59','comments'),(775,'8d411dc4-e76f-4d0e-a027-056a0bc43be5',380,1,0,'2020-01-12 08:27:11','2020-01-12 11:06:11','comments'),(776,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',381,10,1,'2020-01-12 08:27:11','2020-01-23 20:19:57','comments'),(777,'8d411dc4-e76f-4d0e-a027-056a0bc43be5',381,1,0,'2020-01-12 08:27:11','2020-01-12 11:06:11','comments'),(778,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',382,1,1,'2020-01-12 08:27:11','2020-01-13 17:44:27','votes'),(779,'8d411dc4-e76f-4d0e-a027-056a0bc43be5',382,1,1,'2020-01-12 08:27:11','2020-01-12 11:06:28','votes'),(780,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',383,3,0,'2020-01-12 08:27:11','2020-01-23 20:20:08','votes'),(781,'8d411dc4-e76f-4d0e-a027-056a0bc43be5',383,1,0,'2020-01-12 08:27:11','2020-01-12 11:06:28','votes'),(782,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',384,7,0,'2020-01-12 08:27:11','2020-01-26 17:09:50','applications'),(783,'8d411dc4-e76f-4d0e-a027-056a0bc43be5',384,1,1,'2020-01-12 08:27:11','2020-01-12 22:03:23','applications'),(784,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',385,5,1,'2020-01-12 08:27:11','2020-01-23 20:13:14','applications'),(785,'8d411dc4-e76f-4d0e-a027-056a0bc43be5',385,1,0,'2020-01-12 08:27:11','2020-01-12 22:03:23','applications'),(786,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',386,7,0,'2020-01-12 08:27:11','2020-01-26 17:09:50','applications'),(787,'8d411dc4-e76f-4d0e-a027-056a0bc43be5',386,1,0,'2020-01-12 08:27:11','2020-01-12 22:03:23','applications');
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
  `type` enum('comments','poolevents','votes','connections','profiles','info','applications') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `img_url` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=387 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges`
--

LOCK TABLES `badges` WRITE;
/*!40000 ALTER TABLE `badges` DISABLE KEYS */;
INSERT INTO `badges` VALUES (374,'informed','read the information site','info','2020-01-12 08:27:11','2020-01-12 08:27:11','//b.thumbs.redditmedia.com/xdKEqKiFPEtQPTvc0Qh_MoR-8y4IYkHnMajh27qhGjE.png'),(375,'profile completed','complete your profile','profiles','2020-01-12 08:27:11','2020-01-12 08:27:11','//b.thumbs.redditmedia.com/xdKEqKiFPEtQPTvc0Qh_MoR-8y4IYkHnMajh27qhGjE.png'),(376,'First Event','Create your first Event','poolevents','2020-01-12 08:27:11','2020-01-12 08:27:11','//b.thumbs.redditmedia.com/loJzR3eUrPNvKw6g9RktAletCoQjMityx8emC5w83sw.png'),(377,'Five Events','Create 5 Event','poolevents','2020-01-12 08:27:11','2020-01-12 08:27:11','//b.thumbs.redditmedia.com/loJzR3eUrPNvKw6g9RktAletCoQjMityx8emC5w83sw.png'),(378,'Ten Events','Create 10 Event','poolevents','2020-01-12 08:27:11','2020-01-12 08:27:11','//b.thumbs.redditmedia.com/loJzR3eUrPNvKw6g9RktAletCoQjMityx8emC5w83sw.png'),(379,'first comment','write your first comment','comments','2020-01-12 08:27:11','2020-01-12 08:27:11','//b.thumbs.redditmedia.com/TnRIsjez67SOHX-F7iW56rSNpbORu-0V6zsR92TV6Qc.png'),(380,'Five comments','write 5 comments','comments','2020-01-12 08:27:11','2020-01-12 08:27:11','//b.thumbs.redditmedia.com/TnRIsjez67SOHX-F7iW56rSNpbORu-0V6zsR92TV6Qc.png'),(381,'Ten comments','write ten comments','comments','2020-01-12 08:27:11','2020-01-12 08:27:11','//b.thumbs.redditmedia.com/TnRIsjez67SOHX-F7iW56rSNpbORu-0V6zsR92TV6Qc.png'),(382,'First Votes','Vote for the first time','votes','2020-01-12 08:27:11','2020-01-12 08:27:11','//a.thumbs.redditmedia.com/uag6mXIzTCfMDaLAGr8IQ6PdPnVerANcJDIgPZDeDx0.png'),(383,'Five Votes','Vote five times','votes','2020-01-12 08:27:11','2020-01-12 08:27:11','//a.thumbs.redditmedia.com/uag6mXIzTCfMDaLAGr8IQ6PdPnVerANcJDIgPZDeDx0.png'),(384,'First application','Apply for the first time','applications','2020-01-12 08:27:11','2020-01-12 08:27:11','//b.thumbs.redditmedia.com/xdKEqKiFPEtQPTvc0Qh_MoR-8y4IYkHnMajh27qhGjE.png'),(385,'5 applications','apply for the fifth time','applications','2020-01-12 08:27:11','2020-01-12 08:27:11','//b.thumbs.redditmedia.com/xdKEqKiFPEtQPTvc0Qh_MoR-8y4IYkHnMajh27qhGjE.png'),(386,'10 applications','apply for the tenth time','applications','2020-01-12 08:27:11','2020-01-12 08:27:11','//b.thumbs.redditmedia.com/xdKEqKiFPEtQPTvc0Qh_MoR-8y4IYkHnMajh27qhGjE.png');
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
  `type` enum('comments','poolevents','votes','connections','profiles','info','applications') NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `edited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_challenges` (`badge_id`,`points`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=376 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenges`
--

LOCK TABLES `challenges` WRITE;
/*!40000 ALTER TABLE `challenges` DISABLE KEYS */;
INSERT INTO `challenges` VALUES (363,'informed','read the information site',374,'2020-01-12 08:27:11','info',1,'2020-01-12 08:27:11'),(364,'profile completed','complete your profile',375,'2020-01-12 08:27:11','profiles',9,'2020-01-12 08:27:11'),(365,'First Event','Create your first Event',376,'2020-01-12 08:27:11','poolevents',1,'2020-01-12 08:27:11'),(366,'Five Events','Create 5 Event',377,'2020-01-12 08:27:11','poolevents',5,'2020-01-12 08:27:11'),(367,'Ten Events','Create 10 Event',378,'2020-01-12 08:27:11','poolevents',10,'2020-01-12 08:27:11'),(368,'first comment','write your first comment',379,'2020-01-12 08:27:11','comments',1,'2020-01-12 08:27:11'),(369,'Five comments','write 5 comments',380,'2020-01-12 08:27:11','comments',5,'2020-01-12 08:27:11'),(370,'Ten comments','write ten comments',381,'2020-01-12 08:27:11','comments',10,'2020-01-12 08:27:11'),(371,'First Votes','Vote for the first time',382,'2020-01-12 08:27:11','votes',1,'2020-01-12 08:27:11'),(372,'Five Votes','Vote five times',383,'2020-01-12 08:27:11','votes',5,'2020-01-12 08:27:11'),(373,'First application','Apply for the first time',384,'2020-01-12 08:27:11','applications',1,'2020-01-12 08:27:11'),(374,'5 applications','apply for the fifth time',385,'2020-01-12 08:27:11','applications',5,'2020-01-12 08:27:11'),(375,'10 applications','apply for the tenth time',386,'2020-01-12 08:27:11','applications',10,'2020-01-12 08:27:11');
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
  `user_id` varchar(128) NOT NULL,
  `poolevent_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_poolevent_idx` (`poolevent_id`),
  CONSTRAINT `fk_poolevent` FOREIGN KEY (`poolevent_id`) REFERENCES `poolevents` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (140,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum.\n\nNunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent cond','8d411dc4-e76f-4d0e-a027-056a0bc43be5',458,'2020-01-12 11:06:11','2020-01-12 11:06:11',NULL),(141,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget.','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',458,'2020-01-16 13:50:53','2020-01-16 13:50:53',NULL),(142,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',459,'2020-01-21 21:17:51','2020-01-21 21:17:51',NULL),(143,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum.\n\nNunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent cond','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',461,'2020-01-22 08:12:18','2020-01-22 08:12:18',NULL),(144,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',461,'2020-01-22 08:16:54','2020-01-22 08:16:54',NULL),(145,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum.\n\nNunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent cond','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',461,'2020-01-22 08:18:59','2020-01-22 08:18:59',NULL),(146,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum.\n\nNunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent cond','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',461,'2020-01-22 08:19:15','2020-01-22 08:19:15',NULL),(147,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',459,'2020-01-23 20:19:50','2020-01-23 20:19:50',NULL),(148,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',459,'2020-01-23 20:19:56','2020-01-23 20:19:56',NULL),(149,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',459,'2020-01-23 20:19:56','2020-01-23 20:19:56',NULL),(150,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',459,'2020-01-23 20:19:57','2020-01-23 20:19:57',NULL),(151,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',459,'2020-01-23 20:19:57','2020-01-23 20:19:57',NULL),(152,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',459,'2020-01-23 20:19:57','2020-01-23 20:19:57',NULL),(153,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',459,'2020-01-23 20:19:57','2020-01-23 20:19:57',NULL),(154,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',459,'2020-01-23 20:19:57','2020-01-23 20:19:57',NULL),(155,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',459,'2020-01-23 20:19:57','2020-01-23 20:19:57',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=380 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descriptions`
--

LOCK TABLES `descriptions` WRITE;
/*!40000 ALTER TABLE `descriptions` DISABLE KEYS */;
INSERT INTO `descriptions` VALUES (361,'','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.</p>','2020-01-11 19:19:21','2020-01-11 20:11:22',456),(362,'','<p>Lorem ipsum dolor.</p>','2020-01-11 19:19:38','2020-01-11 19:19:38',457),(363,'','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.</p>','2020-01-11 19:19:39','2020-01-16 16:09:23',458),(364,'','<p>Lorem ipsum dolor.</p>','2020-01-11 19:19:40','2020-01-11 19:19:40',459),(365,'','<p>Lorem ipsum dolor.</p>','2020-01-11 19:19:41','2020-01-11 19:19:41',460),(366,'','<p>Lorem ipsum dolor.</p>','2020-01-11 19:19:41','2020-01-11 19:19:41',461),(367,'','<p>loremLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.</p>','2020-01-12 09:02:49','2020-01-12 09:02:49',462),(368,'','<p>loremLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.</p>','2020-01-12 09:02:57','2020-01-12 09:02:57',463),(369,'','<p>lorem</p>','2020-01-12 09:25:20','2020-01-12 09:25:20',464),(370,'','<p>lorem</p>','2020-01-12 09:26:48','2020-01-12 09:26:48',465),(371,'','<p>scoop</p>','2020-01-13 19:31:22','2020-01-13 19:31:22',466),(372,'','<p>scoop</p>','2020-01-13 19:31:28','2020-01-13 19:31:28',467),(373,'','<p>scoop</p>','2020-01-13 19:31:37','2020-01-13 19:31:37',468),(374,'','<p>scoop</p>','2020-01-13 19:33:21','2020-01-13 19:33:21',469),(375,'','<p>hidden</p>','2020-01-13 20:26:01','2020-01-13 20:26:01',470),(376,'','','2020-01-17 19:07:37','2020-01-17 19:07:37',471),(377,'','','2020-01-18 11:50:29','2020-01-18 11:50:29',472),(378,'','<p>Lorem ipsum.</p>','2020-01-27 13:32:18','2020-01-27 13:32:18',473),(379,'','<p>Lorem ipsum.</p>','2020-01-27 13:38:06','2020-01-27 13:38:06',474);
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
  `user_id` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `userfave_idx` (`user_id`),
  KEY `poolevent_fave_idx` (`poolevent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (44,381,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2019-12-26 21:55:35'),(45,382,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2019-12-26 21:55:36'),(46,380,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2019-12-26 21:55:53'),(47,380,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2019-12-27 15:23:31'),(48,383,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2019-12-27 15:23:35'),(49,385,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2019-12-27 18:49:12'),(50,394,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2019-12-29 23:12:15'),(51,407,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2019-12-30 19:11:06'),(52,406,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-02 08:43:32'),(54,420,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-07 19:04:25'),(55,420,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2020-01-07 20:32:15'),(56,447,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2020-01-07 20:58:03'),(58,451,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2020-01-10 13:35:38'),(60,450,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2020-01-10 13:43:47'),(62,458,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-11 19:40:08'),(63,459,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-11 19:40:09'),(64,460,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-11 19:40:11');
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
  `route` varchar(45) NOT NULL,
  `street_number` varchar(45) NOT NULL,
  `full_address` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) NOT NULL,
  `latitude` varchar(45) NOT NULL,
  `locality` varchar(45) NOT NULL,
  `country` varchar(45) DEFAULT NULL,
  `postal_code` varchar(45) DEFAULT NULL,
  `desc` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (384,456,'Schönefelder Chaussee','2','Schönefelder Chaussee 2, 12524 Berlin','13.53542','52.41835','Berlin','','12524','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.'),(385,457,'Schönefelder Chaussee','2','Schönefelder Chaussee 2, 12524 Berlin','13.53542','52.41835','Berlin','','12524','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.'),(386,458,'Schönefelder Chaussee','2','Schönefelder Chaussee 2, 12524 Berlin','13.53542','52.41835','Berlin','','12524','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.'),(387,459,'Schönefelder Chaussee','2','Schönefelder Chaussee 2, 12524 Berlin','13.53542','52.41835','Berlin','','12524','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.'),(388,460,'Schönefelder Chaussee','2','Schönefelder Chaussee 2, 12524 Berlin','13.53542','52.41835','Berlin','','12524','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.'),(389,461,'Schönefelder Chaussee','2','Schönefelder Chaussee 2, 12524 Berlin','13.53542','52.41835','Berlin','','12524','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.'),(390,462,'Schönhauser Allee','2','Schönhauser Allee 2, 10119 Berlin','13.41067','52.52889','Berlin','','10119','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.'),(391,463,'Schönhauser Allee','2','Schönhauser Allee 2, 10119 Berlin','13.41067','52.52889','Berlin','','10119','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.'),(392,464,'Radler Straße','2','Radler Straße 2, 87600 Kaufbeuren','10.6349513','47.9052502','Kaufbeuren','','87600','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum.'),(393,465,'Radler Straße','2','Radler Straße 2, 87600 Kaufbeuren','10.6349513','47.9052502','Kaufbeuren','','87600','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum.'),(394,466,'Wall Street','2','Wall Street 2, 10005 New York','-74.0113063','40.7077394','New York','','10005','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum.\n\nNunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent cond'),(395,467,'Wall Street','2','Wall Street 2, 10005 New York','-74.0113063','40.7077394','New York','','10005','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum.\n\nNunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent cond'),(396,468,'Wall Street','2','Wall Street 2, 10005 New York','-74.0113063','40.7077394','New York','','10005','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum.\n\nNunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent cond'),(397,469,'Wall Street','2','Wall Street 2, 10005 New York','-74.0113063','40.7077394','New York','','10005','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum.\n\nNunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent cond'),(398,470,'Lorettostraße','2','Lorettostraße 2, 40219 Düsseldorf','6.7673341','51.2149774','Düsseldorf','','40219','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.'),(399,471,'Sacramento Street','2','Sacramento Street 2, 94111 San Francisco','-122.3981838','37.7945759','San Francisco','','94111','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum.'),(400,472,'Warschauer Straße','12','Warschauer Straße 12, 10243 Berlin','13.4525667','52.5132387','Berlin','','10243','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.'),(401,473,'Warschauer Straße','12','Warschauer Straße 12, 10243 Berlin','13.4525667','52.5132387','Berlin','','10243','Lorem ipsum.'),(402,474,'Warschauer Straße','12','Warschauer Straße 12, 10243 Berlin','13.4525667','52.5132387','Berlin','','10243','Lorem ipsum.');
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
INSERT INTO `notification_badges` VALUES (722,'NEW',378),(723,'NEW',379),(724,'NEW',382),(725,'NEW',384),(726,'NEW',382),(737,'NEW',379),(742,'NEW',380),(743,'NEW',385),(744,'NEW',381);
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
INSERT INTO `notification_poolevents` VALUES (708,'NEW',456),(709,'NEW',457),(710,'NEW',458),(711,'NEW',459),(712,'NEW',460),(713,'NEW',461),(714,'NEW',462),(715,'NEW',462),(716,'NEW',463),(717,'NEW',463),(718,'NEW',464),(719,'NEW',464),(720,'NEW',465),(721,'NEW',465),(727,'NEW',466),(728,'NEW',466),(729,'NEW',467),(730,'NEW',467),(731,'NEW',468),(732,'NEW',468),(733,'NEW',469),(734,'NEW',469),(735,'NEW',470),(736,'NEW',470),(738,'NEW',471),(739,'NEW',471),(740,'NEW',472),(741,'NEW',472),(745,'NEW',473),(746,'NEW',473),(747,'NEW',474),(748,'NEW',474);
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
  `user_id` varchar(128) NOT NULL,
  `type` enum('poolevents','comments','votes','badges') NOT NULL COMMENT 'ENUM(''PE_NEW'', \\\\\\\\n''PE_RELEASED'',\\\\\\\\n ''PE_CANCELLED'', \\\\\\\\n''NEW_COMMENT'', \\\\\\\\n''NEW_VOTE'', \\\\\\\\n''APPLICATION_REJECTED'',\\\\\\\\n ''APPLICATION_ACCEPETED’,\\\\\\\\n)',
  `desc` text,
  `source_id` int(11) NOT NULL,
  `dirty` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trigger_id` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=749 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (708,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-11 19:19:21',NULL),(709,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-11 19:19:38',NULL),(710,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-11 19:19:39',NULL),(711,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-11 19:19:40',NULL),(712,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-11 19:19:41',NULL),(713,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-11 19:19:41',NULL),(714,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-12 09:02:49',NULL),(715,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-12 09:02:49',NULL),(716,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-12 09:02:57',NULL),(717,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-12 09:02:57',NULL),(718,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-12 09:25:20',NULL),(719,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-12 09:25:20',NULL),(720,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-12 09:26:48',NULL),(721,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-12 09:26:48',NULL),(722,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','badges','',378,1,'2020-01-12 09:26:48','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(723,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',379,1,'2020-01-12 11:06:11','8d411dc4-e76f-4d0e-a027-056a0bc43be5'),(724,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',382,1,'2020-01-12 11:06:28','8d411dc4-e76f-4d0e-a027-056a0bc43be5'),(725,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',384,1,'2020-01-12 22:03:23','8d411dc4-e76f-4d0e-a027-056a0bc43be5'),(726,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','badges','',382,1,'2020-01-13 17:44:27','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(727,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-13 19:31:22',NULL),(728,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-13 19:31:22',NULL),(729,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-13 19:31:28',NULL),(730,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-13 19:31:28',NULL),(731,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-13 19:31:37',NULL),(732,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-13 19:31:37',NULL),(733,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-13 19:33:21',NULL),(734,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-13 19:33:21',NULL),(735,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-13 20:26:01',NULL),(736,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-13 20:26:01',NULL),(737,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','badges','',379,1,'2020-01-16 13:50:53','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(738,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-17 19:07:37',NULL),(739,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-17 19:07:37',NULL),(740,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-18 11:50:29',NULL),(741,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2020-01-18 11:50:29',NULL),(742,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','badges','',380,1,'2020-01-22 08:18:59','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(743,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','badges','',385,1,'2020-01-23 20:13:14','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(744,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','badges','',381,1,'2020-01-23 20:19:57','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(745,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-27 13:32:18',NULL),(746,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-01-27 13:32:18',NULL),(747,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2020-01-27 13:38:06',NULL),(748,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,0,'2020-01-27 13:38:06',NULL);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poolevent_trophies`
--

DROP TABLE IF EXISTS `poolevent_trophies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poolevent_trophies` (
  `idpoolevent_trophie` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poolevent_id` int(11) NOT NULL,
  `trophie` enum('GOLD','SILVER','BRONZE') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idpoolevent_trophie`)
) ENGINE=InnoDB AUTO_INCREMENT=507 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poolevent_trophies`
--

LOCK TABLES `poolevent_trophies` WRITE;
/*!40000 ALTER TABLE `poolevent_trophies` DISABLE KEYS */;
INSERT INTO `poolevent_trophies` VALUES (485,473,'GOLD','2020-01-27 13:32:26'),(486,473,'GOLD','2020-01-27 13:32:36'),(487,473,'GOLD','2020-01-27 13:38:23'),(488,474,'SILVER','2020-01-27 13:38:23'),(489,473,'GOLD','2020-01-27 14:07:04'),(490,474,'SILVER','2020-01-27 14:07:04'),(491,473,'GOLD','2020-01-27 14:39:58'),(492,474,'SILVER','2020-01-27 14:39:58'),(493,473,'GOLD','2020-01-27 15:14:49'),(494,474,'SILVER','2020-01-27 15:14:49'),(495,473,'GOLD','2020-01-27 15:40:55'),(496,474,'SILVER','2020-01-27 15:40:55'),(497,473,'GOLD','2020-01-27 20:53:56'),(498,474,'SILVER','2020-01-27 20:53:56'),(499,473,'GOLD','2020-01-27 21:14:16'),(500,474,'SILVER','2020-01-27 21:14:16'),(501,473,'GOLD','2020-01-27 21:34:36'),(502,474,'SILVER','2020-01-27 21:34:36'),(503,473,'GOLD','2020-01-27 21:54:56'),(504,474,'SILVER','2020-01-27 21:54:56'),(505,473,'GOLD','2020-01-27 22:15:16'),(506,474,'SILVER','2020-01-27 22:15:16');
/*!40000 ALTER TABLE `poolevent_trophies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poolevent_types`
--

DROP TABLE IF EXISTS `poolevent_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poolevent_types` (
  `idevent_type` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idevent_type`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poolevent_types`
--

LOCK TABLES `poolevent_types` WRITE;
/*!40000 ALTER TABLE `poolevent_types` DISABLE KEYS */;
INSERT INTO `poolevent_types` VALUES (1,'Netzwerk Treffen','2020-01-10 11:57:29'),(2,'concert','2020-01-10 11:57:29'),(3,'festival','2020-01-10 11:57:29'),(4,'goldeimer festival','2020-01-10 11:57:29'),(5,'run4wash','2020-01-10 11:57:29'),(6,'test','2020-01-10 11:57:29');
/*!40000 ALTER TABLE `poolevent_types` ENABLE KEYS */;
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
  `event_start` timestamp NULL DEFAULT NULL,
  `event_end` timestamp NULL DEFAULT NULL,
  `application_start` timestamp NULL DEFAULT NULL,
  `application_end` timestamp NULL DEFAULT NULL,
  `asp_event_id` varchar(128) DEFAULT NULL,
  `website` text,
  `supporter_lim` int(11) DEFAULT '0',
  `active_user_only` tinyint(1) DEFAULT '0',
  `user_id` varchar(128) NOT NULL,
  `edited_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` enum('UNRELEASED','RELEASED','REJECTED','DRAFT','CANCELED') NOT NULL DEFAULT 'UNRELEASED',
  `idevent_type` int(11) NOT NULL,
  `fave_count` int(11) NOT NULL DEFAULT '0',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=475 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poolevents`
--

LOCK TABLES `poolevents` WRITE;
/*!40000 ALTER TABLE `poolevents` DISABLE KEYS */;
INSERT INTO `poolevents` VALUES (456,'Lorem ipsum dolor.','2020-01-11 19:19:21','2020-01-11 17:18:47','2020-01-11 17:18:48','2020-01-11 17:19:17','2020-01-11 17:19:18','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','Lorem ipsum dolor.',3,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-11 20:11:22','RELEASED',0,0,_binary '\0'),(457,'Lorem ipsum dolor.','2020-01-11 19:19:38','2020-01-11 18:18:47','2020-01-11 18:18:48','2020-01-11 18:19:17','2020-01-11 18:19:18','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','Lorem ipsum dolor.',3,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-12 11:35:33','REJECTED',1,0,_binary '\0'),(458,'scoop','2020-01-11 19:19:39','2020-01-11 17:18:47','2020-01-11 17:18:48','2020-01-11 17:19:17','2020-01-11 17:19:18','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','Lorem ipsum dolor.',3,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-16 16:09:40','RELEASED',0,1,_binary '\0'),(459,'Lorem ipsum dolor.','2020-01-11 19:19:40','2020-01-11 18:18:47','2020-01-11 18:18:48','2020-01-11 18:19:17','2020-01-11 18:19:18','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','Lorem ipsum dolor.',3,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-23 09:43:32','CANCELED',1,1,_binary '\0'),(460,'Lorem ipsum dolor.','2020-01-11 19:19:41','2020-01-11 18:18:47','2020-01-11 18:18:48','2020-01-11 18:19:17','2020-01-11 18:19:18','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','Lorem ipsum dolor.',3,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-12 13:57:24','REJECTED',1,1,_binary '\0'),(461,'Lorem ipsum dolor.','2020-01-11 19:19:41','2020-01-11 18:18:47','2020-01-11 18:18:48','2020-01-11 18:19:17','2020-01-11 18:19:18','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','Lorem ipsum dolor.',3,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-26 16:17:50','CANCELED',1,0,_binary '\0'),(462,'Lorem ipsum dolor.','2020-01-12 09:02:49','2020-01-12 08:00:18','2020-01-12 08:00:19','2020-01-12 08:00:55','2020-01-12 08:00:54','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','lorem',5,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-23 12:16:18','RELEASED',6,0,_binary '\0'),(463,'Lorem ipsum dolor.','2020-01-12 09:02:57','2020-01-12 08:00:18','2020-01-12 08:00:19','2020-01-12 08:00:55','2020-01-12 08:00:54','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','lorem',5,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-23 11:17:40','CANCELED',6,0,_binary '\0'),(464,'Radiohead','2020-01-12 09:25:20','2020-01-12 08:24:48','2020-01-12 08:24:50','2020-01-12 08:25:16','2020-01-12 08:25:17','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','lorem',4,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-23 12:37:53','CANCELED',2,0,_binary '\0'),(465,'Radiohead','2020-01-12 09:26:48','2020-01-12 08:24:48','2020-01-12 08:24:50','2020-01-12 08:25:16','2020-01-12 08:25:17','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','lorem',4,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-13 19:49:28','RELEASED',2,0,_binary '\0'),(466,'Lorem ipsum dolor.','2020-01-13 19:31:22','2020-01-13 18:24:17','2020-01-13 18:24:18','2020-01-13 18:24:42','2020-01-13 18:24:42','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','lorem',3,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-13 19:50:36','RELEASED',3,0,_binary '\0'),(467,'Lorem ipsum dolor.','2020-01-13 19:31:28','2020-01-13 18:24:17','2020-01-13 18:24:18','2020-01-13 18:24:42','2020-01-13 18:24:42','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','lorem',3,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-13 20:57:08','RELEASED',3,0,_binary '\0'),(468,'Lorem ipsum dolor.','2020-01-13 19:31:37','2020-01-13 18:24:17','2020-01-13 18:24:18','2020-01-13 18:24:42','2020-01-13 18:24:42','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','lorem',3,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-23 12:13:13','RELEASED',3,0,_binary '\0'),(469,'Lorem ipsum dolor.','2020-01-13 19:33:21','2020-01-13 18:24:17','2020-01-13 18:24:18','2020-01-13 18:24:42','2020-01-13 18:24:42','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.lol.com',3,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-13 19:33:21','UNRELEASED',3,0,_binary '\0'),(470,'tocotronic','2020-01-13 20:26:01','2020-04-08 20:00:00','2025-01-09 22:02:00','2020-01-13 19:25:22','2020-01-13 19:25:23','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.lorem12.com',2,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-13 20:27:30','RELEASED',2,0,_binary '\0'),(471,'Viva con agua','2020-01-17 19:07:37','2020-01-17 18:06:49','2020-01-17 18:06:51','2020-01-17 18:07:31','2020-01-17 18:07:32','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.scoop.com',6,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-17 19:08:46','RELEASED',5,0,_binary '\0'),(472,'Test 1','2020-01-18 11:50:29','2020-01-18 10:49:45','2020-01-18 10:49:46','2020-01-18 10:50:20','2020-01-18 10:50:21','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.scoop-com.com',2,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-18 11:50:29','UNRELEASED',3,0,_binary '\0'),(473,'Lorem ipsum.','2020-01-27 13:32:18','2020-01-27 12:30:52','2020-01-27 12:30:54','2020-01-27 12:31:03','2020-01-27 12:31:04','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.scoop.com',3,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-27 13:32:18','UNRELEASED',1,0,_binary '\0'),(474,'Lorem ipsum.','2020-01-27 13:38:06','2020-01-27 12:30:52','2020-01-27 12:30:54','2020-01-27 12:31:03','2020-01-27 12:31:04','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.scoop.com',3,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-27 13:38:06','UNRELEASED',1,0,_binary '\0');
/*!40000 ALTER TABLE `poolevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `idroles` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  PRIMARY KEY (`idroles`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (12,'supporter','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(13,'admin','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(14,'supporter','8d411dc4-e76f-4d0e-a027-056a0bc43be5');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
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
  `access_token` text,
  `full_name` varchar(45) DEFAULT NULL,
  `verfied` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','Doe','John','2020-01-11 13:46:16','2020-01-16 13:50:20',NULL,NULL,'7af98a2fdaea1a23cbbf5907','John Doe',1),('8d411dc4-e76f-4d0e-a027-056a0bc43be5','waves','dev','2020-01-11 21:27:23','2020-01-11 21:27:23',NULL,NULL,'10d1b9af9cc21805e43579f4','dev waves',1);
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
  `user_id` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_user_id_comment_id` (`user_id`,`comment_id`),
  KEY `fk_uservote_id_idx` (`user_id`),
  KEY `fk_votecomment_id_idx` (`comment_id`),
  CONSTRAINT `fk_votecomment_id` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
INSERT INTO `votes` VALUES (127,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2020-01-12 11:06:28',140),(128,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-13 17:44:27',140),(129,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-21 21:17:58',142),(130,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2020-01-23 20:20:08',150);
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

-- Dump completed on 2020-01-28 11:03:58
