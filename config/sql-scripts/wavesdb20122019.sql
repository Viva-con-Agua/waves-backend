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
  KEY `fk_poolevent_idx` (`poolevent_id`),
  KEY `fk_user_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (23,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','application','WAITING',285,'2019-12-26 16:44:58','2019-12-26 16:44:58'),(24,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.','WAITING',287,'2019-12-26 21:34:13','2019-12-26 21:34:13'),(25,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','lorem','WAITING',380,'2019-12-26 21:46:13','2019-12-26 21:46:13'),(26,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum.\n\nNunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent cond','WAITING',288,'2019-12-26 23:40:47','2019-12-26 23:40:47'),(27,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','lorem5;','WAITING',380,'2019-12-26 23:41:56','2019-12-26 23:41:56'),(28,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum.\n\nNunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent cond','WAITING',380,'2019-12-27 15:22:43','2019-12-27 15:22:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=504 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badge_progress`
--

LOCK TABLES `badge_progress` WRITE;
/*!40000 ALTER TABLE `badge_progress` DISABLE KEYS */;
INSERT INTO `badge_progress` VALUES (492,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',239,1,1,'2019-12-26 16:44:34','2019-12-26 21:30:46','poolevents'),(493,'8d411dc4-e76f-4d0e-a027-056a0bc43be5',239,11,0,'2019-12-26 16:44:34','2019-12-29 13:37:24','poolevents'),(494,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',240,1,1,'2019-12-26 16:44:34','2019-12-26 21:31:37','comments'),(495,'8d411dc4-e76f-4d0e-a027-056a0bc43be5',240,1,1,'2019-12-26 16:44:34','2019-12-26 16:44:46','comments'),(496,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',241,1,1,'2019-12-26 16:44:34','2019-12-26 21:34:37','votes'),(497,'8d411dc4-e76f-4d0e-a027-056a0bc43be5',241,1,1,'2019-12-26 16:44:34','2019-12-26 16:44:52','votes'),(498,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',242,1,1,'2019-12-26 16:44:34','2019-12-26 21:34:13','applications'),(499,'8d411dc4-e76f-4d0e-a027-056a0bc43be5',242,1,1,'2019-12-26 16:44:34','2019-12-26 16:44:58','applications'),(500,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',243,0,0,'2019-12-27 17:02:02','2019-12-27 17:02:02','comments'),(501,'8d411dc4-e76f-4d0e-a027-056a0bc43be5',243,4,1,'2019-12-27 17:02:02','2019-12-29 16:54:02','comments'),(502,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',244,0,0,'2019-12-29 16:47:40','2019-12-29 16:47:40','info'),(503,'8d411dc4-e76f-4d0e-a027-056a0bc43be5',244,0,1,'2019-12-29 16:47:40','2019-12-29 16:47:51','info');
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
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges`
--

LOCK TABLES `badges` WRITE;
/*!40000 ALTER TABLE `badges` DISABLE KEYS */;
INSERT INTO `badges` VALUES (239,'Best Comment','Write a great comment','poolevents','2019-12-26 16:44:34','2019-12-26 16:44:34','//b.thumbs.redditmedia.com/loJzR3eUrPNvKw6g9RktAletCoQjMityx8emC5w83sw.png'),(240,'Badge Designer','design a badge for vca','comments','2019-12-26 16:44:34','2019-12-26 16:44:34','//b.thumbs.redditmedia.com/TnRIsjez67SOHX-F7iW56rSNpbORu-0V6zsR92TV6Qc.png'),(241,'New User','Join Pool','votes','2019-12-26 16:44:34','2019-12-26 16:44:34','//a.thumbs.redditmedia.com/uag6mXIzTCfMDaLAGr8IQ6PdPnVerANcJDIgPZDeDx0.png'),(242,'Verified Email Address','Verify your email address','applications','2019-12-26 16:44:34','2019-12-26 16:44:34','//b.thumbs.redditmedia.com/xdKEqKiFPEtQPTvc0Qh_MoR-8y4IYkHnMajh27qhGjE.png'),(243,'','','comments','2019-12-27 17:02:02','2019-12-27 17:02:02',''),(244,'scoop','','info','2019-12-29 16:47:40','2019-12-29 16:47:40','');
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
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenges`
--

LOCK TABLES `challenges` WRITE;
/*!40000 ALTER TABLE `challenges` DISABLE KEYS */;
INSERT INTO `challenges` VALUES (228,'Best Comment','Write a great comment',239,'2019-12-26 16:44:34','poolevents',1,'2019-12-26 16:44:34'),(229,'Badge Designer','design a badge for vca',240,'2019-12-26 16:44:34','comments',1,'2019-12-26 16:44:34'),(230,'New User','Join Pool',241,'2019-12-26 16:44:34','votes',1,'2019-12-26 16:44:34'),(231,'Verified Email Address','Verify your email address',242,'2019-12-26 16:44:34','applications',1,'2019-12-26 16:44:34'),(232,'','',243,'2019-12-27 17:02:02','comments',4,'2019-12-27 17:02:02'),(233,'1','12',244,'2019-12-29 16:47:40','info',1,'2019-12-29 16:47:40');
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
  `user_id` varchar(128) DEFAULT NULL,
  `poolevent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_poolevent_idx` (`poolevent_id`),
  CONSTRAINT `fk_poolevent` FOREIGN KEY (`poolevent_id`) REFERENCES `poolevents` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (82,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.','8d411dc4-e76f-4d0e-a027-056a0bc43be5',380,'2019-12-26 16:44:46','2019-12-26 16:44:46',NULL),(83,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum.\n\nNunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent cond','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',382,'2019-12-26 21:31:37','2019-12-26 21:31:37',NULL),(84,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum.\n\nNunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent cond','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f',383,'2019-12-26 22:31:51','2019-12-26 22:31:51',NULL),(85,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum.\n\nNunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent cond','8d411dc4-e76f-4d0e-a027-056a0bc43be5',383,'2019-12-27 15:21:25','2019-12-27 15:21:25',NULL),(86,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada.','8d411dc4-e76f-4d0e-a027-056a0bc43be5',384,'2019-12-27 19:37:28','2019-12-27 19:37:28',NULL),(87,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum.\n\nNunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent cond','8d411dc4-e76f-4d0e-a027-056a0bc43be5',382,'2019-12-29 16:54:02','2019-12-29 16:54:02',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descriptions`
--

LOCK TABLES `descriptions` WRITE;
/*!40000 ALTER TABLE `descriptions` DISABLE KEYS */;
INSERT INTO `descriptions` VALUES (285,'','<p>Lorem ipsum dolor. Lorem ipsum dolor. Lorem ipsum dolor. Lorem ipsum dolor.</p>','2019-12-26 13:40:46','2019-12-26 13:40:46',380),(286,'','<p>Lorem ipsum dolor. Lorem ipsum dolor. Lorem ipsum dolor. Lorem ipsum dolor.</p>','2019-12-26 13:42:30','2019-12-26 13:42:30',381),(287,'','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum. Nunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent condimentum eget felis ut laoreet. Aliquam sodales dolor id mi iaculis, non fermentum leo viverra. Aenean aliquet condimentum placerat. Aenean aliquet diam arcu. Curabitur ac ligula sem. Mauris tincidunt mauris at ligula tincidunt interdum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus sagittis, eros.</p>','2019-12-26 21:30:46','2019-12-26 21:30:46',382),(288,'','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum. Nunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent condimentum eget felis ut laoreet. Aliquam sodales dolor id mi iaculis, non fermentum leo viverra. Aenean aliquet condimentum placerat. Aenean aliquet diam arcu. Curabitur ac ligula sem. Mauris tincidunt mauris at ligula tincidunt interdum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus sagittis, eros.</p>','2019-12-26 22:24:42','2019-12-26 22:24:42',383),(289,'','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum. Nunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent condimentum eget felis ut laoreet. Aliquam sodales dolor id mi iaculis, non fermentum leo viverra. Aenean aliquet condimentum placerat. Aenean aliquet diam arcu. Curabitur ac ligula sem. Mauris tincidunt mauris at ligula tincidunt interdum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus sagittis, eros ut iaculis varius, lorem nibh ullamcorper sapien, nec posuere justo massa quis ligula. Curabitur eleifend quis sapien egestas tincidunt. Nulla ornare, purus eget porttitor facilisis, lorem urna semper erat, non placerat orci est lobortis mi. Curabitur convallis, urna a tincidunt accumsan, lectus orci dictum turpis, vitae pretium leo tellus a sem. Donec vulputate erat quis turpis luctus, at aliquam massa vulputate. Phasellus vestibulum, purus in vestibulum tempor, est ligula rutrum justo, hendrerit malesuada diam lacus quis massa. Ut fringilla fringilla mattis. Aenean nisl lectus, tempor et sapien at, venenatis tempus magna. Integer sollicitudin rhoncus augue vel pretium. Etiam nisl velit, condimentum at facilisis sagittis, vehicula a diam. Phasellus congue vehicula nisi, a vulputate augue suscipit non. Etiam condimentum placerat arcu a dapibus. Phasellus adipiscing, est vel aliquet placerat, justo lacus commodo nunc, nec pretium arcu mi nec risus. Praesent a urna semper, suscipit tellus ac, consectetur metus. Integer at fringilla magna, ut gravida lorem. Sed molestie non augue in faucibus. Phasellus at dui sem. Morbi rutrum nulla sit amet elit dapibus tincidunt. Vestibulum varius ultrices mauris eget eleifend. Morbi sagittis nisi nec leo mollis, sed laoreet mi facilisis. Curabitur non laoreet turpis. Vivamus tincidunt orci turpis, et sodales urna egestas ut. Vestibulum eget congue ligula. Quisque leo tortor, tristique in fermentum ac, imperdiet in nibh. Integer mattis porta varius. Duis rhoncus mattis orci id pharetra. Proin mauris augue, venenatis id fringilla quis, bibendum et ligula. Sed at lacinia quam. In ac quam feugiat, lobortis nunc eu, fermentum metus. Fusce congue consectetur arcu at dignissim. Fusce euismod mauris et leo suscipit, sed rhoncus felis tincidunt. Suspendisse eu rutrum lorem, non feugiat felis. Sed at adipiscing lectus, vel fermentum metus. Donec auctor quis sapien vitae porta. Suspendisse non tempor nisi, sed egestas orci. Suspendisse elementum ullamcorper fermentum. Etiam pellentesque venenatis ipsum, id convallis tortor molestie quis. Maecenas mollis, orci ac luctus adipiscing, sem eros ullamcorper turpis, sed pharetra mi ligula sit amet neque. Duis non imperdiet lorem. Nullam feugiat risus vel risus vulputate, vel adipiscing nibh ullamcorper. Suspendisse vitae interdum augue. Donec mauris diam, bibendum vitae malesuada et, laoreet in justo. Duis sollicitudin tincidunt mattis. Etiam non enim id nunc dapibus rhoncus eget ut tellus. Donec eu libero at leo porttitor dignissim. Mauris lobortis et orci eu suscipit. Cras fringilla ante nec ipsum aliquam tempus. Nunc in dapibus tellus. Maecenas cursus semper turpis quis pharetra. Phasellus ultrices nisi id dui facilisis varius. Morbi sit amet enim dui. Sed non iaculis velit. Nunc quis augue laoreet, dignissim justo ut, convallis ante. Ut ut mollis lorem. Integer aliquam, magna sed pulvinar luctus, diam enim pulvinar mauris, eu malesuada orci lacus sit amet erat. Duis accumsan nunc eget velit congue, eu aliquet velit venenatis. Aenean pulvinar ultrices lorem et malesuada. Curabitur interdum ut odio et consequat. Nunc lobortis erat vel auctor ullamcorper. Nam ut felis lectus. Nulla fringilla nisi a elit ullamcorper vehicula. Integer magna nisi, dignissim a nibh sed, cursus mollis elit. Integer pellentesque, dolor vitae iaculis iaculis, velit augue malesuada purus, eget sagittis nunc tortor quis dolor. Etiam facilisis, enim vitae rutrum commodo, est risus mollis eros, nec facilisis metus mi a sem. Vestibulum nisi orci, molestie ut ipsum quis, ornare vulputate ipsum. Vivamus vel mauris et purus commodo lacinia. In ut mauris eget velit tincidunt facilisis. Fusce eget sollicitudin ante. Phasellus luctus ut felis eu gravida. Etiam vel fermentum justo. Integer tristique cursus vehicula. Donec vel tristique velit. In eu metus ac nibh pretium luctus non quis lorem. Sed at mi a magna lobortis aliquam. Ut placerat euismod purus at semper. Proin elementum leo in suscipit fringilla. Sed egestas pharetra dui. Vestibulum eget iaculis elit, cursus venenatis nibh. In eleifend dapibus quam eget ultrices. Nam adipiscing aliquam nisi, eu condimentum ipsum iaculis non. Integer facilisis pellentesque nisi, sed aliquam turpis ullamcorper at. Integer ut suscipit dolor. Morbi in orci arcu. Cras non nibh purus. Sed viverra tincidunt aliquet. Vivamus scelerisque nec nisi ac auctor. Integer at consequat sem, vel cursus mauris. Aliquam non nunc nec nunc dapibus mattis eu nec risus. Praesent ligula nisi, imperdiet ut dui ut, sagittis faucibus purus. Aliquam ac nulla et purus aliquet vehicula eu vel felis. Sed suscipit, risus a elementum vehicula, est augue pretium lectus, a congue nulla arcu vitae velit. Mauris suscipit ultricies arcu a faucibus. Integer id sapien ultricies, malesuada libero quis, tempus augue. Praesent condimentum, velit id mattis convallis, risus eros ullamcorper risus, sed eleifend nulla dui nec eros. Cras cursus mi nec augue ultricies imperdiet. Suspendisse ac auctor libero, vel gravida ipsum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean dictum nulla ut erat gravida, vel ultrices diam sagittis. Ut fermentum magna nunc, ut vulputate ante hendrerit vitae. Fusce tristique euismod libero sit amet congue. Nulla sed turpis blandit, semper eros ut, faucibus nunc. Nam vitae sagittis enim. Cum sociis natoque penatibus et magnis dis.</p>','2019-12-27 15:40:31','2019-12-27 15:40:31',384),(290,'','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget justo porttitor urna dictum fermentum sit amet sed mauris. Praesent molestie vestibulum erat ac rhoncus. Aenean nunc risus, accumsan nec ipsum et, convallis sollicitudin dui. Proin dictum quam a semper malesuada. Etiam porta sit amet risus quis porta. Nulla facilisi. Cras at interdum ante. Ut gravida pharetra ligula vitae malesuada. Sed eget libero et arcu tempor tincidunt in ac lectus. Maecenas vitae felis enim. In in tellus consequat, condimentum eros vitae, lacinia risus. Sed vehicula sem sed risus volutpat elementum. Nunc accumsan tempus nunc ac aliquet. Integer non ullamcorper eros, in rutrum velit. Proin cursus orci sit amet lobortis iaculis. Praesent condimentum eget felis ut laoreet. Aliquam sodales dolor id mi iaculis, non fermentum leo viverra. Aenean aliquet condimentum placerat. Aenean aliquet diam arcu. Curabitur ac ligula sem. Mauris tincidunt mauris at ligula tincidunt interdum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus sagittis, eros ut iaculis varius, lorem nibh ullamcorper sapien, nec posuere justo massa quis ligula. Curabitur eleifend quis sapien egestas tincidunt. Nulla ornare, purus eget porttitor facilisis, lorem urna semper erat, non placerat orci est lobortis mi. Curabitur convallis, urna a tincidunt accumsan, lectus orci dictum turpis, vitae pretium leo tellus a sem. Donec vulputate erat quis turpis luctus, at aliquam massa vulputate. Phasellus vestibulum, purus in vestibulum tempor, est ligula rutrum justo, hendrerit malesuada diam lacus quis massa. Ut fringilla fringilla mattis. Aenean nisl lectus, tempor et sapien at, venenatis tempus magna. Integer sollicitudin rhoncus augue vel pretium. Etiam nisl velit, condimentum at facilisis sagittis, vehicula a diam. Phasellus congue vehicula nisi, a vulputate augue suscipit non. Etiam condimentum placerat arcu a dapibus. Phasellus adipiscing, est vel aliquet placerat, justo lacus commodo nunc, nec pretium arcu mi nec risus. Praesent a urna semper, suscipit tellus ac, consectetur metus. Integer at fringilla magna, ut gravida lorem. Sed molestie non augue in faucibus. Phasellus at dui sem. Morbi rutrum nulla sit amet elit dapibus tincidunt. Vestibulum varius ultrices mauris eget eleifend. Morbi sagittis nisi nec leo mollis, sed laoreet mi facilisis. Curabitur non laoreet turpis. Vivamus tincidunt orci turpis, et sodales urna egestas ut. Vestibulum eget congue ligula. Quisque leo tortor, tristique in fermentum ac, imperdiet in nibh. Integer mattis porta varius. Duis rhoncus mattis orci id pharetra. Proin mauris augue, venenatis id fringilla quis, bibendum et ligula. Sed at lacinia quam. In ac quam feugiat, lobortis nunc eu, fermentum metus. Fusce congue consectetur arcu at dignissim. Fusce euismod mauris et leo suscipit, sed rhoncus felis tincidunt. Suspendisse eu rutrum lorem, non feugiat felis. Sed at adipiscing lectus, vel fermentum metus. Donec auctor quis sapien vitae porta. Suspendisse non tempor nisi, sed egestas orci. Suspendisse elementum ullamcorper fermentum. Etiam pellentesque venenatis ipsum, id convallis tortor molestie quis. Maecenas mollis, orci ac luctus adipiscing, sem eros ullamcorper turpis, sed pharetra mi ligula sit amet neque. Duis non imperdiet lorem. Nullam feugiat risus vel risus vulputate, vel adipiscing nibh ullamcorper. Suspendisse vitae interdum augue. Donec mauris diam, bibendum vitae malesuada et, laoreet in justo. Duis sollicitudin tincidunt mattis. Etiam non enim id nunc dapibus rhoncus eget ut tellus. Donec eu libero at leo porttitor dignissim. Mauris lobortis et orci eu suscipit. Cras fringilla ante nec ipsum aliquam tempus. Nunc in dapibus tellus. Maecenas cursus semper turpis quis pharetra. Phasellus ultrices nisi id dui facilisis varius. Morbi sit amet enim dui. Sed non iaculis velit. Nunc quis augue laoreet, dignissim justo ut, convallis ante. Ut ut mollis lorem. Integer aliquam, magna sed pulvinar luctus, diam enim pulvinar mauris, eu malesuada orci lacus sit amet erat. Duis accumsan nunc eget velit congue, eu aliquet velit venenatis. Aenean pulvinar ultrices lorem et malesuada. Curabitur interdum ut odio et consequat. Nunc lobortis erat vel auctor ullamcorper. Nam ut felis lectus. Nulla fringilla nisi a elit ullamcorper vehicula. Integer magna nisi, dignissim a nibh sed, cursus mollis elit. Integer pellentesque, dolor vitae iaculis iaculis, velit augue malesuada purus, eget sagittis nunc tortor quis dolor. Etiam facilisis, enim vitae rutrum commodo, est risus mollis eros, nec facilisis metus mi a sem. Vestibulum nisi orci, molestie ut ipsum quis, ornare vulputate ipsum. Vivamus vel mauris et purus commodo lacinia. In ut mauris eget velit tincidunt facilisis. Fusce eget sollicitudin ante. Phasellus luctus ut felis eu gravida. Etiam vel fermentum justo. Integer tristique cursus vehicula. Donec vel tristique velit. In eu metus ac nibh pretium luctus non quis lorem. Sed at mi a magna lobortis aliquam. Ut placerat euismod purus at semper. Proin elementum leo in suscipit fringilla. Sed egestas pharetra dui. Vestibulum eget iaculis elit, cursus venenatis nibh. In eleifend dapibus quam eget ultrices. Nam adipiscing aliquam nisi, eu condimentum ipsum iaculis non. Integer facilisis pellentesque nisi, sed aliquam turpis ullamcorper at. Integer ut suscipit dolor. Morbi in orci arcu. Cras non nibh purus. Sed viverra tincidunt aliquet. Vivamus scelerisque nec nisi ac auctor. Integer at consequat sem, vel cursus mauris. Aliquam non nunc nec nunc dapibus mattis eu nec risus. Praesent ligula nisi, imperdiet ut dui ut, sagittis faucibus purus. Aliquam ac nulla et purus aliquet vehicula eu vel felis. Sed suscipit, risus a elementum vehicula, est augue pretium lectus, a congue nulla arcu vitae velit. Mauris suscipit ultricies arcu a faucibus. Integer id sapien ultricies, malesuada libero quis, tempus augue. Praesent condimentum, velit id mattis convallis, risus eros ullamcorper risus, sed eleifend nulla dui nec eros. Cras cursus mi nec augue ultricies imperdiet. Suspendisse ac auctor libero, vel gravida ipsum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean dictum nulla ut erat gravida, vel ultrices diam sagittis. Ut fermentum magna nunc, ut vulputate ante hendrerit vitae. Fusce tristique euismod libero sit amet congue. Nulla sed turpis blandit, semper eros ut, faucibus nunc. Nam vitae sagittis enim. Cum sociis natoque penatibus et magnis dis.</p>','2019-12-27 15:42:38','2019-12-27 15:42:38',385),(291,'','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.</p>','2019-12-29 13:37:17','2019-12-29 13:37:17',386),(292,'','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.</p>','2019-12-29 13:37:22','2019-12-29 13:37:22',387),(293,'','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.</p>','2019-12-29 13:37:23','2019-12-29 13:37:23',388),(294,'','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.</p>','2019-12-29 13:37:23','2019-12-29 13:37:23',389),(295,'','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.</p>','2019-12-29 13:37:23','2019-12-29 13:37:23',390),(296,'','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.</p>','2019-12-29 13:37:24','2019-12-29 13:37:24',391),(297,'','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.</p>','2019-12-29 13:37:24','2019-12-29 13:37:24',392);
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
  UNIQUE KEY `uq_waves_p_u` (`poolevent_id`,`user_id`),
  KEY `userfave_idx` (`user_id`),
  KEY `poolevent_fave_idx` (`poolevent_id`),
  CONSTRAINT `poolevent_fave` FOREIGN KEY (`poolevent_id`) REFERENCES `poolevents` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (44,381,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2019-12-26 21:55:35'),(45,382,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2019-12-26 21:55:36'),(46,380,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2019-12-26 21:55:53'),(47,380,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2019-12-27 15:23:31'),(48,383,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2019-12-27 15:23:35'),(49,385,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2019-12-27 18:49:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=323 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (310,380,'Aschauer Straße','1',NULL,'11.600211100000024','48.107423','München','Deutschland','81549','Lorem ipsum dolor.'),(311,381,'Aschauer Straße','1',NULL,'11.600211100000024','48.107423','München','Deutschland','81549','Lorem ipsum dolor.'),(312,382,'Alexanderplatz','2',NULL,'13.414463899999987','52.52082559999999','Berlin','Deutschland','10178','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante'),(313,383,'Alexanderplatz','12',NULL,'13.414633800000047','52.5212352','Berlin','Deutschland','10178','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante'),(314,384,'Schönhauser Allee','12',NULL,'13.412583199999972','52.5308532','Berlin','Deutschland','10119','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante'),(315,385,'Schönhauser Allee','12',NULL,'13.412583199999972','52.5308532','Berlin','Deutschland','10119','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante'),(316,386,'Kleyerstraße','2',NULL,'8.643091099999992','50.1026276','Frankfurt am Main','Deutschland','60326','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.'),(317,387,'Kleyerstraße','2',NULL,'8.643091099999992','50.1026276','Frankfurt am Main','Deutschland','60326','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.'),(318,388,'Kleyerstraße','2',NULL,'8.643091099999992','50.1026276','Frankfurt am Main','Deutschland','60326','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.'),(319,389,'Kleyerstraße','2',NULL,'8.643091099999992','50.1026276','Frankfurt am Main','Deutschland','60326','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.'),(320,390,'Kleyerstraße','2',NULL,'8.643091099999992','50.1026276','Frankfurt am Main','Deutschland','60326','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.'),(321,391,'Kleyerstraße','2',NULL,'8.643091099999992','50.1026276','Frankfurt am Main','Deutschland','60326','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.'),(322,392,'Kleyerstraße','2',NULL,'8.643091099999992','50.1026276','Frankfurt am Main','Deutschland','60326','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.');
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
INSERT INTO `notification_badges` VALUES (523,'NEW',183),(526,'NEW',184),(527,'NEW',186),(528,'NEW',187),(529,'NEW',191),(530,'NEW',224),(531,'NEW',228),(532,'NEW',240),(533,'NEW',241),(534,'NEW',242),(537,'NEW',239),(538,'NEW',240),(539,'NEW',242),(540,'NEW',241),(561,'NEW',243);
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
INSERT INTO `notification_poolevents` VALUES (521,'NEW',380),(522,'NEW',380),(524,'NEW',381),(525,'NEW',381),(535,'NEW',382),(536,'NEW',382),(541,'NEW',383),(542,'NEW',383),(543,'NEW',384),(544,'NEW',384),(545,'NEW',385),(546,'NEW',385),(547,'NEW',386),(548,'NEW',386),(549,'NEW',387),(550,'NEW',387),(551,'NEW',388),(552,'NEW',388),(553,'NEW',389),(554,'NEW',389),(555,'NEW',390),(556,'NEW',390),(557,'NEW',391),(558,'NEW',391),(559,'NEW',392),(560,'NEW',392);
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
) ENGINE=InnoDB AUTO_INCREMENT=562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (476,'1','poolevents',NULL,0,0,'2019-12-05 12:35:20',NULL),(477,'2','poolevents',NULL,0,0,'2019-12-05 12:35:20',NULL),(478,'4','poolevents',NULL,0,1,'2019-12-05 12:35:20',NULL),(479,'1','',NULL,0,0,'2019-12-05 12:35:20',NULL),(480,'2','',NULL,0,0,'2019-12-05 12:35:20',NULL),(481,'4','',NULL,0,1,'2019-12-05 12:35:20',NULL),(482,'1','poolevents',NULL,0,0,'2019-12-05 12:39:25',NULL),(483,'2','poolevents',NULL,0,0,'2019-12-05 12:39:25',NULL),(484,'4','poolevents',NULL,0,1,'2019-12-05 12:39:25',NULL),(485,'1','poolevents',NULL,0,0,'2019-12-05 14:38:28',NULL),(486,'2','poolevents',NULL,0,0,'2019-12-05 14:38:28',NULL),(487,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2019-12-05 14:38:28',NULL),(488,'1','',NULL,0,0,'2019-12-05 14:56:56',NULL),(489,'2','',NULL,0,0,'2019-12-05 14:56:56',NULL),(490,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','',NULL,0,1,'2019-12-05 14:56:56',NULL),(491,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','badges','',57,1,'2019-12-05 15:27:16','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(493,'1','poolevents',NULL,0,0,'2019-12-06 16:32:48',NULL),(494,'2','poolevents',NULL,0,0,'2019-12-06 16:32:48',NULL),(495,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2019-12-06 16:32:48',NULL),(496,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-06 16:32:48',NULL),(497,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',54,1,'2019-12-06 16:32:48','8d411dc4-e76f-4d0e-a027-056a0bc43be5'),(498,'1','poolevents',NULL,0,0,'2019-12-07 16:46:39',NULL),(499,'2','poolevents',NULL,0,0,'2019-12-07 16:46:39',NULL),(500,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2019-12-07 16:46:39',NULL),(501,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-07 16:46:39',NULL),(502,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2019-12-15 14:36:48',NULL),(503,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2019-12-19 12:02:24',NULL),(504,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2019-12-19 12:25:42',NULL),(505,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2019-12-26 13:18:16',NULL),(506,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-26 13:18:16',NULL),(507,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2019-12-26 13:18:20',NULL),(508,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-26 13:18:20',NULL),(509,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2019-12-26 13:31:04',NULL),(510,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-26 13:31:04',NULL),(511,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2019-12-26 13:34:37',NULL),(512,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-26 13:34:37',NULL),(513,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2019-12-26 13:36:15',NULL),(514,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-26 13:36:15',NULL),(515,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2019-12-26 13:38:24',NULL),(516,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-26 13:38:24',NULL),(517,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2019-12-26 13:39:11',NULL),(518,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-26 13:39:11',NULL),(519,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2019-12-26 13:39:31',NULL),(520,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-26 13:39:31',NULL),(521,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2019-12-26 13:40:46',NULL),(522,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-26 13:40:46',NULL),(523,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',183,1,'2019-12-26 13:40:46','8d411dc4-e76f-4d0e-a027-056a0bc43be5'),(524,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2019-12-26 13:42:30',NULL),(525,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-26 13:42:30',NULL),(526,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',184,1,'2019-12-26 13:42:30','8d411dc4-e76f-4d0e-a027-056a0bc43be5'),(527,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',186,1,'2019-12-26 15:25:43','8d411dc4-e76f-4d0e-a027-056a0bc43be5'),(528,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',187,1,'2019-12-26 15:41:36','8d411dc4-e76f-4d0e-a027-056a0bc43be5'),(529,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',191,1,'2019-12-26 15:59:48','8d411dc4-e76f-4d0e-a027-056a0bc43be5'),(530,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',224,1,'2019-12-26 16:33:59','8d411dc4-e76f-4d0e-a027-056a0bc43be5'),(531,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',228,1,'2019-12-26 16:38:46','8d411dc4-e76f-4d0e-a027-056a0bc43be5'),(532,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',240,1,'2019-12-26 16:44:46','8d411dc4-e76f-4d0e-a027-056a0bc43be5'),(533,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',241,1,'2019-12-26 16:44:52','8d411dc4-e76f-4d0e-a027-056a0bc43be5'),(534,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',242,1,'2019-12-26 16:44:58','8d411dc4-e76f-4d0e-a027-056a0bc43be5'),(535,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2019-12-26 21:30:46',NULL),(536,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-26 21:30:46',NULL),(537,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','badges','',239,1,'2019-12-26 21:30:46','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(538,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','badges','',240,1,'2019-12-26 21:31:37','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(539,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','badges','',242,1,'2019-12-26 21:34:13','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(540,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','badges','',241,1,'2019-12-26 21:34:37','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f'),(541,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,1,'2019-12-26 22:24:42',NULL),(542,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-26 22:24:42',NULL),(543,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,0,'2019-12-27 15:40:31',NULL),(544,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-27 15:40:31',NULL),(545,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,0,'2019-12-27 15:42:38',NULL),(546,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-27 15:42:38',NULL),(547,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,0,'2019-12-29 13:37:17',NULL),(548,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-29 13:37:17',NULL),(549,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,0,'2019-12-29 13:37:22',NULL),(550,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-29 13:37:22',NULL),(551,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,0,'2019-12-29 13:37:23',NULL),(552,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-29 13:37:23',NULL),(553,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,0,'2019-12-29 13:37:23',NULL),(554,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-29 13:37:23',NULL),(555,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,0,'2019-12-29 13:37:23',NULL),(556,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-29 13:37:23',NULL),(557,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,0,'2019-12-29 13:37:24',NULL),(558,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-29 13:37:24',NULL),(559,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','poolevents',NULL,0,0,'2019-12-29 13:37:24',NULL),(560,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','poolevents',NULL,0,1,'2019-12-29 13:37:24',NULL),(561,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','badges','',243,1,'2019-12-29 16:54:02','8d411dc4-e76f-4d0e-a027-056a0bc43be5');
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
  `asp_event_id` varchar(128) DEFAULT NULL,
  `website` text,
  `supporter_lim` int(11) DEFAULT '0',
  `active_user_only` tinyint(1) DEFAULT '0',
  `user_id` varchar(128) NOT NULL,
  `edited_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` enum('UNRELEASED','RELEASED','REJECTED','DRAFT') NOT NULL DEFAULT 'UNRELEASED',
  `type` enum('FESTIVAL','GOLDEIMER_FESTIVAL','RUN4WASH','CONCERT','OTHER','GOLDEIMER_FESTIVAL') NOT NULL,
  `fave_count` int(11) NOT NULL DEFAULT '0',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poolevents`
--

LOCK TABLES `poolevents` WRITE;
/*!40000 ALTER TABLE `poolevents` DISABLE KEYS */;
INSERT INTO `poolevents` VALUES (380,'lorem3;','2019-12-26 13:40:46','2019-12-26 13:33:46','2019-12-26 13:33:46','2019-12-26 13:34:05','2019-12-26 13:34:06','8d411dc4-e76f-4d0e-a027-056a0bc43be5','Lorem ipsum dolor.',1,0,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2019-12-27 15:23:31','RELEASED','FESTIVAL',2,_binary '\0'),(381,'lorem3;','2019-12-26 13:42:30','2019-12-26 13:33:46','2019-12-26 13:33:46','2019-12-26 13:34:05','2019-12-26 13:34:06','8d411dc4-e76f-4d0e-a027-056a0bc43be5','Lorem ipsum dolor.',1,0,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2019-12-26 21:55:35','RELEASED','FESTIVAL',1,_binary '\0'),(382,'Radiohead','2019-12-26 21:30:46','2019-12-26 21:29:45','2019-12-26 21:29:46','2019-12-26 21:30:20','2019-12-26 21:30:21','8d411dc4-e76f-4d0e-a027-056a0bc43be5','loremlorem',1,1,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2019-12-26 21:55:36','RELEASED','GOLDEIMER_FESTIVAL',1,_binary '\0'),(383,'if you know you know','2019-12-26 22:24:42','2019-12-26 22:21:57','2019-12-26 22:21:56','2019-12-26 22:21:50','2019-12-26 22:21:51','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.scoop.com',6,0,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2019-12-27 15:23:35','RELEASED','CONCERT',1,_binary '\0'),(384,'O and A','2019-12-27 15:40:31','2019-12-27 15:39:52','2019-12-27 15:39:53','2019-12-27 15:40:20','2019-12-27 15:40:21','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.scoop.com',3,1,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2019-12-27 18:48:47','RELEASED','CONCERT',0,_binary '\0'),(385,'age of empire','2019-12-27 15:42:38','2019-12-27 15:39:52','2019-12-27 15:39:53','2019-12-27 15:40:20','2019-12-27 15:40:21','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.scoop.com',3,1,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2019-12-27 18:49:12','RELEASED','CONCERT',1,_binary '\0'),(386,'lorem sppoky splak','2019-12-29 13:37:17','2019-12-29 13:36:36','2019-12-29 13:36:35','2019-12-29 13:35:30','2019-12-29 13:35:31','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.lorem.cokm',2,0,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2019-12-29 13:37:17','UNRELEASED','FESTIVAL',0,_binary '\0'),(387,'lorem sppoky splak','2019-12-29 13:37:22','2019-12-29 13:36:36','2019-12-29 13:36:35','2019-12-29 13:35:30','2019-12-29 13:35:31','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.lorem.cokm',2,0,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2019-12-29 13:37:22','UNRELEASED','FESTIVAL',0,_binary '\0'),(388,'lorem sppoky splak','2019-12-29 13:37:23','2019-12-29 13:36:36','2019-12-29 13:36:35','2019-12-29 13:35:30','2019-12-29 13:35:31','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.lorem.cokm',2,0,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2019-12-29 13:37:23','UNRELEASED','FESTIVAL',0,_binary '\0'),(389,'lorem sppoky splak','2019-12-29 13:37:23','2019-12-29 13:36:36','2019-12-29 13:36:35','2019-12-29 13:35:30','2019-12-29 13:35:31','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.lorem.cokm',2,0,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2019-12-29 13:37:23','UNRELEASED','FESTIVAL',0,_binary '\0'),(390,'lorem sppoky splak','2019-12-29 13:37:23','2019-12-29 13:36:36','2019-12-29 13:36:35','2019-12-29 13:35:30','2019-12-29 13:35:31','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.lorem.cokm',2,0,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2019-12-29 13:37:23','UNRELEASED','FESTIVAL',0,_binary '\0'),(391,'lorem sppoky splak','2019-12-29 13:37:24','2019-12-29 13:36:36','2019-12-29 13:36:35','2019-12-29 13:35:30','2019-12-29 13:35:31','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.lorem.cokm',2,0,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2019-12-29 13:37:24','UNRELEASED','FESTIVAL',0,_binary '\0'),(392,'lorem sppoky splak','2019-12-29 13:37:24','2019-12-29 13:36:36','2019-12-29 13:36:35','2019-12-29 13:35:30','2019-12-29 13:35:31','4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','www.lorem.cokm',2,0,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2019-12-29 13:37:24','UNRELEASED','FESTIVAL',0,_binary '\0');
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
INSERT INTO `users` VALUES ('4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','','Bilal','2019-12-09 23:13:57','2019-12-09 23:13:57',NULL,NULL,'supporter','7af98a2fdaea1a23cbbf5907','Bilal'),('8d411dc4-e76f-4d0e-a027-056a0bc43be5','waves','dev','2019-12-19 21:12:18','2019-12-19 21:12:18',NULL,NULL,'supporter','10d1b9af9cc21805e43579f4','dev waves');
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
  `user_id` varchar(128) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_uservote_id_idx` (`user_id`),
  KEY `fk_votecomment_id_idx` (`comment_id`),
  CONSTRAINT `fk_votecomment_id` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
INSERT INTO `votes` VALUES (37,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2019-12-26 16:44:51',82),(38,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2019-12-26 21:34:37',82),(39,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2019-12-26 21:56:40',83),(40,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2019-12-26 22:31:58',84),(41,'4a74141e-c2c0-46a0-9c0c-84bef8be7d0f','2019-12-27 15:13:17',83),(42,'8d411dc4-e76f-4d0e-a027-056a0bc43be5','2019-12-27 18:44:15',85);
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

-- Dump completed on 2019-12-29 18:02:52
