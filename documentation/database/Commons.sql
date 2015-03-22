CREATE DATABASE  IF NOT EXISTS `commons` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `commons`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 192.168.1.99    Database: commons
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `unique_key` int(11) NOT NULL,
  `admin_mail` varchar(255) DEFAULT NULL,
  `base_currency_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `hqtimezone_id` bigint(20) DEFAULT NULL,
  `host_country_id` bigint(20) NOT NULL,
  `iban_id` bigint(20) NOT NULL,
  `last_updated` datetime NOT NULL,
  `notes` varchar(2000) DEFAULT NULL,
  `official_language_id` bigint(20) NOT NULL,
  `official_name` varchar(255) NOT NULL,
  `official_name_int` varchar(255) NOT NULL,
  `org_tree_root_id` bigint(20) NOT NULL,
  `rec_status` varchar(6) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `site_home` varchar(255) DEFAULT NULL,
  `swift_bank_code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_tqlkoyxugthvrukbkmxfitdnl` (`unique_key`),
  KEY `FK_fg811e2pu7ok8opsylk08e86t` (`base_currency_id`),
  KEY `FK_4qm3b9ron9c6m1s6j4y6bnqbq` (`hqtimezone_id`),
  KEY `FK_53uje9cvs8eu37xso7r34d6ce` (`host_country_id`),
  KEY `FK_pi8mqui6ri421h3c0kh63q8fk` (`iban_id`),
  KEY `FK_5ug6vmvbdvgb15jkcrpa2fhkr` (`official_language_id`),
  KEY `FK_nbic6jmv1ycy5h5w8luwcdnb1` (`org_tree_root_id`),
  CONSTRAINT `FK_4qm3b9ron9c6m1s6j4y6bnqbq` FOREIGN KEY (`hqtimezone_id`) REFERENCES `timezones` (`id`),
  CONSTRAINT `FK_53uje9cvs8eu37xso7r34d6ce` FOREIGN KEY (`host_country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `FK_5ug6vmvbdvgb15jkcrpa2fhkr` FOREIGN KEY (`official_language_id`) REFERENCES `languages` (`id`),
  CONSTRAINT `FK_fg811e2pu7ok8opsylk08e86t` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `FK_nbic6jmv1ycy5h5w8luwcdnb1` FOREIGN KEY (`org_tree_root_id`) REFERENCES `orgunits` (`id`),
  CONSTRAINT `FK_pi8mqui6ri421h3c0kh63q8fk` FOREIGN KEY (`iban_id`) REFERENCES `ibans` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` VALUES (1,0,1,'webmaster@AgileBank.com',1,'2015-03-07 19:53:51','info@AgileBank.com',433,1,1,'2015-03-07 19:53:51',NULL,1,'Ευέλικτη Τράπεζα','Agile Bank',1,'Active','AB','www.AgileBank.com','AGBK0123');
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_channels`
--

DROP TABLE IF EXISTS `bank_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_channels` (
  `the_bank_channels_id` bigint(20) DEFAULT NULL,
  `channel_id` bigint(20) DEFAULT NULL,
  KEY `FK_km9hb8tt8lxepg5tujcg0dcy1` (`channel_id`),
  KEY `FK_kv2qp6ykbb8vfiuvr6eo540e8` (`the_bank_channels_id`),
  CONSTRAINT `FK_km9hb8tt8lxepg5tujcg0dcy1` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  CONSTRAINT `FK_kv2qp6ykbb8vfiuvr6eo540e8` FOREIGN KEY (`the_bank_channels_id`) REFERENCES `bank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_channels`
--

LOCK TABLES `bank_channels` WRITE;
/*!40000 ALTER TABLE `bank_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channels` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `code` varchar(3) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `notes` varchar(2000) DEFAULT NULL,
  `rec_status` varchar(7) NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_int` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5o7wyb2eteffd8ei7d955lml9` (`code`),
  UNIQUE KEY `UK_juqmaaytwlda5vycyk7qixf4f` (`title`),
  UNIQUE KEY `UK_e0thkh4j54f6rgn1h6uvujsvr` (`title_int`),
  KEY `code_Idx` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES (1,0,'BRN','2015-03-07 19:53:39','2015-03-07 19:53:39',NULL,'Active','Δίκτυο Καταστημάτων','Branch Network'),(2,0,'ATM','2015-03-07 19:53:39','2015-03-07 19:53:39',NULL,'Active','Δίκτυο ΑΤΜ','ΑΤΜ Network'),(3,0,'WEB','2015-03-07 19:53:39','2015-03-07 19:53:39',NULL,'Active','Internet Banking','Internet Banking'),(4,0,'PHN','2015-03-07 19:53:39','2015-03-07 19:53:39',NULL,'Active','Αυτόματη Τηλεφωνική Εξυπηρέτηση','Phone Banking'),(5,0,'CCR','2015-03-07 19:53:39','2015-03-07 19:53:39',NULL,'Active','Τηλεφωνικό Κέντρο Εξυπηρέτησης','Call Center'),(6,0,'AGT','2015-03-07 19:53:39','2015-03-07 19:53:39',NULL,'Active','Δίκτυο Πρακτόρευσης','Agents Banking');
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `capital` varchar(255) DEFAULT NULL,
  `currency_id` bigint(20) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `date_format` varchar(255) DEFAULT NULL,
  `iban_id` bigint(20) DEFAULT NULL,
  `internet_code` varchar(255) DEFAULT NULL,
  `iso2` varchar(2) NOT NULL,
  `last_updated` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_int` varchar(255) NOT NULL,
  `notes` varchar(2048) DEFAULT NULL,
  `num_code` int(11) NOT NULL,
  `phone_code` varchar(255) DEFAULT NULL,
  `rec_status` varchar(7) NOT NULL,
  `working_days` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mochnek4ptawffuoamred73ha` (`iso2`),
  UNIQUE KEY `UK_1pyiwrqimi3hnl3vtgsypj5r` (`name`),
  UNIQUE KEY `UK_4pel7q8304brgftkj0yxq3q18` (`name_int`),
  UNIQUE KEY `UK_9u21866hblmywjfi44ahs70bx` (`num_code`),
  UNIQUE KEY `UK_p9q3fi5ybb12wmhr7460aeqgj` (`capital`),
  KEY `FK_99jqlxqblgj0a5kuyc3wisc9i` (`currency_id`),
  KEY `FK_h85gk4nkalvnou93x84tiai4s` (`iban_id`),
  CONSTRAINT `FK_99jqlxqblgj0a5kuyc3wisc9i` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `FK_h85gk4nkalvnou93x84tiai4s` FOREIGN KEY (`iban_id`) REFERENCES `ibans` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,0,'Athens',1,'2015-03-07 19:53:40','dd-mm-yyyy',1,'gr','GR','2015-03-07 19:53:40','ΕΛΛΑΔΑ','GREECE',NULL,30,'0030','Active','MTWTF--');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_languages`
--

DROP TABLE IF EXISTS `countries_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries_languages` (
  `country_languages_id` bigint(20) DEFAULT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  KEY `FK_teoyf3q6au91abx6aplftm3lj` (`language_id`),
  KEY `FK_o3vogk1w1fg7oh9yt8nj1ymnh` (`country_languages_id`),
  CONSTRAINT `FK_o3vogk1w1fg7oh9yt8nj1ymnh` FOREIGN KEY (`country_languages_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `FK_teoyf3q6au91abx6aplftm3lj` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_languages`
--

LOCK TABLES `countries_languages` WRITE;
/*!40000 ALTER TABLE `countries_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_timezones`
--

DROP TABLE IF EXISTS `countries_timezones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries_timezones` (
  `country_time_zones_id` bigint(20) DEFAULT NULL,
  `timezone_id` bigint(20) DEFAULT NULL,
  KEY `FK_cn739km85l0vcsqepj9wvdqx1` (`timezone_id`),
  KEY `FK_547ijhdtdhldhsmmhy8c4lvbt` (`country_time_zones_id`),
  CONSTRAINT `FK_547ijhdtdhldhsmmhy8c4lvbt` FOREIGN KEY (`country_time_zones_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `FK_cn739km85l0vcsqepj9wvdqx1` FOREIGN KEY (`timezone_id`) REFERENCES `timezones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_timezones`
--

LOCK TABLES `countries_timezones` WRITE;
/*!40000 ALTER TABLE `countries_timezones` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_timezones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `area` varchar(13) NOT NULL,
  `date_created` datetime NOT NULL,
  `iso3` varchar(3) NOT NULL,
  `last_updated` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_int` varchar(255) NOT NULL,
  `notes` varchar(2000) DEFAULT NULL,
  `rec_status` varchar(7) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3lbq9s2ikga0321vnv0g2evnf` (`iso3`),
  UNIQUE KEY `UK_a2yxotynwqjrmkq71won77vui` (`name`),
  UNIQUE KEY `UK_eycoc4b822y0f8uytivy49v6h` (`name_int`),
  KEY `CurrencyIso3_Idx` (`iso3`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,1,'EU-EUR','2015-03-07 19:53:40','EUR','2015-03-07 19:54:28','ΕΥΡΩ','EURO','For how long?','Active'),(2,0,'North America','2015-03-07 19:53:40','USD','2015-03-07 19:53:40','ΔΟΛΛΑΡΙΟ ΗΠΑ','USD DOLLAR',NULL,'Active'),(3,0,'EU-None EUR','2015-03-07 19:53:40','GBP','2015-03-07 19:53:40','ΛΥΡΑ ΑΓΓΛΙΑΣ','UK POUND',NULL,'Active'),(4,0,'Asia','2015-03-07 19:53:40','JPY','2015-03-07 19:53:40','ΓΙΕΝ ΙΑΠΩΝΙΑΣ','JAPAN YIEN',NULL,'Active');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holidays` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `holiday` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `notes` varchar(250) DEFAULT NULL,
  `rec_status` varchar(7) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `title_int` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4l5adqypycb6uytp0wxtamnpy` (`holiday`),
  KEY `nathol_idx` (`country_id`,`holiday`),
  CONSTRAINT `FK_hojxpuap0gymmgeyst0cdf0u0` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibans`
--

DROP TABLE IF EXISTS `ibans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `chars` int(11) NOT NULL,
  `country_iso2` varchar(2) NOT NULL,
  `date_created` datetime NOT NULL,
  `fields` varchar(255) NOT NULL,
  `iban_format` varchar(255) NOT NULL,
  `last_updated` datetime NOT NULL,
  `notes` varchar(2000) DEFAULT NULL,
  `rec_status` varchar(7) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ly54e7jc24agnxa9rrd7xyshk` (`country_iso2`),
  KEY `RecordStatus_Idx` (`rec_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibans`
--

LOCK TABLES `ibans` WRITE;
/*!40000 ALTER TABLE `ibans` DISABLE KEYS */;
INSERT INTO `ibans` VALUES (1,0,27,'GR','2015-03-07 19:53:40','GRkk bbbs sssc cccc cccc cccc ccc','7n,16c','2015-03-07 19:53:40',NULL,'Active'),(2,0,22,'DE','2015-03-07 19:53:40','DEkk bbbb bbbb cccc cccc cc','18n','2015-03-07 19:53:40',NULL,'Active'),(3,0,27,'FR','2015-03-07 19:53:40','FRkk bbbb bggg ggcc cccc cccc cxx','10n,11c,2n','2015-03-07 19:53:40',NULL,'Active');
/*!40000 ALTER TABLE `ibans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `iso2` varchar(255) NOT NULL,
  `last_updated` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_int` varchar(255) NOT NULL,
  `notes` varchar(2000) DEFAULT NULL,
  `rec_status` varchar(7) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4jp6ng42aq4xkdlk9vna2ddyk` (`iso2`),
  UNIQUE KEY `UK_f6axmaokhmrbmm746866v0uyu` (`name`),
  UNIQUE KEY `UK_tnvk8tgg1jnrcn80rb5jsd8fk` (`name_int`),
  KEY `LanguageIso_Idx` (`iso2`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,0,'2015-03-07 19:53:40','el','2015-03-07 19:53:40','Ελληνικά','Hellenic - Greek',NULL,'Active'),(2,0,'2015-03-07 19:53:40','en','2015-03-07 19:53:40','Αγγλικά','English',NULL,'Active'),(3,0,'2015-03-07 19:53:40','de','2015-03-07 19:53:40','Γερμανικά','German',NULL,'Active'),(4,0,'2015-03-07 19:53:40','es','2015-03-07 19:53:40','Ισπανικά','Spanish',NULL,'Active'),(5,0,'2015-03-07 19:53:40','fr','2015-03-07 19:53:40','Γαλλικά','French',NULL,'Active'),(6,0,'2015-03-07 19:53:40','it','2015-03-07 19:53:40','Ιταλικά','Italian',NULL,'Active'),(7,0,'2015-03-07 19:53:40','pr','2015-03-07 19:53:40','Πορτογαλικά','Portuguese',NULL,'Active');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgunits`
--

DROP TABLE IF EXISTS `orgunits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgunits` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `notes` varchar(2000) DEFAULT NULL,
  `org_type_id` bigint(20) NOT NULL,
  `parent_unit_id` bigint(20) DEFAULT NULL,
  `rec_status` varchar(7) NOT NULL,
  `status` varchar(8) NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_int` varchar(255) NOT NULL,
  `type` varchar(7) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_qe3jpgfmet6338us2jevf16d1` (`code`),
  UNIQUE KEY `UK_p3scc1fnahpt73kt79wtyfbqe` (`title`),
  UNIQUE KEY `UK_70vtop3b7aqqh1aliwslg2oba` (`title_int`),
  KEY `OrgUnitCode_idx` (`code`),
  KEY `OrgUnitRoot_idx` (`parent_unit_id`),
  KEY `FK_31k6mj2fi3adlxu5g8493i355` (`org_type_id`),
  CONSTRAINT `FK_31k6mj2fi3adlxu5g8493i355` FOREIGN KEY (`org_type_id`) REFERENCES `orgunittypes` (`id`),
  CONSTRAINT `FK_5dpkspe2pcol5cv97jnqql2x5` FOREIGN KEY (`parent_unit_id`) REFERENCES `orgunits` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgunits`
--

LOCK TABLES `orgunits` WRITE;
/*!40000 ALTER TABLE `orgunits` DISABLE KEYS */;
INSERT INTO `orgunits` VALUES (1,0,'BANK','2015-03-07 19:53:39','2015-03-07 19:53:39',NULL,1,NULL,'Active','Active','Best Bank','Best Bank','Unit'),(2,0,'BOD','2015-03-07 19:53:39','2015-03-07 19:53:39',NULL,2,1,'Active','Active','Διοικιτικό Συμβούλιο','Board of Directors','Unit'),(3,0,'CHR','2015-03-07 19:53:39','2015-03-07 19:53:39',NULL,3,2,'Active','Active','Πρόεδρος ΔΣ','Chairman of the Board','Person');
/*!40000 ALTER TABLE `orgunits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgunittypes`
--

DROP TABLE IF EXISTS `orgunittypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgunittypes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `notes` varchar(2000) DEFAULT NULL,
  `rec_status` varchar(7) NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_int` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1kscb5i1r8tfusgk0lvwd4g69` (`code`),
  UNIQUE KEY `UK_pwnkyvk3cxkhkf3dlf8sdfgq4` (`title`),
  UNIQUE KEY `UK_jhl3eqc9w151diiqvj417m8bn` (`title_int`),
  KEY `OrgUnitTypeCode_idx` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgunittypes`
--

LOCK TABLES `orgunittypes` WRITE;
/*!40000 ALTER TABLE `orgunittypes` DISABLE KEYS */;
INSERT INTO `orgunittypes` VALUES (1,0,'BANK','2015-03-07 19:53:39','2015-03-07 19:53:39',NULL,'Active','Best Bank','Best Bank'),(2,0,'BOD','2015-03-07 19:53:39','2015-03-07 19:53:39',NULL,'Active','Διοικητικό Συμβούλιο','Board of Directors'),(3,0,'CHR','2015-03-07 19:53:39','2015-03-07 19:53:39',NULL,'Active','Πρόεδρος ΔΣ','Chairman of the BoD'),(4,0,'VCHR','2015-03-07 19:53:39','2015-03-07 19:53:39',NULL,'Active','Αντιπρόεδρος ΔΣ','Vice-Chairman of the BoD'),(5,0,'CEO','2015-03-07 19:53:39','2015-03-07 19:53:39',NULL,'Active','Διευθύνων Σύμβουλος','Chief Executive Officer'),(6,0,'DCEO','2015-03-07 19:53:39','2015-03-07 19:53:39',NULL,'Active','Αναπληρωτής Διευθύνων Σύμβουλος','Deputy Chief Executive Officer');
/*!40000 ALTER TABLE `orgunittypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timezones`
--

DROP TABLE IF EXISTS `timezones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timezones` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `location` varchar(100) NOT NULL,
  `notes` varchar(2000) DEFAULT NULL,
  `offset` varchar(255) NOT NULL,
  `rec_status` varchar(7) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5n0ofihcuko4r5dtff8d89jjd` (`location`),
  KEY `city_Idx` (`location`)
) ENGINE=InnoDB AUTO_INCREMENT=607 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timezones`
--

LOCK TABLES `timezones` WRITE;
/*!40000 ALTER TABLE `timezones` DISABLE KEYS */;
INSERT INTO `timezones` VALUES (1,0,'ACT',NULL,'+9:50','Active'),(2,0,'AET',NULL,'+10:00','Active'),(3,0,'AGT',NULL,'-3:00','Active'),(4,0,'ART',NULL,'+2:00','Active'),(5,0,'AST',NULL,'-10:00','Active'),(6,0,'AFRICA/ABIDJAN',NULL,'+0:00','Active'),(7,0,'AFRICA/ACCRA',NULL,'+0:00','Active'),(8,0,'AFRICA/ADDIS_ABABA',NULL,'+3:00','Active'),(9,0,'AFRICA/ALGIERS',NULL,'+0:00','Active'),(10,0,'AFRICA/ASMARA',NULL,'+3:00','Active'),(11,0,'AFRICA/ASMERA',NULL,'+3:00','Active'),(12,0,'AFRICA/BAMAKO',NULL,'+0:00','Active'),(13,0,'AFRICA/BANGUI',NULL,'+1:00','Active'),(14,0,'AFRICA/BANJUL',NULL,'+0:00','Active'),(15,0,'AFRICA/BISSAU',NULL,'-1:00','Active'),(16,0,'AFRICA/BLANTYRE',NULL,'+2:00','Active'),(17,0,'AFRICA/BRAZZAVILLE',NULL,'+1:00','Active'),(18,0,'AFRICA/BUJUMBURA',NULL,'+2:00','Active'),(19,0,'AFRICA/CAIRO',NULL,'+2:00','Active'),(20,0,'AFRICA/CASABLANCA',NULL,'+0:00','Active'),(21,0,'AFRICA/CEUTA',NULL,'+0:00','Active'),(22,0,'AFRICA/CONAKRY',NULL,'+0:00','Active'),(23,0,'AFRICA/DAKAR',NULL,'+0:00','Active'),(24,0,'AFRICA/DAR_ES_SALAAM',NULL,'+3:00','Active'),(25,0,'AFRICA/DJIBOUTI',NULL,'+3:00','Active'),(26,0,'AFRICA/DOUALA',NULL,'+1:00','Active'),(27,0,'AFRICA/EL_AAIUN',NULL,'-1:00','Active'),(28,0,'AFRICA/FREETOWN',NULL,'+0:00','Active'),(29,0,'AFRICA/GABORONE',NULL,'+2:00','Active'),(30,0,'AFRICA/HARARE',NULL,'+2:00','Active'),(31,0,'AFRICA/JOHANNESBURG',NULL,'+2:00','Active'),(32,0,'AFRICA/JUBA',NULL,'+2:00','Active'),(33,0,'AFRICA/KAMPALA',NULL,'+3:00','Active'),(34,0,'AFRICA/KHARTOUM',NULL,'+2:00','Active'),(35,0,'AFRICA/KIGALI',NULL,'+2:00','Active'),(36,0,'AFRICA/KINSHASA',NULL,'+1:00','Active'),(37,0,'AFRICA/LAGOS',NULL,'+1:00','Active'),(38,0,'AFRICA/LIBREVILLE',NULL,'+1:00','Active'),(39,0,'AFRICA/LOME',NULL,'+0:00','Active'),(40,0,'AFRICA/LUANDA',NULL,'+1:00','Active'),(41,0,'AFRICA/LUBUMBASHI',NULL,'+2:00','Active'),(42,0,'AFRICA/LUSAKA',NULL,'+2:00','Active'),(43,0,'AFRICA/MALABO',NULL,'+1:00','Active'),(44,0,'AFRICA/MAPUTO',NULL,'+2:00','Active'),(45,0,'AFRICA/MASERU',NULL,'+2:00','Active'),(46,0,'AFRICA/MBABANE',NULL,'+2:00','Active'),(47,0,'AFRICA/MOGADISHU',NULL,'+3:00','Active'),(48,0,'AFRICA/MONROVIA',NULL,'-0:74','Active'),(49,0,'AFRICA/NAIROBI',NULL,'+3:00','Active'),(50,0,'AFRICA/NDJAMENA',NULL,'+1:00','Active'),(51,0,'AFRICA/NIAMEY',NULL,'+1:00','Active'),(52,0,'AFRICA/NOUAKCHOTT',NULL,'+0:00','Active'),(53,0,'AFRICA/OUAGADOUGOU',NULL,'+0:00','Active'),(54,0,'AFRICA/PORTO-NOVO',NULL,'+1:00','Active'),(55,0,'AFRICA/SAO_TOME',NULL,'+0:00','Active'),(56,0,'AFRICA/TIMBUKTU',NULL,'+0:00','Active'),(57,0,'AFRICA/TRIPOLI',NULL,'+2:00','Active'),(58,0,'AFRICA/TUNIS',NULL,'+1:00','Active'),(59,0,'AFRICA/WINDHOEK',NULL,'+2:00','Active'),(60,0,'AMERICA/ADAK',NULL,'-11:00','Active'),(61,0,'AMERICA/ANCHORAGE',NULL,'-10:00','Active'),(62,0,'AMERICA/ANGUILLA',NULL,'-4:00','Active'),(63,0,'AMERICA/ANTIGUA',NULL,'-4:00','Active'),(64,0,'AMERICA/ARAGUAINA',NULL,'-3:00','Active'),(65,0,'AMERICA/ARGENTINA/BUENOS_AIRES',NULL,'-3:00','Active'),(66,0,'AMERICA/ARGENTINA/CATAMARCA',NULL,'-3:00','Active'),(67,0,'AMERICA/ARGENTINA/COMODRIVADAVIA',NULL,'-3:00','Active'),(68,0,'AMERICA/ARGENTINA/CORDOBA',NULL,'-3:00','Active'),(69,0,'AMERICA/ARGENTINA/JUJUY',NULL,'-3:00','Active'),(70,0,'AMERICA/ARGENTINA/LA_RIOJA',NULL,'-3:00','Active'),(71,0,'AMERICA/ARGENTINA/MENDOZA',NULL,'-3:00','Active'),(72,0,'AMERICA/ARGENTINA/RIO_GALLEGOS',NULL,'-3:00','Active'),(73,0,'AMERICA/ARGENTINA/SALTA',NULL,'-3:00','Active'),(74,0,'AMERICA/ARGENTINA/SAN_JUAN',NULL,'-3:00','Active'),(75,0,'AMERICA/ARGENTINA/SAN_LUIS',NULL,'-3:00','Active'),(76,0,'AMERICA/ARGENTINA/TUCUMAN',NULL,'-3:00','Active'),(77,0,'AMERICA/ARGENTINA/USHUAIA',NULL,'-3:00','Active'),(78,0,'AMERICA/ARUBA',NULL,'-4:00','Active'),(79,0,'AMERICA/ASUNCION',NULL,'-4:00','Active'),(80,0,'AMERICA/ATIKOKAN',NULL,'-5:00','Active'),(81,0,'AMERICA/ATKA',NULL,'-11:00','Active'),(82,0,'AMERICA/BAHIA',NULL,'-3:00','Active'),(83,0,'AMERICA/BAHIA_BANDERAS',NULL,'-8:00','Active'),(84,0,'AMERICA/BARBADOS',NULL,'-4:00','Active'),(85,0,'AMERICA/BELEM',NULL,'-3:00','Active'),(86,0,'AMERICA/BELIZE',NULL,'-6:00','Active'),(87,0,'AMERICA/BLANC-SABLON',NULL,'-4:00','Active'),(88,0,'AMERICA/BOA_VISTA',NULL,'-4:00','Active'),(89,0,'AMERICA/BOGOTA',NULL,'-5:00','Active'),(90,0,'AMERICA/BOISE',NULL,'-7:00','Active'),(91,0,'AMERICA/BUENOS_AIRES',NULL,'-3:00','Active'),(92,0,'AMERICA/CAMBRIDGE_BAY',NULL,'-7:00','Active'),(93,0,'AMERICA/CAMPO_GRANDE',NULL,'-4:00','Active'),(94,0,'AMERICA/CANCUN',NULL,'-6:00','Active'),(95,0,'AMERICA/CARACAS',NULL,'-4:00','Active'),(96,0,'AMERICA/CATAMARCA',NULL,'-3:00','Active'),(97,0,'AMERICA/CAYENNE',NULL,'-3:00','Active'),(98,0,'AMERICA/CAYMAN',NULL,'-5:00','Active'),(99,0,'AMERICA/CHICAGO',NULL,'-6:00','Active'),(100,0,'AMERICA/CHIHUAHUA',NULL,'-6:00','Active'),(101,0,'AMERICA/CORAL_HARBOUR',NULL,'-5:00','Active'),(102,0,'AMERICA/CORDOBA',NULL,'-3:00','Active'),(103,0,'AMERICA/COSTA_RICA',NULL,'-6:00','Active'),(104,0,'AMERICA/CRESTON',NULL,'-7:00','Active'),(105,0,'AMERICA/CUIABA',NULL,'-4:00','Active'),(106,0,'AMERICA/CURACAO',NULL,'-4:00','Active'),(107,0,'AMERICA/DANMARKSHAVN',NULL,'-3:00','Active'),(108,0,'AMERICA/DAWSON',NULL,'-9:00','Active'),(109,0,'AMERICA/DAWSON_CREEK',NULL,'-8:00','Active'),(110,0,'AMERICA/DENVER',NULL,'-7:00','Active'),(111,0,'AMERICA/DETROIT',NULL,'-5:00','Active'),(112,0,'AMERICA/DOMINICA',NULL,'-4:00','Active'),(113,0,'AMERICA/EDMONTON',NULL,'-7:00','Active'),(114,0,'AMERICA/EIRUNEPE',NULL,'-5:00','Active'),(115,0,'AMERICA/EL_SALVADOR',NULL,'-6:00','Active'),(116,0,'AMERICA/ENSENADA',NULL,'-8:00','Active'),(117,0,'AMERICA/FORT_WAYNE',NULL,'-5:00','Active'),(118,0,'AMERICA/FORTALEZA',NULL,'-3:00','Active'),(119,0,'AMERICA/GLACE_BAY',NULL,'-4:00','Active'),(120,0,'AMERICA/GODTHAB',NULL,'-3:00','Active'),(121,0,'AMERICA/GOOSE_BAY',NULL,'-4:00','Active'),(122,0,'AMERICA/GRAND_TURK',NULL,'-5:00','Active'),(123,0,'AMERICA/GRENADA',NULL,'-4:00','Active'),(124,0,'AMERICA/GUADELOUPE',NULL,'-4:00','Active'),(125,0,'AMERICA/GUATEMALA',NULL,'-6:00','Active'),(126,0,'AMERICA/GUAYAQUIL',NULL,'-5:00','Active'),(127,0,'AMERICA/GUYANA',NULL,'-3:75','Active'),(128,0,'AMERICA/HALIFAX',NULL,'-4:00','Active'),(129,0,'AMERICA/HAVANA',NULL,'-5:00','Active'),(130,0,'AMERICA/HERMOSILLO',NULL,'-8:00','Active'),(131,0,'AMERICA/INDIANA/INDIANAPOLIS',NULL,'-5:00','Active'),(132,0,'AMERICA/INDIANA/KNOX',NULL,'-6:00','Active'),(133,0,'AMERICA/INDIANA/MARENGO',NULL,'-5:00','Active'),(134,0,'AMERICA/INDIANA/PETERSBURG',NULL,'-6:00','Active'),(135,0,'AMERICA/INDIANA/TELL_CITY',NULL,'-5:00','Active'),(136,0,'AMERICA/INDIANA/VEVAY',NULL,'-5:00','Active'),(137,0,'AMERICA/INDIANA/VINCENNES',NULL,'-5:00','Active'),(138,0,'AMERICA/INDIANA/WINAMAC',NULL,'-5:00','Active'),(139,0,'AMERICA/INDIANAPOLIS',NULL,'-5:00','Active'),(140,0,'AMERICA/INUVIK',NULL,'-8:00','Active'),(141,0,'AMERICA/IQALUIT',NULL,'-5:00','Active'),(142,0,'AMERICA/JAMAICA',NULL,'-5:00','Active'),(143,0,'AMERICA/JUJUY',NULL,'-3:00','Active'),(144,0,'AMERICA/JUNEAU',NULL,'-8:00','Active'),(145,0,'AMERICA/KENTUCKY/LOUISVILLE',NULL,'-5:00','Active'),(146,0,'AMERICA/KENTUCKY/MONTICELLO',NULL,'-6:00','Active'),(147,0,'AMERICA/KNOX_IN',NULL,'-6:00','Active'),(148,0,'AMERICA/KRALENDIJK',NULL,'-4:00','Active'),(149,0,'AMERICA/LA_PAZ',NULL,'-4:00','Active'),(150,0,'AMERICA/LIMA',NULL,'-5:00','Active'),(151,0,'AMERICA/LOS_ANGELES',NULL,'-8:00','Active'),(152,0,'AMERICA/LOUISVILLE',NULL,'-5:00','Active'),(153,0,'AMERICA/LOWER_PRINCES',NULL,'-4:00','Active'),(154,0,'AMERICA/MACEIO',NULL,'-3:00','Active'),(155,0,'AMERICA/MANAGUA',NULL,'-6:00','Active'),(156,0,'AMERICA/MANAUS',NULL,'-4:00','Active'),(157,0,'AMERICA/MARIGOT',NULL,'-4:00','Active'),(158,0,'AMERICA/MARTINIQUE',NULL,'-4:00','Active'),(159,0,'AMERICA/MATAMOROS',NULL,'-6:00','Active'),(160,0,'AMERICA/MAZATLAN',NULL,'-8:00','Active'),(161,0,'AMERICA/MENDOZA',NULL,'-3:00','Active'),(162,0,'AMERICA/MENOMINEE',NULL,'-5:00','Active'),(163,0,'AMERICA/MERIDA',NULL,'-6:00','Active'),(164,0,'AMERICA/METLAKATLA',NULL,'-8:00','Active'),(165,0,'AMERICA/MEXICO_CITY',NULL,'-6:00','Active'),(166,0,'AMERICA/MIQUELON',NULL,'-4:00','Active'),(167,0,'AMERICA/MONCTON',NULL,'-4:00','Active'),(168,0,'AMERICA/MONTERREY',NULL,'-6:00','Active'),(169,0,'AMERICA/MONTEVIDEO',NULL,'-3:00','Active'),(170,0,'AMERICA/MONTREAL',NULL,'-5:00','Active'),(171,0,'AMERICA/MONTSERRAT',NULL,'-4:00','Active'),(172,0,'AMERICA/NASSAU',NULL,'-5:00','Active'),(173,0,'AMERICA/NEW_YORK',NULL,'-5:00','Active'),(174,0,'AMERICA/NIPIGON',NULL,'-5:00','Active'),(175,0,'AMERICA/NOME',NULL,'-11:00','Active'),(176,0,'AMERICA/NORONHA',NULL,'-2:00','Active'),(177,0,'AMERICA/NORTH_DAKOTA/BEULAH',NULL,'-7:00','Active'),(178,0,'AMERICA/NORTH_DAKOTA/CENTER',NULL,'-7:00','Active'),(179,0,'AMERICA/NORTH_DAKOTA/NEW_SALEM',NULL,'-7:00','Active'),(180,0,'AMERICA/OJINAGA',NULL,'-6:00','Active'),(181,0,'AMERICA/PANAMA',NULL,'-5:00','Active'),(182,0,'AMERICA/PANGNIRTUNG',NULL,'-4:00','Active'),(183,0,'AMERICA/PARAMARIBO',NULL,'-3:50','Active'),(184,0,'AMERICA/PHOENIX',NULL,'-7:00','Active'),(185,0,'AMERICA/PORT-AU-PRINCE',NULL,'-5:00','Active'),(186,0,'AMERICA/PORT_OF_SPAIN',NULL,'-4:00','Active'),(187,0,'AMERICA/PORTO_ACRE',NULL,'-5:00','Active'),(188,0,'AMERICA/PORTO_VELHO',NULL,'-4:00','Active'),(189,0,'AMERICA/PUERTO_RICO',NULL,'-4:00','Active'),(190,0,'AMERICA/RAINY_RIVER',NULL,'-6:00','Active'),(191,0,'AMERICA/RANKIN_INLET',NULL,'-6:00','Active'),(192,0,'AMERICA/RECIFE',NULL,'-3:00','Active'),(193,0,'AMERICA/REGINA',NULL,'-6:00','Active'),(194,0,'AMERICA/RESOLUTE',NULL,'-6:00','Active'),(195,0,'AMERICA/RIO_BRANCO',NULL,'-5:00','Active'),(196,0,'AMERICA/ROSARIO',NULL,'-3:00','Active'),(197,0,'AMERICA/SANTA_ISABEL',NULL,'-8:00','Active'),(198,0,'AMERICA/SANTAREM',NULL,'-4:00','Active'),(199,0,'AMERICA/SANTIAGO',NULL,'-3:00','Active'),(200,0,'AMERICA/SANTO_DOMINGO',NULL,'-4:50','Active'),(201,0,'AMERICA/SAO_PAULO',NULL,'-3:00','Active'),(202,0,'AMERICA/SCORESBYSUND',NULL,'-2:00','Active'),(203,0,'AMERICA/SHIPROCK',NULL,'-7:00','Active'),(204,0,'AMERICA/SITKA',NULL,'-8:00','Active'),(205,0,'AMERICA/ST_BARTHELEMY',NULL,'-4:00','Active'),(206,0,'AMERICA/ST_JOHNS',NULL,'-3:50','Active'),(207,0,'AMERICA/ST_KITTS',NULL,'-4:00','Active'),(208,0,'AMERICA/ST_LUCIA',NULL,'-4:00','Active'),(209,0,'AMERICA/ST_THOMAS',NULL,'-4:00','Active'),(210,0,'AMERICA/ST_VINCENT',NULL,'-4:00','Active'),(211,0,'AMERICA/SWIFT_CURRENT',NULL,'-7:00','Active'),(212,0,'AMERICA/TEGUCIGALPA',NULL,'-6:00','Active'),(213,0,'AMERICA/THULE',NULL,'-4:00','Active'),(214,0,'AMERICA/THUNDER_BAY',NULL,'-5:00','Active'),(215,0,'AMERICA/TIJUANA',NULL,'-8:00','Active'),(216,0,'AMERICA/TORONTO',NULL,'-5:00','Active'),(217,0,'AMERICA/TORTOLA',NULL,'-4:00','Active'),(218,0,'AMERICA/VANCOUVER',NULL,'-8:00','Active'),(219,0,'AMERICA/VIRGIN',NULL,'-4:00','Active'),(220,0,'AMERICA/WHITEHORSE',NULL,'-8:00','Active'),(221,0,'AMERICA/WINNIPEG',NULL,'-6:00','Active'),(222,0,'AMERICA/YAKUTAT',NULL,'-9:00','Active'),(223,0,'AMERICA/YELLOWKNIFE',NULL,'-7:00','Active'),(224,0,'ANTARCTICA/CASEY',NULL,'+8:00','Active'),(225,0,'ANTARCTICA/DAVIS',NULL,'+7:00','Active'),(226,0,'ANTARCTICA/DUMONTDURVILLE',NULL,'+10:00','Active'),(227,0,'ANTARCTICA/MACQUARIE',NULL,'+11:00','Active'),(228,0,'ANTARCTICA/MAWSON',NULL,'+6:00','Active'),(229,0,'ANTARCTICA/MCMURDO',NULL,'+12:00','Active'),(230,0,'ANTARCTICA/PALMER',NULL,'-3:00','Active'),(231,0,'ANTARCTICA/ROTHERA',NULL,'+0:00','Active'),(232,0,'ANTARCTICA/SOUTH_POLE',NULL,'+12:00','Active'),(233,0,'ANTARCTICA/SYOWA',NULL,'+3:00','Active'),(234,0,'ANTARCTICA/VOSTOK',NULL,'+6:00','Active'),(235,0,'ARCTIC/LONGYEARBYEN',NULL,'+1:00','Active'),(236,0,'ASIA/ADEN',NULL,'+3:00','Active'),(237,0,'ASIA/ALMATY',NULL,'+6:00','Active'),(238,0,'ASIA/AMMAN',NULL,'+2:00','Active'),(239,0,'ASIA/ANADYR',NULL,'+13:00','Active'),(240,0,'ASIA/AQTAU',NULL,'+5:00','Active'),(241,0,'ASIA/AQTOBE',NULL,'+5:00','Active'),(242,0,'ASIA/ASHGABAT',NULL,'+5:00','Active'),(243,0,'ASIA/ASHKHABAD',NULL,'+5:00','Active'),(244,0,'ASIA/BAGHDAD',NULL,'+3:00','Active'),(245,0,'ASIA/BAHRAIN',NULL,'+4:00','Active'),(246,0,'ASIA/BAKU',NULL,'+4:00','Active'),(247,0,'ASIA/BANGKOK',NULL,'+7:00','Active'),(248,0,'ASIA/BEIRUT',NULL,'+2:00','Active'),(249,0,'ASIA/BISHKEK',NULL,'+6:00','Active'),(250,0,'ASIA/BRUNEI',NULL,'+8:00','Active'),(251,0,'ASIA/CALCUTTA',NULL,'+5:50','Active'),(252,0,'ASIA/CHOIBALSAN',NULL,'+7:00','Active'),(253,0,'ASIA/CHONGQING',NULL,'+7:00','Active'),(254,0,'ASIA/CHUNGKING',NULL,'+7:00','Active'),(255,0,'ASIA/COLOMBO',NULL,'+5:50','Active'),(256,0,'ASIA/DACCA',NULL,'+6:00','Active'),(257,0,'ASIA/DAMASCUS',NULL,'+2:00','Active'),(258,0,'ASIA/DHAKA',NULL,'+6:00','Active'),(259,0,'ASIA/DILI',NULL,'+9:00','Active'),(260,0,'ASIA/DUBAI',NULL,'+4:00','Active'),(261,0,'ASIA/DUSHANBE',NULL,'+6:00','Active'),(262,0,'ASIA/GAZA',NULL,'+2:00','Active'),(263,0,'ASIA/HARBIN',NULL,'+8:50','Active'),(264,0,'ASIA/HEBRON',NULL,'+2:00','Active'),(265,0,'ASIA/HO_CHI_MINH',NULL,'+7:00','Active'),(266,0,'ASIA/HONG_KONG',NULL,'+8:00','Active'),(267,0,'ASIA/HOVD',NULL,'+6:00','Active'),(268,0,'ASIA/IRKUTSK',NULL,'+8:00','Active'),(269,0,'ASIA/ISTANBUL',NULL,'+2:00','Active'),(270,0,'ASIA/JAKARTA',NULL,'+7:00','Active'),(271,0,'ASIA/JAYAPURA',NULL,'+9:00','Active'),(272,0,'ASIA/JERUSALEM',NULL,'+2:00','Active'),(273,0,'ASIA/KABUL',NULL,'+4:50','Active'),(274,0,'ASIA/KAMCHATKA',NULL,'+12:00','Active'),(275,0,'ASIA/KARACHI',NULL,'+5:00','Active'),(276,0,'ASIA/KASHGAR',NULL,'+5:00','Active'),(277,0,'ASIA/KATHMANDU',NULL,'+5:50','Active'),(278,0,'ASIA/KATMANDU',NULL,'+5:50','Active'),(279,0,'ASIA/KHANDYGA',NULL,'+9:00','Active'),(280,0,'ASIA/KOLKATA',NULL,'+5:50','Active'),(281,0,'ASIA/KRASNOYARSK',NULL,'+7:00','Active'),(282,0,'ASIA/KUALA_LUMPUR',NULL,'+7:50','Active'),(283,0,'ASIA/KUCHING',NULL,'+8:00','Active'),(284,0,'ASIA/KUWAIT',NULL,'+3:00','Active'),(285,0,'ASIA/MACAO',NULL,'+8:00','Active'),(286,0,'ASIA/MACAU',NULL,'+8:00','Active'),(287,0,'ASIA/MAGADAN',NULL,'+11:00','Active'),(288,0,'ASIA/MAKASSAR',NULL,'+8:00','Active'),(289,0,'ASIA/MANILA',NULL,'+8:00','Active'),(290,0,'ASIA/MUSCAT',NULL,'+4:00','Active'),(291,0,'ASIA/NICOSIA',NULL,'+2:00','Active'),(292,0,'ASIA/NOVOKUZNETSK',NULL,'+7:00','Active'),(293,0,'ASIA/NOVOSIBIRSK',NULL,'+7:00','Active'),(294,0,'ASIA/OMSK',NULL,'+6:00','Active'),(295,0,'ASIA/ORAL',NULL,'+5:00','Active'),(296,0,'ASIA/PHNOM_PENH',NULL,'+7:00','Active'),(297,0,'ASIA/PONTIANAK',NULL,'+8:00','Active'),(298,0,'ASIA/PYONGYANG',NULL,'+9:00','Active'),(299,0,'ASIA/QATAR',NULL,'+4:00','Active'),(300,0,'ASIA/QYZYLORDA',NULL,'+5:00','Active'),(301,0,'ASIA/RANGOON',NULL,'+6:50','Active'),(302,0,'ASIA/RIYADH',NULL,'+3:00','Active'),(303,0,'ASIA/RIYADH87',NULL,'+3:12','Active'),(304,0,'ASIA/RIYADH88',NULL,'+3:12','Active'),(305,0,'ASIA/RIYADH89',NULL,'+3:12','Active'),(306,0,'ASIA/SAIGON',NULL,'+7:00','Active'),(307,0,'ASIA/SAKHALIN',NULL,'+11:00','Active'),(308,0,'ASIA/SAMARKAND',NULL,'+5:00','Active'),(309,0,'ASIA/SEOUL',NULL,'+9:00','Active'),(310,0,'ASIA/SHANGHAI',NULL,'+8:00','Active'),(311,0,'ASIA/SINGAPORE',NULL,'+7:50','Active'),(312,0,'ASIA/TAIPEI',NULL,'+8:00','Active'),(313,0,'ASIA/TASHKENT',NULL,'+6:00','Active'),(314,0,'ASIA/TBILISI',NULL,'+4:00','Active'),(315,0,'ASIA/TEHRAN',NULL,'+3:50','Active'),(316,0,'ASIA/TEL_AVIV',NULL,'+2:00','Active'),(317,0,'ASIA/THIMBU',NULL,'+5:50','Active'),(318,0,'ASIA/THIMPHU',NULL,'+5:50','Active'),(319,0,'ASIA/TOKYO',NULL,'+9:00','Active'),(320,0,'ASIA/UJUNG_PANDANG',NULL,'+8:00','Active'),(321,0,'ASIA/ULAANBAATAR',NULL,'+7:00','Active'),(322,0,'ASIA/ULAN_BATOR',NULL,'+7:00','Active'),(323,0,'ASIA/URUMQI',NULL,'+6:00','Active'),(324,0,'ASIA/UST-NERA',NULL,'+9:00','Active'),(325,0,'ASIA/VIENTIANE',NULL,'+7:00','Active'),(326,0,'ASIA/VLADIVOSTOK',NULL,'+10:00','Active'),(327,0,'ASIA/YAKUTSK',NULL,'+9:00','Active'),(328,0,'ASIA/YEKATERINBURG',NULL,'+5:00','Active'),(329,0,'ASIA/YEREVAN',NULL,'+4:00','Active'),(330,0,'ATLANTIC/AZORES',NULL,'-1:00','Active'),(331,0,'ATLANTIC/BERMUDA',NULL,'-4:00','Active'),(332,0,'ATLANTIC/CANARY',NULL,'+0:00','Active'),(333,0,'ATLANTIC/CAPE_VERDE',NULL,'-2:00','Active'),(334,0,'ATLANTIC/FAEROE',NULL,'+0:00','Active'),(335,0,'ATLANTIC/FAROE',NULL,'+0:00','Active'),(336,0,'ATLANTIC/JAN_MAYEN',NULL,'+1:00','Active'),(337,0,'ATLANTIC/MADEIRA',NULL,'+0:00','Active'),(338,0,'ATLANTIC/REYKJAVIK',NULL,'+0:00','Active'),(339,0,'ATLANTIC/SOUTH_GEORGIA',NULL,'-2:00','Active'),(340,0,'ATLANTIC/ST_HELENA',NULL,'+0:00','Active'),(341,0,'ATLANTIC/STANLEY',NULL,'-4:00','Active'),(342,0,'AUSTRALIA/ACT',NULL,'+10:00','Active'),(343,0,'AUSTRALIA/ADELAIDE',NULL,'+9:50','Active'),(344,0,'AUSTRALIA/BRISBANE',NULL,'+10:00','Active'),(345,0,'AUSTRALIA/BROKEN_HILL',NULL,'+9:50','Active'),(346,0,'AUSTRALIA/CANBERRA',NULL,'+10:00','Active'),(347,0,'AUSTRALIA/CURRIE',NULL,'+10:00','Active'),(348,0,'AUSTRALIA/DARWIN',NULL,'+9:50','Active'),(349,0,'AUSTRALIA/EUCLA',NULL,'+8:75','Active'),(350,0,'AUSTRALIA/HOBART',NULL,'+11:00','Active'),(351,0,'AUSTRALIA/LHI',NULL,'+10:00','Active'),(352,0,'AUSTRALIA/LINDEMAN',NULL,'+10:00','Active'),(353,0,'AUSTRALIA/LORD_HOWE',NULL,'+10:00','Active'),(354,0,'AUSTRALIA/MELBOURNE',NULL,'+10:00','Active'),(355,0,'AUSTRALIA/NSW',NULL,'+10:00','Active'),(356,0,'AUSTRALIA/NORTH',NULL,'+9:50','Active'),(357,0,'AUSTRALIA/PERTH',NULL,'+8:00','Active'),(358,0,'AUSTRALIA/QUEENSLAND',NULL,'+10:00','Active'),(359,0,'AUSTRALIA/SOUTH',NULL,'+9:50','Active'),(360,0,'AUSTRALIA/SYDNEY',NULL,'+10:00','Active'),(361,0,'AUSTRALIA/TASMANIA',NULL,'+11:00','Active'),(362,0,'AUSTRALIA/VICTORIA',NULL,'+10:00','Active'),(363,0,'AUSTRALIA/WEST',NULL,'+8:00','Active'),(364,0,'AUSTRALIA/YANCOWINNA',NULL,'+9:50','Active'),(365,0,'BET',NULL,'-3:00','Active'),(366,0,'BST',NULL,'+6:00','Active'),(367,0,'BRAZIL/ACRE',NULL,'-5:00','Active'),(368,0,'BRAZIL/DENORONHA',NULL,'-2:00','Active'),(369,0,'BRAZIL/EAST',NULL,'-3:00','Active'),(370,0,'BRAZIL/WEST',NULL,'-4:00','Active'),(371,0,'CAT',NULL,'+2:00','Active'),(372,0,'CET',NULL,'+1:00','Active'),(373,0,'CNT',NULL,'-3:50','Active'),(374,0,'CST',NULL,'-6:00','Active'),(375,0,'CST6CDT',NULL,'-6:00','Active'),(376,0,'CTT',NULL,'+8:00','Active'),(377,0,'CANADA/ATLANTIC',NULL,'-4:00','Active'),(378,0,'CANADA/CENTRAL',NULL,'-6:00','Active'),(379,0,'CANADA/EAST-SASKATCHEWAN',NULL,'-6:00','Active'),(380,0,'CANADA/EASTERN',NULL,'-5:00','Active'),(381,0,'CANADA/MOUNTAIN',NULL,'-7:00','Active'),(382,0,'CANADA/NEWFOUNDLAND',NULL,'-3:50','Active'),(383,0,'CANADA/PACIFIC',NULL,'-8:00','Active'),(384,0,'CANADA/SASKATCHEWAN',NULL,'-6:00','Active'),(385,0,'CANADA/YUKON',NULL,'-8:00','Active'),(386,0,'CHILE/CONTINENTAL',NULL,'-3:00','Active'),(387,0,'CHILE/EASTERISLAND',NULL,'-6:00','Active'),(388,0,'CUBA',NULL,'-5:00','Active'),(389,0,'EAT',NULL,'+3:00','Active'),(390,0,'ECT',NULL,'+1:00','Active'),(391,0,'EET',NULL,'+2:00','Active'),(392,0,'EST',NULL,'-5:00','Active'),(393,0,'EST5EDT',NULL,'-5:00','Active'),(394,0,'EGYPT',NULL,'+2:00','Active'),(395,0,'EIRE',NULL,'+1:00','Active'),(396,0,'ETC/GMT',NULL,'+0:00','Active'),(397,0,'ETC/GMT+0',NULL,'+0:00','Active'),(398,0,'ETC/GMT+1',NULL,'-1:00','Active'),(399,0,'ETC/GMT+10',NULL,'-10:00','Active'),(400,0,'ETC/GMT+11',NULL,'-11:00','Active'),(401,0,'ETC/GMT+12',NULL,'-12:00','Active'),(402,0,'ETC/GMT+2',NULL,'-2:00','Active'),(403,0,'ETC/GMT+3',NULL,'-3:00','Active'),(404,0,'ETC/GMT+4',NULL,'-4:00','Active'),(405,0,'ETC/GMT+5',NULL,'-5:00','Active'),(406,0,'ETC/GMT+6',NULL,'-6:00','Active'),(407,0,'ETC/GMT+7',NULL,'-7:00','Active'),(408,0,'ETC/GMT+8',NULL,'-8:00','Active'),(409,0,'ETC/GMT+9',NULL,'-9:00','Active'),(410,0,'ETC/GMT-0',NULL,'+0:00','Active'),(411,0,'ETC/GMT-1',NULL,'+1:00','Active'),(412,0,'ETC/GMT-10',NULL,'+10:00','Active'),(413,0,'ETC/GMT-11',NULL,'+11:00','Active'),(414,0,'ETC/GMT-12',NULL,'+12:00','Active'),(415,0,'ETC/GMT-13',NULL,'+13:00','Active'),(416,0,'ETC/GMT-14',NULL,'+14:00','Active'),(417,0,'ETC/GMT-2',NULL,'+2:00','Active'),(418,0,'ETC/GMT-3',NULL,'+3:00','Active'),(419,0,'ETC/GMT-4',NULL,'+4:00','Active'),(420,0,'ETC/GMT-5',NULL,'+5:00','Active'),(421,0,'ETC/GMT-6',NULL,'+6:00','Active'),(422,0,'ETC/GMT-7',NULL,'+7:00','Active'),(423,0,'ETC/GMT-8',NULL,'+8:00','Active'),(424,0,'ETC/GMT-9',NULL,'+9:00','Active'),(425,0,'ETC/GMT0',NULL,'+0:00','Active'),(426,0,'ETC/GREENWICH',NULL,'+0:00','Active'),(427,0,'ETC/UCT',NULL,'+0:00','Active'),(428,0,'ETC/UTC',NULL,'+0:00','Active'),(429,0,'ETC/UNIVERSAL',NULL,'+0:00','Active'),(430,0,'ETC/ZULU',NULL,'+0:00','Active'),(431,0,'EUROPE/AMSTERDAM',NULL,'+1:00','Active'),(432,0,'EUROPE/ANDORRA',NULL,'+1:00','Active'),(433,0,'EUROPE/ATHENS',NULL,'+2:00','Active'),(434,0,'EUROPE/BELFAST',NULL,'+1:00','Active'),(435,0,'EUROPE/BELGRADE',NULL,'+1:00','Active'),(436,0,'EUROPE/BERLIN',NULL,'+1:00','Active'),(437,0,'EUROPE/BRATISLAVA',NULL,'+1:00','Active'),(438,0,'EUROPE/BRUSSELS',NULL,'+1:00','Active'),(439,0,'EUROPE/BUCHAREST',NULL,'+2:00','Active'),(440,0,'EUROPE/BUDAPEST',NULL,'+1:00','Active'),(441,0,'EUROPE/BUSINGEN',NULL,'+1:00','Active'),(442,0,'EUROPE/CHISINAU',NULL,'+3:00','Active'),(443,0,'EUROPE/COPENHAGEN',NULL,'+1:00','Active'),(444,0,'EUROPE/DUBLIN',NULL,'+1:00','Active'),(445,0,'EUROPE/GIBRALTAR',NULL,'+1:00','Active'),(446,0,'EUROPE/GUERNSEY',NULL,'+1:00','Active'),(447,0,'EUROPE/HELSINKI',NULL,'+2:00','Active'),(448,0,'EUROPE/ISLE_OF_MAN',NULL,'+1:00','Active'),(449,0,'EUROPE/ISTANBUL',NULL,'+2:00','Active'),(450,0,'EUROPE/JERSEY',NULL,'+1:00','Active'),(451,0,'EUROPE/KALININGRAD',NULL,'+3:00','Active'),(452,0,'EUROPE/KIEV',NULL,'+3:00','Active'),(453,0,'EUROPE/LISBON',NULL,'+1:00','Active'),(454,0,'EUROPE/LJUBLJANA',NULL,'+1:00','Active'),(455,0,'EUROPE/LONDON',NULL,'+1:00','Active'),(456,0,'EUROPE/LUXEMBOURG',NULL,'+1:00','Active'),(457,0,'EUROPE/MADRID',NULL,'+1:00','Active'),(458,0,'EUROPE/MALTA',NULL,'+1:00','Active'),(459,0,'EUROPE/MARIEHAMN',NULL,'+2:00','Active'),(460,0,'EUROPE/MINSK',NULL,'+3:00','Active'),(461,0,'EUROPE/MONACO',NULL,'+1:00','Active'),(462,0,'EUROPE/MOSCOW',NULL,'+3:00','Active'),(463,0,'EUROPE/NICOSIA',NULL,'+2:00','Active'),(464,0,'EUROPE/OSLO',NULL,'+1:00','Active'),(465,0,'EUROPE/PARIS',NULL,'+1:00','Active'),(466,0,'EUROPE/PODGORICA',NULL,'+1:00','Active'),(467,0,'EUROPE/PRAGUE',NULL,'+1:00','Active'),(468,0,'EUROPE/RIGA',NULL,'+3:00','Active'),(469,0,'EUROPE/ROME',NULL,'+1:00','Active'),(470,0,'EUROPE/SAMARA',NULL,'+4:00','Active'),(471,0,'EUROPE/SAN_MARINO',NULL,'+1:00','Active'),(472,0,'EUROPE/SARAJEVO',NULL,'+1:00','Active'),(473,0,'EUROPE/SIMFEROPOL',NULL,'+3:00','Active'),(474,0,'EUROPE/SKOPJE',NULL,'+1:00','Active'),(475,0,'EUROPE/SOFIA',NULL,'+2:00','Active'),(476,0,'EUROPE/STOCKHOLM',NULL,'+1:00','Active'),(477,0,'EUROPE/TALLINN',NULL,'+3:00','Active'),(478,0,'EUROPE/TIRANE',NULL,'+1:00','Active'),(479,0,'EUROPE/TIRASPOL',NULL,'+3:00','Active'),(480,0,'EUROPE/UZHGOROD',NULL,'+3:00','Active'),(481,0,'EUROPE/VADUZ',NULL,'+1:00','Active'),(482,0,'EUROPE/VATICAN',NULL,'+1:00','Active'),(483,0,'EUROPE/VIENNA',NULL,'+1:00','Active'),(484,0,'EUROPE/VILNIUS',NULL,'+3:00','Active'),(485,0,'EUROPE/VOLGOGRAD',NULL,'+4:00','Active'),(486,0,'EUROPE/WARSAW',NULL,'+1:00','Active'),(487,0,'EUROPE/ZAGREB',NULL,'+1:00','Active'),(488,0,'EUROPE/ZAPOROZHYE',NULL,'+3:00','Active'),(489,0,'EUROPE/ZURICH',NULL,'+1:00','Active'),(490,0,'GB',NULL,'+1:00','Active'),(491,0,'GB-EIRE',NULL,'+1:00','Active'),(492,0,'GMT',NULL,'+0:00','Active'),(493,0,'GMT0',NULL,'+0:00','Active'),(494,0,'GREENWICH',NULL,'+0:00','Active'),(495,0,'HST',NULL,'-10:00','Active'),(496,0,'HONGKONG',NULL,'+8:00','Active'),(497,0,'IET',NULL,'-5:00','Active'),(498,0,'IST',NULL,'+5:50','Active'),(499,0,'ICELAND',NULL,'+0:00','Active'),(500,0,'INDIAN/ANTANANARIVO',NULL,'+3:00','Active'),(501,0,'INDIAN/CHAGOS',NULL,'+5:00','Active'),(502,0,'INDIAN/CHRISTMAS',NULL,'+7:00','Active'),(503,0,'INDIAN/COCOS',NULL,'+6:50','Active'),(504,0,'INDIAN/COMORO',NULL,'+3:00','Active'),(505,0,'INDIAN/KERGUELEN',NULL,'+5:00','Active'),(506,0,'INDIAN/MAHE',NULL,'+4:00','Active'),(507,0,'INDIAN/MALDIVES',NULL,'+5:00','Active'),(508,0,'INDIAN/MAURITIUS',NULL,'+4:00','Active'),(509,0,'INDIAN/MAYOTTE',NULL,'+3:00','Active'),(510,0,'INDIAN/REUNION',NULL,'+4:00','Active'),(511,0,'IRAN',NULL,'+3:50','Active'),(512,0,'ISRAEL',NULL,'+2:00','Active'),(513,0,'JST',NULL,'+9:00','Active'),(514,0,'JAMAICA',NULL,'-5:00','Active'),(515,0,'JAPAN',NULL,'+9:00','Active'),(516,0,'KWAJALEIN',NULL,'-12:00','Active'),(517,0,'LIBYA',NULL,'+2:00','Active'),(518,0,'MET',NULL,'+1:00','Active'),(519,0,'MIT',NULL,'-11:00','Active'),(520,0,'MST',NULL,'-7:00','Active'),(521,0,'MST7MDT',NULL,'-7:00','Active'),(522,0,'MEXICO/BAJANORTE',NULL,'-8:00','Active'),(523,0,'MEXICO/BAJASUR',NULL,'-8:00','Active'),(524,0,'MEXICO/GENERAL',NULL,'-6:00','Active'),(525,0,'MIDEAST/RIYADH87',NULL,'+3:12','Active'),(526,0,'MIDEAST/RIYADH88',NULL,'+3:12','Active'),(527,0,'MIDEAST/RIYADH89',NULL,'+3:12','Active'),(528,0,'NET',NULL,'+4:00','Active'),(529,0,'NST',NULL,'+12:00','Active'),(530,0,'NZ',NULL,'+12:00','Active'),(531,0,'NZ-CHAT',NULL,'+12:75','Active'),(532,0,'NAVAJO',NULL,'-7:00','Active'),(533,0,'PLT',NULL,'+5:00','Active'),(534,0,'PNT',NULL,'-7:00','Active'),(535,0,'PRC',NULL,'+8:00','Active'),(536,0,'PRT',NULL,'-4:00','Active'),(537,0,'PST',NULL,'-8:00','Active'),(538,0,'PST8PDT',NULL,'-8:00','Active'),(539,0,'PACIFIC/APIA',NULL,'-11:00','Active'),(540,0,'PACIFIC/AUCKLAND',NULL,'+12:00','Active'),(541,0,'PACIFIC/CHATHAM',NULL,'+12:75','Active'),(542,0,'PACIFIC/CHUUK',NULL,'+10:00','Active'),(543,0,'PACIFIC/EASTER',NULL,'-6:00','Active'),(544,0,'PACIFIC/EFATE',NULL,'+11:00','Active'),(545,0,'PACIFIC/ENDERBURY',NULL,'-12:00','Active'),(546,0,'PACIFIC/FAKAOFO',NULL,'-11:00','Active'),(547,0,'PACIFIC/FIJI',NULL,'+12:00','Active'),(548,0,'PACIFIC/FUNAFUTI',NULL,'+12:00','Active'),(549,0,'PACIFIC/GALAPAGOS',NULL,'-5:00','Active'),(550,0,'PACIFIC/GAMBIER',NULL,'-9:00','Active'),(551,0,'PACIFIC/GUADALCANAL',NULL,'+11:00','Active'),(552,0,'PACIFIC/GUAM',NULL,'+10:00','Active'),(553,0,'PACIFIC/HONOLULU',NULL,'-10:00','Active'),(554,0,'PACIFIC/JOHNSTON',NULL,'-10:00','Active'),(555,0,'PACIFIC/KIRITIMATI',NULL,'-10:67','Active'),(556,0,'PACIFIC/KOSRAE',NULL,'+12:00','Active'),(557,0,'PACIFIC/KWAJALEIN',NULL,'-12:00','Active'),(558,0,'PACIFIC/MAJURO',NULL,'+12:00','Active'),(559,0,'PACIFIC/MARQUESAS',NULL,'-9:50','Active'),(560,0,'PACIFIC/MIDWAY',NULL,'-11:00','Active'),(561,0,'PACIFIC/NAURU',NULL,'+11:50','Active'),(562,0,'PACIFIC/NIUE',NULL,'-11:50','Active'),(563,0,'PACIFIC/NORFOLK',NULL,'+11:50','Active'),(564,0,'PACIFIC/NOUMEA',NULL,'+11:00','Active'),(565,0,'PACIFIC/PAGO_PAGO',NULL,'-11:00','Active'),(566,0,'PACIFIC/PALAU',NULL,'+9:00','Active'),(567,0,'PACIFIC/PITCAIRN',NULL,'-8:50','Active'),(568,0,'PACIFIC/POHNPEI',NULL,'+11:00','Active'),(569,0,'PACIFIC/PONAPE',NULL,'+11:00','Active'),(570,0,'PACIFIC/PORT_MORESBY',NULL,'+10:00','Active'),(571,0,'PACIFIC/RAROTONGA',NULL,'-10:50','Active'),(572,0,'PACIFIC/SAIPAN',NULL,'+10:00','Active'),(573,0,'PACIFIC/SAMOA',NULL,'-11:00','Active'),(574,0,'PACIFIC/TAHITI',NULL,'-10:00','Active'),(575,0,'PACIFIC/TARAWA',NULL,'+12:00','Active'),(576,0,'PACIFIC/TONGATAPU',NULL,'+13:00','Active'),(577,0,'PACIFIC/TRUK',NULL,'+10:00','Active'),(578,0,'PACIFIC/WAKE',NULL,'+12:00','Active'),(579,0,'PACIFIC/WALLIS',NULL,'+12:00','Active'),(580,0,'PACIFIC/YAP',NULL,'+10:00','Active'),(581,0,'POLAND',NULL,'+1:00','Active'),(582,0,'PORTUGAL',NULL,'+1:00','Active'),(583,0,'ROK',NULL,'+9:00','Active'),(584,0,'SST',NULL,'+11:00','Active'),(585,0,'SINGAPORE',NULL,'+7:50','Active'),(586,0,'TURKEY',NULL,'+2:00','Active'),(587,0,'UCT',NULL,'+0:00','Active'),(588,0,'US/ALASKA',NULL,'-10:00','Active'),(589,0,'US/ALEUTIAN',NULL,'-11:00','Active'),(590,0,'US/ARIZONA',NULL,'-7:00','Active'),(591,0,'US/CENTRAL',NULL,'-6:00','Active'),(592,0,'US/EAST-INDIANA',NULL,'-5:00','Active'),(593,0,'US/EASTERN',NULL,'-5:00','Active'),(594,0,'US/HAWAII',NULL,'-10:00','Active'),(595,0,'US/INDIANA-STARKE',NULL,'-6:00','Active'),(596,0,'US/MICHIGAN',NULL,'-5:00','Active'),(597,0,'US/MOUNTAIN',NULL,'-7:00','Active'),(598,0,'US/PACIFIC',NULL,'-8:00','Active'),(599,0,'US/PACIFIC-NEW',NULL,'-8:00','Active'),(600,0,'US/SAMOA',NULL,'-11:00','Active'),(601,0,'UTC',NULL,'+0:00','Active'),(602,0,'UNIVERSAL',NULL,'+0:00','Active'),(603,0,'VST',NULL,'+7:00','Active'),(604,0,'W-SU',NULL,'+3:00','Active'),(605,0,'WET',NULL,'+0:00','Active'),(606,0,'ZULU',NULL,'+0:00','Active');
/*!40000 ALTER TABLE `timezones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-10 10:36:03
