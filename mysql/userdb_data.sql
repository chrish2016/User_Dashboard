-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: userdb
-- ------------------------------------------------------
-- Server version	5.5.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL COMMENT '	',
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_messages1_idx` (`message_id`),
  KEY `fk_comments_users1_idx` (`user_id`),
  CONSTRAINT `fk_comments_messages1` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
REPLACE INTO `comments` VALUES (1,'this is a comment!','2016-06-28 03:00:03','2016-06-28 03:00:03',6,26),(2,'Scandalous!','2016-06-28 03:01:45','2016-06-28 03:01:45',1,24);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_messages_users_idx` (`user_id`),
  CONSTRAINT `fk_messages_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
REPLACE INTO `messages` VALUES (1,'Hi Bill. Don\'t stay up too late!','2016-06-28 02:25:04','2016-06-28 02:25:04',27,26),(2,'What\'s up, Mike! It\'s Admin!','2016-06-28 02:32:20','2016-06-28 02:32:20',18,26),(3,'sup bruh, it\'s admin.','2016-06-28 02:36:25','2016-06-28 02:36:25',10,26),(4,'hello','2016-06-28 02:39:05','2016-06-28 02:39:05',23,26),(5,'Hey Dawg! It\'s Chris!','2016-06-28 02:48:29','2016-06-28 02:48:29',17,26),(6,'Hey Buddy, it\'s admin!','2016-06-28 02:59:00','2016-06-28 02:59:00',21,26),(7,'Hi Bill. I woke up with the biggest hangover!','2016-06-28 03:01:21','2016-06-28 03:01:21',27,24),(8,'Hey Chris, it\'s Michael!','2016-06-28 11:42:42','2016-06-28 11:42:42',21,28);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_levels`
--

DROP TABLE IF EXISTS `user_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_level` varchar(10) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_levels_users1_idx` (`users_id`),
  CONSTRAINT `fk_user_levels_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_levels`
--

LOCK TABLES `user_levels` WRITE;
/*!40000 ALTER TABLE `user_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `pw_hash` varchar(255) DEFAULT NULL,
  `admin_level` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` VALUES (10,'bruh','bruh4@home.com','$2b$12$y2sXW50mJ42pEdJI.9ARzuSJrS5n.liJ1NcQIKwKQtoyLbTyDD.nS',0,'2016-06-27 10:34:03','2016-06-27 10:34:03'),(16,'buddy','buddy@home.com','$2b$12$95cFFw4QB3hSthB0/6Zmg.VPfNkYmReN/zOlHoZkdfubPtDnBpjjW',0,'2016-06-27 14:34:21','2016-06-27 14:34:21'),(17,'dog','dog@home.com','$2b$12$qilUf0OVaUVrLk3FUhxo8eAFVlPTuzFlY9CTaDHhJ70WmWxhNT.3u',0,'2016-06-27 14:36:26','2016-06-27 14:36:26'),(18,'Mike Hunt','mk@home.com','$2b$12$dTsuh5gyFHMLUqtgq87PCuuCV7DLEP2P/Abi2NdukAdxiKQkzoah6',1,'2016-06-27 14:41:08','2016-06-27 14:41:08'),(21,'chris','chrish@home.com','$2b$12$H2/ie.wroZ7XNLJE7ji4hejeM07MVN3VnLwc8jSfsk/Em4NKEgonq',0,'2016-06-27 14:59:38','2016-06-27 14:59:38'),(23,'BoBo','jobo@home.com','$2b$12$GZFDEq6DjeNyjR3p790N0OAT/OaGx2ZEmvFjur1XLnoPZWqavhMH.',0,'2016-06-27 15:24:24','2016-06-27 15:24:24'),(24,'Mom','mom@home.com','$2b$12$7t0VxW.HswooZEMUNJg5eehmqbIn1XUgr5h8Dbk1yrR3L00C5BK0K',0,'2016-06-27 23:47:41','2016-06-27 23:47:41'),(26,'Chris','admin@home.com','$2b$12$a5aY3LlV2BsHM9hweGigg.r0U9jTFacAT2dcZQyFjQE0/1qxcaL4W',1,'2016-06-28 01:01:58','2016-06-28 01:01:58'),(27,'William Cosby','sleep@home.com','$2b$12$LKD0xYQfEu/i6NG74g.6V.3piTzcwCnbieM6fFykIftHrr4H80bS.',0,'2016-06-28 01:33:12','2016-06-28 01:33:12');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-06  5:02:30
