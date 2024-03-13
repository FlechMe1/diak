-- MySQL dump 10.19  Distrib 10.3.39-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: funadf_db    Database: funadf
-- ------------------------------------------------------
-- Server version	5.7.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accesses`
--

DROP TABLE IF EXISTS `accesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accesses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_type` varchar(255) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `can_access` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_accesses_on_resource` (`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesses`
--

LOCK TABLES `accesses` WRITE;
/*!40000 ALTER TABLE `accesses` DISABLE KEYS */;
/*!40000 ALTER TABLE `accesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_storage_attachments`
--

DROP TABLE IF EXISTS `active_storage_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_storage_attachments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `record_type` varchar(255) NOT NULL,
  `record_id` bigint(20) NOT NULL,
  `blob_id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_attachments_uniqueness` (`record_type`,`record_id`,`name`,`blob_id`),
  KEY `index_active_storage_attachments_on_blob_id` (`blob_id`),
  CONSTRAINT `fk_rails_c3b3935057` FOREIGN KEY (`blob_id`) REFERENCES `active_storage_blobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_attachments`
--

LOCK TABLES `active_storage_attachments` WRITE;
/*!40000 ALTER TABLE `active_storage_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_storage_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_storage_blobs`
--

DROP TABLE IF EXISTS `active_storage_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_storage_blobs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `metadata` text,
  `service_name` varchar(255) NOT NULL,
  `byte_size` bigint(20) NOT NULL,
  `checksum` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_blobs_on_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_blobs`
--

LOCK TABLES `active_storage_blobs` WRITE;
/*!40000 ALTER TABLE `active_storage_blobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_storage_blobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_storage_variant_records`
--

DROP TABLE IF EXISTS `active_storage_variant_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_storage_variant_records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `blob_id` bigint(20) NOT NULL,
  `variation_digest` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_variant_records_uniqueness` (`blob_id`,`variation_digest`),
  CONSTRAINT `fk_rails_993965df05` FOREIGN KEY (`blob_id`) REFERENCES `active_storage_blobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_variant_records`
--

LOCK TABLES `active_storage_variant_records` WRITE;
/*!40000 ALTER TABLE `active_storage_variant_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_storage_variant_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trackable_type` varchar(255) DEFAULT NULL,
  `trackable_id` bigint(20) DEFAULT NULL,
  `owner_type` varchar(255) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `parameters` text,
  `recipient_type` varchar(255) DEFAULT NULL,
  `recipient_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_activities_on_owner_id_and_owner_type` (`owner_id`,`owner_type`),
  KEY `index_activities_on_owner` (`owner_type`,`owner_id`),
  KEY `index_activities_on_recipient_id_and_recipient_type` (`recipient_id`,`recipient_type`),
  KEY `index_activities_on_recipient` (`recipient_type`,`recipient_id`),
  KEY `index_activities_on_trackable_id_and_trackable_type` (`trackable_id`,`trackable_type`),
  KEY `index_activities_on_trackable` (`trackable_type`,`trackable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2024-02-19 16:09:42.273733','2024-02-19 16:09:42.273733'),('schema_sha1','f7a891dd522cd40ab21f526c966ee6bdc45a3f6e','2024-02-19 16:09:42.279863','2024-02-19 16:09:42.279863');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attachments_on_post_id` (`post_id`),
  CONSTRAINT `fk_rails_23e7900639` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendees`
--

DROP TABLE IF EXISTS `attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendees` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `meeting_id` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attendees_on_meeting_id` (`meeting_id`),
  KEY `index_attendees_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendees`
--

LOCK TABLES `attendees` WRITE;
/*!40000 ALTER TABLE `attendees` DISABLE KEYS */;
INSERT INTO `attendees` VALUES (53,2,1,'2024-02-20 10:13:36.017455','2024-02-20 10:13:36.017455'),(54,3,1,'2024-02-20 10:13:36.024475','2024-02-20 10:13:36.024475'),(55,4,1,'2024-02-20 10:13:36.030445','2024-02-20 10:13:36.030445'),(56,5,1,'2024-02-20 10:13:36.035676','2024-02-20 10:13:36.035676'),(57,6,1,'2024-02-20 10:13:36.043768','2024-02-20 10:13:36.043768'),(58,7,1,'2024-02-20 10:13:36.050760','2024-02-20 10:13:36.050760'),(59,8,1,'2024-02-20 10:13:36.058144','2024-02-20 10:13:36.058144'),(60,9,1,'2024-02-20 10:13:36.064223','2024-02-20 10:13:36.064223'),(61,10,1,'2024-02-20 10:13:36.070004','2024-02-20 10:13:36.070004'),(62,11,1,'2024-02-20 10:13:36.077275','2024-02-20 10:13:36.077275'),(63,12,1,'2024-02-20 10:13:36.083044','2024-02-20 10:13:36.083044'),(64,13,1,'2024-02-20 10:13:36.087996','2024-02-20 10:13:36.087996'),(65,14,1,'2024-02-20 10:13:36.094381','2024-02-20 10:13:36.094381'),(66,15,1,'2024-02-20 10:13:36.100265','2024-02-20 10:13:36.100265'),(67,16,1,'2024-02-20 10:13:36.103827','2024-02-20 10:13:36.103827'),(68,17,1,'2024-02-20 10:13:36.109779','2024-02-20 10:13:36.109779'),(69,18,1,'2024-02-20 10:13:36.114634','2024-02-20 10:13:36.114634'),(70,19,1,'2024-02-20 10:13:36.119033','2024-02-20 10:13:36.119033'),(71,20,1,'2024-02-20 10:13:36.122995','2024-02-20 10:13:36.122995'),(72,21,1,'2024-02-20 10:13:36.128213','2024-02-20 10:13:36.128213'),(73,22,1,'2024-02-20 10:13:36.133182','2024-02-20 10:13:36.133182'),(74,23,1,'2024-02-20 10:13:36.137971','2024-02-20 10:13:36.137971'),(75,24,1,'2024-02-20 10:13:36.143730','2024-02-20 10:13:36.143730'),(76,25,1,'2024-02-20 10:13:36.149203','2024-02-20 10:13:36.149203'),(77,26,1,'2024-02-20 10:13:36.154141','2024-02-20 10:13:36.154141'),(78,27,1,'2024-02-20 10:13:36.158996','2024-02-20 10:13:36.158996'),(79,28,1,'2024-02-20 10:13:36.165067','2024-02-20 10:13:36.165067'),(80,29,1,'2024-02-20 10:13:36.170211','2024-02-20 10:13:36.170211'),(81,30,1,'2024-02-20 10:13:36.175602','2024-02-20 10:13:36.175602'),(82,31,1,'2024-02-20 10:13:36.180722','2024-02-20 10:13:36.180722'),(83,32,1,'2024-02-20 10:13:36.184819','2024-02-20 10:13:36.184819'),(84,33,1,'2024-02-20 10:13:36.188577','2024-02-20 10:13:36.188577'),(85,34,1,'2024-02-20 10:13:36.193695','2024-02-20 10:13:36.193695'),(86,35,1,'2024-02-20 10:13:36.198281','2024-02-20 10:13:36.198281'),(87,36,1,'2024-02-20 10:13:36.201730','2024-02-20 10:13:36.201730'),(88,37,1,'2024-02-20 10:13:36.205281','2024-02-20 10:13:36.205281'),(89,38,1,'2024-02-20 10:13:36.210105','2024-02-20 10:13:36.210105'),(90,39,1,'2024-02-20 10:13:36.214579','2024-02-20 10:13:36.214579'),(91,40,1,'2024-02-20 10:13:36.218499','2024-02-20 10:13:36.218499'),(92,41,1,'2024-02-20 10:13:36.222498','2024-02-20 10:13:36.222498'),(93,42,1,'2024-02-20 10:13:36.227314','2024-02-20 10:13:36.227314'),(94,43,1,'2024-02-20 10:13:36.231389','2024-02-20 10:13:36.231389'),(95,44,1,'2024-02-20 10:13:36.234947','2024-02-20 10:13:36.234947'),(96,45,1,'2024-02-20 10:13:36.238744','2024-02-20 10:13:36.238744'),(97,46,1,'2024-02-20 10:13:36.245084','2024-02-20 10:13:36.245084'),(98,47,1,'2024-02-20 10:13:36.249592','2024-02-20 10:13:36.249592'),(99,48,1,'2024-02-20 10:13:36.253756','2024-02-20 10:13:36.253756'),(100,49,1,'2024-02-20 10:13:36.258946','2024-02-20 10:13:36.258946'),(101,50,1,'2024-02-20 10:13:36.263596','2024-02-20 10:13:36.263596'),(102,51,1,'2024-02-20 10:13:36.267959','2024-02-20 10:13:36.267959'),(103,1,1,'2024-02-20 15:50:45.949114','2024-02-20 15:50:45.949114');
/*!40000 ALTER TABLE `attendees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backups`
--

DROP TABLE IF EXISTS `backups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backups`
--

LOCK TABLES `backups` WRITE;
/*!40000 ALTER TABLE `backups` DISABLE KEYS */;
/*!40000 ALTER TABLE `backups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structure_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `code` varchar(255) DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `opened` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `meeting_id` int(11) DEFAULT NULL,
  `manual` tinyint(1) DEFAULT NULL,
  `state` varchar(255) DEFAULT 'coming',
  PRIMARY KEY (`id`),
  KEY `index_campaigns_on_meeting_id` (`meeting_id`),
  KEY `index_campaigns_on_structure_id` (`structure_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
INSERT INTO `campaigns` VALUES (1,10,'TEST',NULL,NULL,NULL,NULL,NULL,'2024-02-20 12:45:51','2024-03-11 11:16:44',NULL,1,NULL,'opened'),(2,11,'TEST sans MEET',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:11:46','2024-03-11 11:11:50',NULL,NULL,NULL,'opened');
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `careers`
--

DROP TABLE IF EXISTS `careers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `careers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` varchar(255) DEFAULT NULL,
  `referent_id` int(11) DEFAULT NULL,
  `start_at` date DEFAULT NULL,
  `end_at` date DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `church_id` int(11) DEFAULT NULL,
  `association_id` int(11) DEFAULT NULL,
  `function` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_careers_on_referent_id` (`referent_id`),
  KEY `index_careers_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careers`
--

LOCK TABLES `careers` WRITE;
/*!40000 ALTER TABLE `careers` DISABLE KEYS */;
INSERT INTO `careers` VALUES (1,'Pasteur AEM',NULL,'2022-01-01',NULL,'2024-02-20 12:55:14.230037','2024-02-20 12:55:14.230037',1,NULL,NULL,NULL),(2,NULL,NULL,'2020-01-01','2021-12-31','2024-03-12 19:17:15.651923','2024-03-12 19:17:15.651923',1,5,NULL,'Président'),(3,NULL,NULL,'2021-01-01',NULL,'2024-03-12 19:17:15.657775','2024-03-12 19:17:15.657775',1,4,NULL,'Président');
/*!40000 ALTER TABLE `careers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `kind` varchar(255) DEFAULT NULL,
  `structure_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_categories_on_structure_id` (`structure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `structure_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_events_on_category_id` (`category_id`),
  KEY `index_events_on_structure_id` (`structure_id`),
  CONSTRAINT `fk_rails_e57212bf2e` FOREIGN KEY (`structure_id`) REFERENCES `structures` (`id`),
  CONSTRAINT `fk_rails_fd5598a81d` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fees` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `what` varchar(255) DEFAULT NULL,
  `paid_at` date DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_fees_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_8f1d9bf134` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees`
--

LOCK TABLES `fees` WRITE;
/*!40000 ALTER TABLE `fees` DISABLE KEYS */;
INSERT INTO `fees` VALUES (1,1,'2024','2024-03-02','2024-03-12 20:27:15.689709','2024-03-12 20:27:15.689709',30.00),(2,1,'2023','2023-03-02','2024-03-12 20:27:15.706684','2024-03-12 20:27:15.706684',30.00);
/*!40000 ALTER TABLE `fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intranets`
--

DROP TABLE IF EXISTS `intranets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intranets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subdomain` varchar(255) DEFAULT NULL,
  `structure_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_intranets_on_structure_id` (`structure_id`),
  CONSTRAINT `fk_rails_0f1b50b7ed` FOREIGN KEY (`structure_id`) REFERENCES `structures` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intranets`
--

LOCK TABLES `intranets` WRITE;
/*!40000 ALTER TABLE `intranets` DISABLE KEYS */;
INSERT INTO `intranets` VALUES (1,'test',11,'2024-02-27 07:49:40','2024-02-27 07:49:52');
/*!40000 ALTER TABLE `intranets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jwt_denylist`
--

DROP TABLE IF EXISTS `jwt_denylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jwt_denylist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `jti` varchar(255) NOT NULL,
  `exp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_jwt_denylist_on_jti` (`jti`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jwt_denylist`
--

LOCK TABLES `jwt_denylist` WRITE;
/*!40000 ALTER TABLE `jwt_denylist` DISABLE KEYS */;
/*!40000 ALTER TABLE `jwt_denylist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marriages`
--

DROP TABLE IF EXISTS `marriages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marriages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `husband_id` int(11) DEFAULT NULL,
  `wife_id` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_marriages_on_husband_id` (`husband_id`),
  KEY `index_marriages_on_wife_id` (`wife_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marriages`
--

LOCK TABLES `marriages` WRITE;
/*!40000 ALTER TABLE `marriages` DISABLE KEYS */;
/*!40000 ALTER TABLE `marriages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `begin_at` date DEFAULT NULL,
  `end_at` date DEFAULT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
INSERT INTO `meetings` VALUES (1,'Test','2024-03-19','2024-03-19','TEST','2024-02-19 16:11:25','2024-02-20 10:17:12');
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberships`
--

DROP TABLE IF EXISTS `memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memberships` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `member_type` varchar(255) DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  `structure_id` bigint(20) DEFAULT NULL,
  `can_vote` tinyint(1) DEFAULT '1',
  `reason` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_memberships_on_member` (`member_type`,`member_id`),
  KEY `index_memberships_on_role_id` (`role_id`),
  KEY `index_memberships_on_structure_id` (`structure_id`),
  CONSTRAINT `fk_rails_ab987c7623` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberships`
--

LOCK TABLES `memberships` WRITE;
/*!40000 ALTER TABLE `memberships` DISABLE KEYS */;
INSERT INTO `memberships` VALUES (1,1,'User',1,NULL,1,NULL,'2024-02-19 16:10:19.919459','2024-02-19 16:10:19.919459'),(2,2,'User',2,6,1,NULL,'2024-02-19 16:10:21.088671','2024-02-19 16:10:21.088671'),(3,2,'User',3,6,1,NULL,'2024-02-19 16:10:21.193908','2024-02-19 16:10:21.193908'),(4,2,'User',4,6,1,NULL,'2024-02-19 16:10:21.290808','2024-02-19 16:10:21.290808'),(5,2,'User',5,6,1,NULL,'2024-02-19 16:10:21.386505','2024-02-19 16:10:21.386505'),(6,2,'User',6,6,1,NULL,'2024-02-19 16:10:21.498901','2024-02-19 16:10:21.498901'),(7,2,'User',7,7,1,NULL,'2024-02-19 16:10:21.591599','2024-02-19 16:10:21.591599'),(8,2,'User',8,7,1,NULL,'2024-02-19 16:10:21.689372','2024-02-19 16:10:21.689372'),(9,2,'User',9,7,1,NULL,'2024-02-19 16:10:21.815554','2024-02-19 16:10:21.815554'),(10,2,'User',10,7,1,NULL,'2024-02-19 16:10:21.947152','2024-02-19 16:10:21.947152'),(11,2,'User',11,7,1,NULL,'2024-02-19 16:10:22.075761','2024-02-19 16:10:22.075761'),(12,2,'User',12,8,1,NULL,'2024-02-19 16:10:22.170837','2024-02-19 16:10:22.170837'),(13,2,'User',13,8,1,NULL,'2024-02-19 16:10:22.271084','2024-02-19 16:10:22.271084'),(14,2,'User',14,8,1,NULL,'2024-02-19 16:10:22.364792','2024-02-19 16:10:22.364792'),(15,2,'User',15,8,1,NULL,'2024-02-19 16:10:22.462857','2024-02-19 16:10:22.462857'),(16,2,'User',16,8,1,NULL,'2024-02-19 16:10:22.559962','2024-02-19 16:10:22.559962'),(17,2,'User',17,9,1,NULL,'2024-02-19 16:10:22.656851','2024-02-19 16:10:22.656851'),(18,2,'User',18,9,1,NULL,'2024-02-19 16:10:22.759665','2024-02-19 16:10:22.759665'),(19,2,'User',19,9,1,NULL,'2024-02-19 16:10:22.893143','2024-02-19 16:10:22.893143'),(20,2,'User',20,9,1,NULL,'2024-02-19 16:10:22.986103','2024-02-19 16:10:22.986103'),(21,2,'User',21,9,1,NULL,'2024-02-19 16:10:23.080929','2024-02-19 16:10:23.080929'),(22,5,'User',22,10,1,NULL,'2024-02-19 16:10:23.197362','2024-02-22 07:08:48.846192'),(23,6,'User',23,10,1,NULL,'2024-02-19 16:10:23.294731','2024-02-22 07:09:01.528563'),(24,2,'User',24,10,1,NULL,'2024-02-19 16:10:23.420839','2024-02-19 16:10:23.420839'),(25,2,'User',25,10,1,NULL,'2024-02-19 16:10:23.541316','2024-02-19 16:10:23.541316'),(26,2,'User',26,10,1,NULL,'2024-02-19 16:10:23.639414','2024-02-19 16:10:23.639414'),(27,2,'User',27,1,1,NULL,'2024-02-19 16:10:23.756562','2024-02-19 16:10:23.756562'),(28,2,'User',28,1,1,NULL,'2024-02-19 16:10:23.864042','2024-02-19 16:10:23.864042'),(29,2,'User',29,1,1,NULL,'2024-02-19 16:10:23.962268','2024-02-19 16:10:23.962268'),(30,2,'User',30,1,1,NULL,'2024-02-19 16:10:24.062480','2024-02-19 16:10:24.062480'),(31,2,'User',31,1,1,NULL,'2024-02-19 16:10:24.162280','2024-02-19 16:10:24.162280'),(32,2,'User',32,2,1,NULL,'2024-02-19 16:10:24.260362','2024-02-19 16:10:24.260362'),(33,2,'User',33,2,1,NULL,'2024-02-19 16:10:24.357953','2024-02-19 16:10:24.357953'),(34,2,'User',34,2,1,NULL,'2024-02-19 16:10:24.469775','2024-02-19 16:10:24.469775'),(35,2,'User',35,2,1,NULL,'2024-02-19 16:10:24.592542','2024-02-19 16:10:24.592542'),(36,2,'User',36,2,1,NULL,'2024-02-19 16:10:24.717257','2024-02-19 16:10:24.717257'),(37,2,'User',37,3,1,NULL,'2024-02-19 16:10:24.814811','2024-02-19 16:10:24.814811'),(38,2,'User',38,3,1,NULL,'2024-02-19 16:10:24.945453','2024-02-19 16:10:24.945453'),(39,2,'User',39,3,1,NULL,'2024-02-19 16:10:25.077489','2024-02-19 16:10:25.077489'),(40,2,'User',40,3,1,NULL,'2024-02-19 16:10:25.209451','2024-02-19 16:10:25.209451'),(41,2,'User',41,3,1,NULL,'2024-02-19 16:10:25.322177','2024-02-19 16:10:25.322177'),(42,2,'User',42,4,1,NULL,'2024-02-19 16:10:25.419668','2024-02-19 16:10:25.419668'),(43,2,'User',43,4,1,NULL,'2024-02-19 16:10:25.516825','2024-02-19 16:10:25.516825'),(44,2,'User',44,4,1,NULL,'2024-02-19 16:10:25.624474','2024-02-19 16:10:25.624474'),(45,2,'User',45,4,1,NULL,'2024-02-19 16:10:25.717532','2024-02-19 16:10:25.717532'),(46,2,'User',46,4,1,NULL,'2024-02-19 16:10:25.845540','2024-02-19 16:10:25.845540'),(47,2,'User',47,5,1,NULL,'2024-02-19 16:10:25.943800','2024-02-19 16:10:25.943800'),(48,2,'User',48,5,1,NULL,'2024-02-19 16:10:26.070097','2024-02-19 16:10:26.070097'),(49,2,'User',49,5,1,NULL,'2024-02-19 16:10:26.169956','2024-02-19 16:10:26.169956'),(50,2,'User',50,5,1,NULL,'2024-02-19 16:10:26.271066','2024-02-19 16:10:26.271066'),(51,2,'User',51,5,1,NULL,'2024-02-19 16:10:26.401462','2024-02-19 16:10:26.401462'),(52,3,'User',1,10,1,NULL,'2024-02-20 12:53:12.135341','2024-02-22 07:05:05.710611'),(53,3,'User',1,11,1,NULL,'2024-02-27 06:48:51.981366','2024-02-27 06:48:56.683750');
/*!40000 ALTER TABLE `memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motions`
--

DROP TABLE IF EXISTS `motions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `kind` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `choices` varchar(255) DEFAULT NULL,
  `max_choice` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_motions_on_campaign_id` (`campaign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motions`
--

LOCK TABLES `motions` WRITE;
/*!40000 ALTER TABLE `motions` DISABLE KEYS */;
INSERT INTO `motions` VALUES (1,2,0,'TEST OUI / NON','binary','2024-03-11 11:11:46','2024-03-11 11:11:46',NULL,1),(2,2,1,'TEST OUI / NON / NEUTRE','neutral','2024-03-11 11:11:46','2024-03-11 11:11:46',NULL,1),(3,2,2,'TEST TEXTE LIBRE','free','2024-03-11 11:11:46','2024-03-11 11:11:46',NULL,1),(4,2,3,'TEST CHOIX MULTIPLE','choices','2024-03-11 11:11:46','2024-03-11 11:11:46','choix1,choix2,choix3',1),(5,1,0,'TEST OUI / NON','binary','2024-03-11 11:16:41','2024-03-11 11:16:41',NULL,1),(6,1,1,'TEST OUI / NON / NEUTRE','neutral','2024-03-11 11:16:41','2024-03-11 11:16:41',NULL,1),(7,1,2,'TEST TEXT LIBRE','free','2024-03-11 11:16:41','2024-03-11 11:16:41',NULL,1),(8,1,3,'TEST CHOIX MULTIPLE ','choices','2024-03-11 11:16:41','2024-03-11 11:16:41','choix1,choix2,choix3',1);
/*!40000 ALTER TABLE `motions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `structure_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_posts_on_structure_id` (`structure_id`),
  CONSTRAINT `fk_rails_b25c4b067d` FOREIGN KEY (`structure_id`) REFERENCES `structures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `friendly_name` varchar(255) DEFAULT NULL,
  `short_descriptions` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin',NULL,NULL,'2024-02-19 16:10:19','2024-02-19 16:10:19'),(2,'member',NULL,NULL,'2024-02-19 16:10:21','2024-02-19 16:10:21'),(3,'president',NULL,NULL,'2024-02-22 07:04:50','2024-02-22 07:04:50'),(4,'secretary',NULL,NULL,'2024-02-22 07:08:18','2024-02-22 07:08:18'),(5,'treasurer',NULL,NULL,'2024-02-22 07:08:48','2024-02-22 07:08:48'),(6,'director',NULL,NULL,'2024-02-22 07:09:01','2024-02-22 07:09:01');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20180131103518'),('20180131152155'),('20180131211819'),('20180208083346'),('20180228163041'),('20180305122817'),('20180305122853'),('20180305211716'),('20180306092043'),('20180307110602'),('20180307110642'),('20180308155013'),('20180315114721'),('20180315120214'),('20180316132924'),('20180317133159'),('20180320121905'),('20180321083812'),('20180321100918'),('20200116104645'),('20200116104750'),('20200225100411'),('20200305105127'),('20200305115031'),('20200520111615'),('20201103084937'),('20210318085243'),('20210318092320'),('20210708082848'),('20210827143811'),('20210827163803'),('20210907132523'),('20210930100455'),('20211209155941'),('20211209160010'),('20211209165659'),('20211214122417'),('20211215101925'),('20211215130353'),('20211216153113'),('20211216172223'),('20211223134738'),('20211223134900'),('20220109164214'),('20220905121544'),('20220905153353'),('20230114145943'),('20230308205200'),('20230323094522'),('20230914065611'),('20231001150505'),('20231123071907'),('20231127070921'),('20240213071318'),('20240216132420'),('20240313191743');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `phone_1` varchar(255) DEFAULT NULL,
  `phone_2` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
INSERT INTO `structures` VALUES (1,'Jacob et Lucas','1593 Venelle De Verdun',NULL,'61205','Ivry-sur-Seine',NULL,NULL,'Church','2024-02-19 16:10:20','2024-02-19 16:10:20',NULL),(2,'Maillard et Lecomte','98 Côte Du Parc de l\'Ile',NULL,'09090','Garges-lès-Gonesse',NULL,NULL,'Church','2024-02-19 16:10:20','2024-02-19 16:10:20',NULL),(3,'Renaud et Bernard','1285 Placette Levernis',NULL,'81729','Bayonne',NULL,NULL,'Church','2024-02-19 16:10:20','2024-02-19 16:10:20',NULL),(4,'Dupuis SAS','44 Boulevard Maurice',NULL,'02037','Garges-lès-Gonesse',NULL,NULL,'Church','2024-02-19 16:10:20','2024-02-19 16:10:20',NULL),(5,'Barthelemy et Lebrun','6392 Esplanade Vergniaud',NULL,'44859','Tourcoing',NULL,NULL,'Church','2024-02-19 16:10:20','2024-02-19 16:10:20',NULL),(6,'Marie GIE','7275 Quai Georges Clemenceau',NULL,'11756','Albi',NULL,NULL,'Association','2024-02-19 16:10:20','2024-02-19 16:10:20',NULL),(7,'Thomas et Lefèvre','5 Gaffe Mary',NULL,'59774','Chalon-sur-Saône',NULL,NULL,'Association','2024-02-19 16:10:20','2024-02-19 16:10:20',NULL),(8,'Laporte et Chauvin','25 Cour Bonaparte',NULL,'83604','Istres',NULL,NULL,'Association','2024-02-19 16:10:20','2024-02-19 16:10:20',NULL),(9,'Daniel et Joly','61 Rue Jacques Dulud',NULL,'19879','Blois',NULL,NULL,'Association','2024-02-19 16:10:20','2024-02-19 16:10:20',NULL),(10,'Gautier et Lebrun','5 Rond-point Breville',NULL,'26555','Saint-Martin',NULL,NULL,'Association','2024-02-19 16:10:20','2024-02-19 16:10:20',NULL),(11,'TEST',NULL,NULL,NULL,NULL,NULL,NULL,'Association',NULL,NULL,NULL);
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) DEFAULT NULL,
  `has_heading` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploads`
--

LOCK TABLES `uploads` WRITE;
/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `phone_1` varchar(255) DEFAULT NULL,
  `phone_2` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `avatar_file_name` varchar(255) DEFAULT NULL,
  `avatar_content_type` varchar(255) DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `invitation_token` varchar(255) DEFAULT NULL,
  `invitation_created_at` datetime DEFAULT NULL,
  `invitation_sent_at` datetime DEFAULT NULL,
  `invitation_accepted_at` datetime DEFAULT NULL,
  `invitation_limit` int(11) DEFAULT NULL,
  `invited_by_id` int(11) DEFAULT NULL,
  `invited_by_type` varchar(255) DEFAULT NULL,
  `invitations_count` int(11) DEFAULT '0',
  `birthdate` date DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT '0',
  `access_token` varchar(255) DEFAULT NULL,
  `biography` text,
  `authentication_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_access_token` (`access_token`),
  UNIQUE KEY `index_users_on_invitation_token` (`invitation_token`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  KEY `index_users_on_invitations_count` (`invitations_count`),
  KEY `index_users_on_invited_by_id_and_invited_by_type` (`invited_by_id`,`invited_by_type`),
  KEY `index_users_on_invited_by_id` (`invited_by_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Paul','GRUSON',NULL,NULL,NULL,NULL,NULL,NULL,'p.gruson@gmail.com','$2a$11$f8J/fkamIWO8ddgGnPtE9OD4sk9cgoqiKEt1xgsr34dBHNtNRdMcS',NULL,NULL,NULL,10,'2024-03-12 17:41:47','2024-03-12 15:42:18','172.18.0.1','172.18.0.1','2024-02-19 16:10:19','2024-03-12 17:41:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'zCcSSpu9LjV9RAVpNB43'),(2,'Odilon','MARTIN',NULL,NULL,NULL,NULL,NULL,NULL,'ta_reynolds@jacobson.test','$2a$11$cdWyvGthf2yyWGt3QxKQn.famYjoV/Y.epBv6nUaZGoJ48rNH0.Q.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:21','2024-02-19 16:10:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'_m-7aSA23uzgAX3CwwZx'),(3,'Almine','LE ROUX',NULL,NULL,NULL,NULL,NULL,NULL,'joey.connelly@shields.test','$2a$11$OZ27hEzU58sc4uyChU7re.B4GlAbzGyU6kVJdKP5DGUoYk8nzt0MW',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:21','2024-02-19 16:10:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'CnVZjvesg2UoD_FzjJby'),(4,'Salomé','DANIEL',NULL,NULL,NULL,NULL,NULL,NULL,'william@bahringer.example','$2a$11$7UYcLl7OiN/ev30.MF8xNumkbHjLyPNmKI6laGaWT/r0bLjNg5U02',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:21','2024-02-19 16:10:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'FryTHtFsHZ_XDFinzXsL'),(5,'Adonise','BENARD',NULL,NULL,NULL,NULL,NULL,NULL,'nan.hessel@miller-cormier.test','$2a$11$ZJY3/G/Qs7AivMguRnThweqOuu5JJcuQ78Bon3SIn2dsSQOTwvmpu',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:21','2024-02-19 16:10:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'FTgdm8Vz1WZw1U3yp9Uc'),(6,'Laurène','DUFOUR',NULL,NULL,NULL,NULL,NULL,NULL,'kieth@pfannerstill.example','$2a$11$4P/wYGdxFP2ve7FFktN.aOd9ebqHJCkZcwdU3YlRkGWfr.Q6Eejsy',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:21','2024-02-19 16:10:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'MhU16i-RBcaCmYdz2p_D'),(7,'Esprit','LECOMTE',NULL,NULL,NULL,NULL,NULL,NULL,'elois_bergnaum@paucek.test','$2a$11$3X6Yq1/AgwnGhkvn.tQh2.b5KB8or2enTDXlRmmWtkvyxxR714qLq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:21','2024-02-19 16:10:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'CAjS98DkaKLZyKPvYJQw'),(8,'Gaspard','SCHMITT',NULL,NULL,NULL,NULL,NULL,NULL,'dagmar@waters.example','$2a$11$0o1W5IhPurVJJGdog4UQmemjyr0sNRde9lufdAq4t/uFA2iHms2zC',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:21','2024-02-19 16:10:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'VpS_9CvMyj1HjmzazxHx'),(9,'Apolline','CHAUVIN',NULL,NULL,NULL,NULL,NULL,NULL,'terrell@becker.example','$2a$11$8WLolMbzKTcGHXyIfyLNPegXV/k2ecdDBnrlY0YmEMxQiAyErTS2i',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:21','2024-02-19 16:10:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'8ZWus3u8B4zegcGsCSnS'),(10,'Jonas','LECLERC',NULL,NULL,NULL,NULL,NULL,NULL,'teressa_gutkowski@morar-ryan.test','$2a$11$jBAZLfm3N0Yjj9AZWoZGzOGZIBCuUPsRfmhikzRJaMm47/VJc8Hiy',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:21','2024-02-19 16:10:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'WazwywPquPRPZNH3He5k'),(11,'Aleaume','LAPORTE',NULL,NULL,NULL,NULL,NULL,NULL,'deadra.wolf@mclaughlin.example','$2a$11$sINOpiIhrYRIPX46L28RNuK5vvw7lgt7.LQe8LJp9gJMZFRcJkLDe',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:22','2024-02-19 16:10:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'GNaYRXqo2SsWDd3Ja6cY'),(12,'Émilie','LEMAIRE',NULL,NULL,NULL,NULL,NULL,NULL,'christinia@jacobson-adams.example','$2a$11$yUjJDXe/KxOkxjUYl9Q0N.iuLp9Cpjz6WjP3Fq3OlU1A91jwxVkW.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:22','2024-02-19 16:10:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'NxmFt41JE7bxcnJ1azsL'),(13,'Caroline','LEMOINE',NULL,NULL,NULL,NULL,NULL,NULL,'rosario_lesch@marquardt.example','$2a$11$CJyLWzdXcBbi9f0E2P.liulspiUSh94MVFBde2crOGMw888ctXf7q',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:22','2024-02-19 16:10:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'YtFzDWog34TCZ5McGzzx'),(14,'Régine','WEBER',NULL,NULL,NULL,NULL,NULL,NULL,'anibal@luettgen-lindgren.test','$2a$11$m5LrAG7CAMxo5tMbUj0mGO5sJgnVvPDU.OVSo5CZs2aAD3cEzYswi',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:22','2024-02-19 16:10:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'kWTZfvfHGXm1W24iXg-Y'),(15,'Ysaline','VIDAL',NULL,NULL,NULL,NULL,NULL,NULL,'denis.maggio@hodkiewicz.test','$2a$11$vAPR/cpCV2VSQTlPU61wD.wROYO6xd2C4NqqzATl1PCS9rlgO15hu',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:22','2024-02-19 16:10:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'XPw1rRBU3gMz-xzzsHRZ'),(16,'Eudoxie','LEMAIRE',NULL,NULL,NULL,NULL,NULL,NULL,'debi_mohr@okon.test','$2a$11$ajY7ky6NfMfDJYhkW9NHu.Y92LmghHQjFNKjMFTzA7hZZ8dtN/aai',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:22','2024-02-19 16:10:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'9zUAxRpCC6bVzWnx_W18'),(17,'Eudoxe','MAILLARD',NULL,NULL,NULL,NULL,NULL,NULL,'vito@veum-strosin.test','$2a$11$D3Q9Spz3ENxcE7jksl1rCu.A0qbnp4wtzD3G9Fije5W1If/IyGek2',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:22','2024-02-19 16:10:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'PbaJ9Dxz6wngzHkiTXyW'),(18,'Bérangère','MARTINEZ',NULL,NULL,NULL,NULL,NULL,NULL,'blaine.heathcote@krajcik.example','$2a$11$1oGYoTeWhLfoEVw/yu7aAuRveDZBN3eVRSbWKva4bSiKAHdyRuOqG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:22','2024-02-19 16:10:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'19ekWGy6a_BkzEbrDVKx'),(19,'Néhémie','GRONDIN',NULL,NULL,NULL,NULL,NULL,NULL,'gilbert_rogahn@bergstrom-bernier.test','$2a$11$lCFFSsADga4Hiwbyh.Q.DexLvRHrk3sJUy/NEPDsmNUqnkdhX4.hK',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:22','2024-02-19 16:10:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'yEMSFyx9jCQCh8xdykwe'),(20,'Gaspard','SANCHEZ',NULL,NULL,NULL,NULL,NULL,NULL,'lawrence.bartell@jast-littel.example','$2a$11$Oqoe7K17BkX0PliKG6ncQevqqSFqxkwOOVbvG5PeO0BYgtYqlvIaK',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:22','2024-02-19 16:10:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'xhHC_RFfhuroRxxU6esi'),(21,'Thibert','RODRIGUEZ',NULL,NULL,NULL,NULL,NULL,NULL,'corene_parker@kuphal-kuhic.test','$2a$11$IW/pw28QLPDDsm8DBMFmQeMuePr.Td2NyIW9Orm2CeyHFPChvBU5W',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:23','2024-02-19 16:10:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'VE3eB71mYVzXjs_GpZtz'),(22,'Zélie','MULLER',NULL,NULL,NULL,NULL,NULL,NULL,'claude_bode@hilll.example','$2a$11$/UyzvJp6O7ZJt/LEaK1RlONevFe0XFqkEpPDv7FZ5FvVtnz1EiHLq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:23','2024-02-19 16:10:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'niLaypt1TrUEtv7jYfpS'),(23,'Arthur','MOULIN',NULL,NULL,NULL,NULL,NULL,NULL,'wyatt@weimann-hermann.test','$2a$11$ufvQ9wTxWIx6ZrFnJFiXkem9S0w3wga1JtnSqSLXIotbEs973mO2i',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:23','2024-02-19 16:10:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'1ADwabmBy5Z7YfGTH2bc'),(24,'Frédéric','MARCHAND',NULL,NULL,NULL,NULL,NULL,NULL,'elizbeth.dooley@stamm.example','$2a$11$3HHi/hmaXb.2YH/CVnGU9OL6oNbIwcTmwJYya9W02eCJ9LtOSjCEa',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:23','2024-02-19 16:10:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'Y2pzuZXoxtKzPJVUQyxT'),(25,'Adélie','LE GALL',NULL,NULL,NULL,NULL,NULL,NULL,'jerrold@torphy.example','$2a$11$NcjgyIrOh5CuN0sQyJ8vKe4QxO3lsb/17HSknCgN2XDH3WjfI3bGW',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:23','2024-02-19 16:10:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'yXDs8CQFoKx7cmiC9i9d'),(26,'Sylvie','FONTAINE',NULL,NULL,NULL,NULL,NULL,NULL,'preston.bailey@emmerich.example','$2a$11$ikTx9A9wKg4fOnd0XTgcYej2yLEoSDgE0KjvGRLyxUqMt7fsyQStK',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:23','2024-02-19 16:10:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'nwjKyKVbxRiwJL8N935o'),(27,'Alexis','JACQUET',NULL,NULL,NULL,NULL,NULL,NULL,'herbert@yundt-harber.test','$2a$11$UxI9m7ZsFbk2TONKq.GlTek7NNF9.OuNniQAQzLq7mI3BUbI0/ZGq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:23','2024-02-19 16:10:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'pNAP4TRBB6ompfX__9c2'),(28,'Clara','CARON',NULL,NULL,NULL,NULL,NULL,NULL,'al@lakin.example','$2a$11$02lEls2t.lJjhFbJK8oQG.MxK/RGy5v8izT6DXITavCH2sDbCxWDy',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:23','2024-02-19 16:10:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'xxcFBwZRxBP8xpxyN2QG'),(29,'Nicolas','LAPORTE',NULL,NULL,NULL,NULL,NULL,NULL,'aldo@cummerata.example','$2a$11$gxQdjxH9ZLlU0AirnJdvWOxDihcT5pq960.Grk6NCejD7lc4wkLTu',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:23','2024-02-19 16:10:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'wMxSVA-oisVMxhAhm3Mo'),(30,'Olive','DANIEL',NULL,NULL,NULL,NULL,NULL,NULL,'marjory_nikolaus@dibbert.example','$2a$11$4reOaY2Ym59I3Ccyz8qT4.IF6oc8AAFB.vWqiYVF9vORiHTY808BS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:24','2024-02-19 16:10:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'qRrd1Y-JAGt3qLJGXKzj'),(31,'Anicette','MARCHAND',NULL,NULL,NULL,NULL,NULL,NULL,'kassie@littel-reynolds.test','$2a$11$vne3/dsvHJOqrxjsQLqESuNfjRb4zmhJColhYo56973e5NlVrjfCS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:24','2024-02-19 16:10:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'zzmu-yxd-iX1v7EyrUg-'),(32,'Ambroisie','REY',NULL,NULL,NULL,NULL,NULL,NULL,'cassi@beer-torp.example','$2a$11$QM7LZgNUyeEhOG7F9SXLN.P/O23NipmDIwINA1XiSfYwq2eAXEAMS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:24','2024-02-19 16:10:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'h4H4Fn5xKrzwDptsUG79'),(33,'David','LUCAS',NULL,NULL,NULL,NULL,NULL,NULL,'valentin@krajcik-dietrich.example','$2a$11$sGlbpBZ3FaJ3NX5.uyliDuEpM8XW28cM3EOZbmEssfDN1.OFO4i.K',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:24','2024-02-19 16:10:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'LxxsPKBmi5WbQpwsRdVK'),(34,'Prosper','ETIENNE',NULL,NULL,NULL,NULL,NULL,NULL,'cary@rippin.example','$2a$11$sKHC28gmxix7hts9Wd.DSuP0OYtT/IKXPHvf5faWs/3Nnj0C1Dc4G',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:24','2024-02-19 16:10:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'Hvk2xAs3VuUmtRyriapB'),(35,'Cécile','BAILLY',NULL,NULL,NULL,NULL,NULL,NULL,'vince_cremin@paucek.example','$2a$11$hbdBiA1l4HW0iHI1jz3kheTD5t1dWV.2/IZFsJH5HLC9S02OUiaae',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:24','2024-02-19 16:10:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'r9hh4M-Z4PT1e5wC-XTW'),(36,'Patrice','LAINE',NULL,NULL,NULL,NULL,NULL,NULL,'vernon_dickinson@maggio-murazik.test','$2a$11$hckJLeBh.QnBsKlCJQH1bOu9vj8ZyOXCLgXb8kLLtsKvShtwWpqHy',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:24','2024-02-19 16:10:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'uajLN_jSsWeycRAqoz9d'),(37,'Philothée','NOEL',NULL,NULL,NULL,NULL,NULL,NULL,'percy@dach.test','$2a$11$YCE0mpbKrCP8QBOBcxbHhOmbK/7S6j4ClGGID20CXPKE5j0lp3c5a',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:24','2024-02-19 16:10:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'HNC3y3LwcgxfixUZ34t4'),(38,'Ève','PRÉVOST',NULL,NULL,NULL,NULL,NULL,NULL,'kristin@monahan.test','$2a$11$X7PnCKOkMfNy7oQQ5HI2/e6Yl5Y0JrRbdCE8c9dZLCuJCEZZPfX/m',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:24','2024-02-19 16:10:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'en9vLfgn7ajKsyuR6tx6'),(39,'Antoine','NICOLAS',NULL,NULL,NULL,NULL,NULL,NULL,'jenniffer.watsica@cassin.example','$2a$11$xPz4lvYUAgepPUtCGwFqieX2syDYKO0zAEeLrJKio5CA2nBcSwTJe',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:25','2024-02-19 16:10:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'KGshYy153CZ1Sy87DfbT'),(40,'Armelle','MORIN',NULL,NULL,NULL,NULL,NULL,NULL,'theo.swift@davis-kertzmann.example','$2a$11$vFqymsW5HiuejShscqvD0e0alKnh8Nht9rqTOcC7GkUR7cDNMTxLK',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:25','2024-02-19 16:10:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'1Bkfs5ufjCebs4oVEmYF'),(41,'Amante','LEFEVRE',NULL,NULL,NULL,NULL,NULL,NULL,'joshua@hintz.example','$2a$11$Mf7r9D8TZ/UKGBxSfJ2iVugAB8VGyqNdzT28OrldPan5BSF0qKXi6',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:25','2024-02-19 16:10:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'PbwKSyyakz5DyyctL1fM'),(42,'Roselin','PICARD',NULL,NULL,NULL,NULL,NULL,NULL,'alfredo@thiel.test','$2a$11$YB5TRCPQc16Z22Qmty2IS.v82PzqBjhjdzAglnOkCbD4UcVfSmPFu',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:25','2024-02-19 16:10:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'sHqf7cFkpSSHxapnEox4'),(43,'Mélanie','LE ROUX',NULL,NULL,NULL,NULL,NULL,NULL,'willy_walsh@rohan.example','$2a$11$wnjBEUtn5.BwPu3HcypY1eWcIWf1alL27UQVilKZl.UmlDZjhk5ei',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:25','2024-02-19 16:10:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'z_Mq1TvmEX-GMsptqX6V'),(44,'Honorine','DUPUY',NULL,NULL,NULL,NULL,NULL,NULL,'donna_luettgen@blanda.example','$2a$11$c/CPs97nlSRPAu9lHdw.Ku4ylgqIl2OXJKnnGD8/bJys15X1z/aNO',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:25','2024-02-19 16:10:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'sPBKz21T9dps2rP1uY3n'),(45,'Amiel','OLIVIER',NULL,NULL,NULL,NULL,NULL,NULL,'kristy@wiza.example','$2a$11$9YdLVo/t7SD3fQkOcZI/seWtFKQl8rQteJXzbBB30p.9bkDb1ei8K',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:25','2024-02-19 16:10:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'S6BF-spZjeaaWnDG-Byb'),(46,'Virgile','FAURE',NULL,NULL,NULL,NULL,NULL,NULL,'josue_torphy@ondricka-gislason.test','$2a$11$2fyngQhBhc7dRw.VLHT2guDPt1/D/FfTXyRrzmSKTzHtU.2OSUoAi',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:25','2024-02-19 16:10:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'vdBkHVxxqGQJhExVcgMF'),(47,'Pierre','REY',NULL,NULL,NULL,NULL,NULL,NULL,'hien@bechtelar.example','$2a$11$HS6UTGBVW.vsTPqIEwV/MeCU37dOotr3yxXsS1ljoEAIBGRCZbjQy',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:25','2024-02-19 16:10:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'Mq8upsZmdSjVwB-Vz1so'),(48,'Théophile','BESSON',NULL,NULL,NULL,NULL,NULL,NULL,'beata.cremin@conroy.example','$2a$11$b.uNmxVekScZGTDSwA25/ub2Xg0w1dcbGaocyhExX3V0UKfAij/c2',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:26','2024-02-19 16:10:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'gKsZJW5cwX_aULMvo5ov'),(49,'Violette','FOURNIER',NULL,NULL,NULL,NULL,NULL,NULL,'joya_walsh@doyle.example','$2a$11$zxQ29G3piNsD6YpnD.wzpuOpWg3HFHJQmD.r/HM9CO.YsWK5nWxIS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:26','2024-02-19 16:10:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'KJBBTPohNkzKrbZ9Vsnp'),(50,'Odon','LAURENT',NULL,NULL,NULL,NULL,NULL,NULL,'jesus.erdman@halvorson.test','$2a$11$cHZy2OsNk98I8vmKMr1Pi.VCrNGwgJk3vguogRgBZQBe6jVqCSLUq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:26','2024-02-19 16:10:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'uJmXbS9JwqxT8gojAFEB'),(51,'Loïc','COLIN',NULL,NULL,NULL,NULL,NULL,NULL,'cherlyn@gulgowski.example','$2a$11$SNA4/tqAqSd0oQG5ff65De56trpRt5IzLI7LRUloHHrqvmIXJgpPu',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-02-19 16:10:26','2024-02-19 16:10:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,'Ukkx6g4Cx7C5yx_AWN6x');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voters`
--

DROP TABLE IF EXISTS `voters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voters` (
  `motion_id` int(11) DEFAULT NULL,
  `voted_at` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `resource_type` varchar(255) DEFAULT NULL,
  KEY `index_voters_on_motion_id` (`motion_id`),
  KEY `index_voters_on_resource_id_and_resource_type` (`resource_id`,`resource_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voters`
--

LOCK TABLES `voters` WRITE;
/*!40000 ALTER TABLE `voters` DISABLE KEYS */;
/*!40000 ALTER TABLE `voters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes` (
  `motion_id` int(11) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `is_consultative` tinyint(1) DEFAULT NULL,
  KEY `index_votes_on_motion_id` (`motion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voting_tables`
--

DROP TABLE IF EXISTS `voting_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voting_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `voting` varchar(255) DEFAULT NULL,
  `as_member` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_voting_tables_on_campaign_id` (`campaign_id`),
  CONSTRAINT `fk_rails_347f14d827` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voting_tables`
--

LOCK TABLES `voting_tables` WRITE;
/*!40000 ALTER TABLE `voting_tables` DISABLE KEYS */;
INSERT INTO `voting_tables` VALUES (1,1,'Pasteur AEM','count',1,'2024-02-20 12:54:55','2024-02-20 12:54:55'),(2,2,'Pasteur AEM','count',1,'2024-03-11 11:11:46','2024-03-11 11:11:46');
/*!40000 ALTER TABLE `voting_tables` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-13 19:32:08
