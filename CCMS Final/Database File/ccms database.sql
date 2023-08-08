-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: ccms
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `Admin_No` int NOT NULL AUTO_INCREMENT,
  `Admin_Id` varchar(20) DEFAULT NULL,
  `Admin_Name` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `Contact` varchar(45) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Admin_No`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'AD1','Aditi Narkar','aditinarkar@gmail.com','111','1234567890',20,'logo1.jpg'),(2,'AD2','Aditya Kachare','adityakachare121@gmail.com','111','1234567890',21,NULL),(3,'AD3','Aryan Mishra','aryan@gmail.com','tuf09','2222222222',25,NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenge`
--

DROP TABLE IF EXISTS `challenge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenge` (
  `Challenge_No` int NOT NULL AUTO_INCREMENT,
  `Challenge_Id` varchar(20) DEFAULT NULL,
  `ch_club` varchar(30) DEFAULT NULL,
  `opp_club` varchar(30) DEFAULT NULL,
  `Venue_id` varchar(30) DEFAULT NULL,
  `Challenge_Date` varchar(45) DEFAULT NULL,
  `Challenge_Time` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `match_status` varchar(45) DEFAULT NULL,
  `exclude_from_team` varchar(255) DEFAULT ' ',
  `include_from_mem` varchar(255) DEFAULT ' ',
  PRIMARY KEY (`Challenge_No`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenge`
--

LOCK TABLES `challenge` WRITE;
/*!40000 ALTER TABLE `challenge` DISABLE KEYS */;
INSERT INTO `challenge` VALUES (146,'CLN146','CL1','CL2','VN1','Sun, Feb 20 2022','7:00 pm','Approved','Finished',' ',' '),(147,'CLN147','CL1','CL2','VN1','Wed, Feb 23 2022','4:00 pm','Approved','Finished',' ',' '),(148,'CLN148','CL1','CL2','VN1','Fri, Feb 25 2022','4:00 pm','Unapproved','Finished',' ',' '),(149,'CLN149','CL1','CL2','VN1','Sun, Feb 20 2022','7:00 am','Unapproved','Finished',' ',' '),(150,'CLN150','CL2','CL1','VN2','Tue, Feb 22 2022','4:00 pm','Approved','Finished',' ',' '),(151,'CLN151','CL2','CL1','VN2','Sun, Feb 27 2022','4:00 pm','Unapproved','Finished',' ',' '),(171,'CLN171','CL1','CL2','VN1','Thu, Mar 17 2022','5:00 AM','Approved','Finished',' ',' '),(172,'CLN172','CL1','CL2','VN1','Thu, Mar 31 2022','5:00 AM','Approved','Finished',' ',' '),(173,'CLN173','CL2','CL1','VN2','Sun, Mar 27 2022','9:00 AM','Approved','Finished',' ',' '),(174,'CLN174','CL2','CL1','VN2','Sat, Mar 05 2022','6:00 AM','Approved','Finished',' ',' '),(175,'CLN175','CL1','CL2','VN1','Wed, Mar 16 2022','5:00 AM','Approved','Finished',' MEM145 MEM146',' MEM128 MEM132 MEM144'),(176,'CLN176','CL1','CL2','VN1','Tue, Mar 15 2022','5:00 AM','Approved','Finished',' MEM144 MEM145 MEM146',' MEM124 MEM128 MEM132'),(177,'CLN177','CL1','CL2','VN1','Wed, Mar 23 2022','5:00 AM','Approved','Finished',' MEM128 MEM134 MEM146',' MEM124 MEM133 MEM145'),(178,'CLN178','CL2','CL1','VN2','Tue, Mar 22 2022','9:00 AM','Approved','Finished',' MEM134 MEM144 MEM146',' MEM124 MEM133 MEM145'),(179,'CLN179','CL2','CL1','VN2','Fri, Mar 11 2022','6:00 AM','Approved','Finished',' MEM144 MEM145 MEM146',' MEM124 MEM133 MEM134'),(180,'CLN180','CL1','CL2','VN1','Mon, Mar 21 2022','5:00 AM','Approved','Finished',' MEM128 MEM132',' MEM124 MEM133 MEM134 MEM136 MEM146'),(183,'CLN183','CL2','CL1','VN2','Sat, Apr 30 2022','4:00 pm','Approved','Finished',' MEM125',' MEM128'),(184,'CLN184','CL1','CL2','VN1','Sat, Apr 30 2022','9:00 am','Approved','Finished',' MEM125',' MEM128'),(185,'CLN185','CL1','CL2','VN1','Sat, Apr 30 2022','4:00 am','Approved','Finished','',''),(186,'CLN186','CL1','CL2','VN1','Mon, May 02 2022','6:00 am','Approved','Finished','',''),(187,'CLN187','CL1','CL2','VN1','Wed, May 04 2022','6:00 am','Approved','Finished','',''),(188,'CLN188','CL1','CL2','VN1','Sun, May 01 2022','4:00 pm','Approved','Finished','',' MEM128'),(189,'CLN189','CL2','CL1','VN2','Fri, May 06 2022','9:00 pm','Approved','Finished','',''),(190,'CLN190','CL2','CL1','VN2','Fri, May 06 2022','6:00 am','Approved','Finished','','  MEM128'),(191,'CLN191','CL1','CL2','VN1','Sun, May 01 2022','4:04 pm','Approved','Finished','',''),(192,'CLN192','CL1','CL2','VN1','Sun, May 01 2022','12:45 pm','Approved','Finished','','  MEM128'),(193,'CLN193','CL2','CL1','VN2','Tue, May 03 2022','5:00 am','Approved','Finished',' MEM125',' MEM128 MEM125'),(194,'CLN194','CL2','CL1','VN2','Mon, May 09 2022','4:00 pm','Approved','Finished','',' MEM125 MEM134'),(195,'CLN195','CL2','CL1','VN2','Sat, May 21 2022','4:00 pm','Approved','Finished',' MEM125',' MEM128 MEM157'),(196,'CLN196','CL1','CL2','VN1','Sat, May 21 2022','7:00 am','Approved','Finished',' MEM125 MEM128',' MEM157 MEM133'),(197,'CLN197','CL2','CL1','VN2','Sat, May 28 2022','7:00 am','Approved','Finished',' MEM128',' MEM157 MEM159 MEM133'),(198,'CLN198','CL2','CL1','VN2','Thu, Jun 02 2022','4:00 pm','Approved','Ongoing',' MEM125',' MEM159 MEM128'),(199,'CLN199','CL2','CL1','VN2','Fri, Jun 03 2022','4:00 pm','Approved','Ongoing',' MEM125 MEM130',' MEM134 MEM159 MEM133');
/*!40000 ALTER TABLE `challenge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clubs`
--

DROP TABLE IF EXISTS `clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clubs` (
  `Club_No` int NOT NULL AUTO_INCREMENT,
  `Club_Id` varchar(45) DEFAULT NULL,
  `Club_Name` varchar(45) DEFAULT NULL,
  `Venue_Id` varchar(30) DEFAULT NULL,
  `club_desc` varchar(255) DEFAULT NULL,
  `Max_capacity` int DEFAULT NULL,
  `Status` varchar(45) DEFAULT 'Pending',
  `Image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Club_No`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubs`
--

LOCK TABLES `clubs` WRITE;
/*!40000 ALTER TABLE `clubs` DISABLE KEYS */;
INSERT INTO `clubs` VALUES (1,'CL1','Spartan Strikers','VN1','The Spartan Strikers are a franchise cricket Club Founded in 2015. They play in Various Cricket Leagues. The team is owned by Spartan Strikers Ltd. This Club has made a record of giving target of 248 runs in 20 over matches.',50,'Approved','ss.png'),(2,'CL2','Thunder Wolves','VN2','Thunder Wolves are a franchise cricket Club Founded in 2015. The team is owned by Thunder Wolves Ltd. They have won the most Sportify Cricket Club Leagues Matches.',50,'Approved','w.png'),(3,'CL3','SuperNovas','VN3','The Supernovas are a franchise cricket Club Founded in 2015. They play in Various Cricket Leagues. The team is owned by Supernovas Ltd.',50,'Approved','sn1.png'),(4,'CL4','Game Swingers','VN4','The Game Swingers are a franchise cricket Club Founded in 2015. They play in Various Cricket Leagues. The team is owned by Game Swingers Ltd. They are the current defending champions.',50,'Approved','sp1.png'),(27,'CL27','Warriors','VN34','The warriors are a franchise cricket Club Founded in 2015. They play in Various Cricket Leagues. The team is owned by Game Swingers Ltd. They are the current defending champions.',15,'Approved','club1.png'),(39,'CL39','MI','VN44','Mmbai Indians',30,'Approved','club1 (2).png'),(40,'CL40','Rising Stars','VN45','Dummy Description',30,'Disapproved','q.png'),(41,'CL41','MI','VN46','Mmbai Indians',10,'Pending','a1.png'),(42,'CL42','Wizards','VN47','Dummy Description',10,'Approved','a2.png'),(43,'CL43','MI','VN48','Mmbai Indians',10,'Disapproved',NULL);
/*!40000 ALTER TABLE `clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach` (
  `Coach_No` int NOT NULL AUTO_INCREMENT,
  `Coach_Id` varchar(10) DEFAULT NULL,
  `Coach_Name` varchar(45) DEFAULT ' ',
  `Email` varchar(45) DEFAULT ' ',
  `Contact` varchar(45) DEFAULT ' ',
  `Age` int DEFAULT '0',
  `Password` varchar(20) DEFAULT ' ',
  `Profile_Picture` varchar(45) DEFAULT ' ',
  `Experience` varchar(100) DEFAULT ' ',
  `Club_Id` varchar(20) DEFAULT ' ',
  `Status` varchar(45) DEFAULT ' ',
  `Image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Coach_No`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (1,'CH1','Tufayl Dalvi','tufayldalvi@gmail.com','8452879881',18,'123','','Former Ranji Player','CL1','Head',NULL),(13,'CH13','Aditya Kachare','aditya@gmail.com','1234567890',20,'111',' ','Former Ranji Player','CL2','Head',NULL),(56,'CH56','Pranay Pawar','pranay@gmail.com','9999999999',20,'111',' ','','CL27','Head',NULL),(57,'CH57','Sahil',' ',' ',0,' ',' ',' ','CL2','Batting',NULL),(58,'CH58','XYZ',' ',' ',0,' ',' ',' ','CL27','Fielding',NULL),(59,'CH59','PQR',' ',' ',0,' ',' ',' ','CL27','Bowling',NULL),(61,'CH61','bbb',' ',' ',0,' ',' ',' ','CL1','Bowling',NULL),(62,'CH62','ccc',' ',' ',0,' ',' ',' ','CL1','Fielding',NULL),(97,'CH97','sa','ddwd','esf',22,'123',' ','dwd','CL36','Head',NULL),(98,'CH98','22',' ',' ',0,' ',' ',' ','CL36','Batting',NULL),(99,'CH99','ff',' ',' ',0,' ',' ',' ','CL36','Fielding',NULL),(100,'CH100','fff',' ',' ',0,' ',' ',' ','CL36','Bowling',NULL),(101,'CH101','Pranay Pawar','aditya123@gmail.com','9999999999',20,'111',' ','nnfcvn','CL37','Head',NULL),(102,'CH102','Sahil',' ',' ',0,' ',' ',' ','CL37','Batting',NULL),(103,'CH103','Shravan',' ',' ',0,' ',' ',' ','CL2','Fielding',NULL),(104,'CH104','Yogya',' ',' ',0,' ',' ',' ','CL37','Bowling',NULL),(105,'CH105','jjfn','dsa@gmail.com','1111111111',20,'111',' ','nnfcvn','CL38','Head',NULL),(106,'CH106','Sahil',' ',' ',0,' ',' ',' ','CL38','Batting',NULL),(107,'CH107','Pranay',' ',' ',0,' ',' ',' ','CL2','Bowling',NULL),(108,'CH108','Yogesh',' ',' ',0,' ',' ',' ','CL38','Bowling',NULL),(109,'CH109','Tufayl Dalvi','aabbcc@gmail.com','9090909090',22,'111',' ','Ranji Player','CL39','Head',NULL),(110,'CH110','abc',' ',' ',0,' ',' ',' ','CL39','Batting',NULL),(111,'CH111','abc',' ',' ',0,' ',' ',' ','CL39','Fielding',NULL),(112,'CH112','abc',' ',' ',0,' ',' ',' ','CL39','Bowling',NULL),(113,'CH113','Harsh Bhatt','harsh@gmail.com','9898230956',35,'111',' ','Former Ranji Coach','CL40','Head',NULL),(114,'CH114','Sumit Patil',' ',' ',0,' ',' ',' ','CL40','Batting',NULL),(115,'CH115','Mohit Aggarwal',' ',' ',0,' ',' ',' ','CL40','Fielding',NULL),(116,'CH116','Yogesh Parab',' ',' ',0,' ',' ',' ','CL40','Bowling',NULL),(117,'CH117','Harsh Bhatt','aabbcac@gmail.com','9090909090',20,'111',' ','Ranji Player','CL41','Head',NULL),(118,'CH118','abc',' ',' ',0,' ',' ',' ','CL41','Batting',NULL),(119,'CH119','abc',' ',' ',0,' ',' ',' ','CL41','Fielding',NULL),(120,'CH120','abc',' ',' ',0,' ',' ',' ','CL41','Bowling',NULL),(121,'CH121','Harsh Bhatt','aabbcaqc@gmail.com','9090909090',20,'111',' ','Ranji Player','CL42','Head',NULL),(122,'CH122','abc',' ',' ',0,' ',' ',' ','CL42','Batting',NULL),(123,'CH123','abc',' ',' ',0,' ',' ',' ','CL42','Fielding',NULL),(124,'CH124','abc',' ',' ',0,' ',' ',' ','CL42','Bowling',NULL),(125,'CH125','Jamie Lanister','jamie@gmail.com','9090909090',20,'111',' ','Ranji Player','CL43','Head',NULL),(126,'CH126','abc',' ',' ',0,' ',' ',' ','CL43','Batting',NULL),(127,'CH127','abc',' ',' ',0,' ',' ',' ','CL43','Fielding',NULL),(128,'CH128','abc',' ',' ',0,' ',' ',' ','CL43','Bowling',NULL);
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `Member_No` int NOT NULL AUTO_INCREMENT,
  `Member_Id` varchar(30) DEFAULT NULL,
  `Full_name` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Contact` varchar(45) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `Club_Id` varchar(45) DEFAULT NULL,
  `Session_Id` varchar(45) DEFAULT NULL,
  `Interested_Status` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `Color` varchar(45) DEFAULT ' ',
  `Pet` varchar(45) DEFAULT ' ',
  `Image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Member_No`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (124,'MEM124','Pranay Pawar','pranaypawar@gmail.com','1234567890',30,'123','CL1','SES30','Bowling','T',' ',' ',NULL),(125,'MEM125','John','sahiljadhav@gmail.com','1234567891',19,'111','CL2','SES35','Batting','TS',' ',' ','player2.jpg'),(128,'MEM128','Aditya Kachare','aadityakachare@gmail.com','9224303446',20,'123','CL2','SES9','Batting','M',' ',' ','player1.jpg'),(129,'MEM129','Peter Parker','peter@gmail.com','8906784563',22,'111','CL2','SES1','All Rounder','T',' ',' ',NULL),(130,'MEM130','Tony Stark','stark@gmail.com','1234567895',30,'567','CL2','SES1','Batting','TS',' ',' ',NULL),(131,'MEM131','Clint Barton','hawkeyee@gmail.com','7890364783',34,'789','CL2','SES1','Bowling','T',' ',' ',NULL),(132,'MEM132','Peter Doppler','dopp@gmail.com','6574893022',20,'456','CL2','SES1','Fielding','T',' ',' ',NULL),(133,'MEM133','Will Byres','will@gmail.com','2234563332',15,'678','CL2','SES1','Bowling','M',' ',' ','player1.jpg'),(134,'MEM134','Bruce Banner ','bruce@gmail.com','7890283789',30,'456','CL2','SES1','Batting','MS',' ',' ','player3.jpg'),(135,'MEM135','Steve Rogers','captain@gmail.com','6785924445',19,'555','CL2','SES1','All Rounder','T',' ',' ',NULL),(136,'MEM136','Peter Quil','star@gmail.com','7778889046',25,'890','CL2','SES1','Batting','M',' ',' ',NULL),(137,'MEM137','Miles Morales','miles@gmail.com','7890065436',18,'456','CL2','SES1','Fielding','T',' ',' ',NULL),(138,'MEM138','Aron Doppler','aron@gmail.com','7890654678',34,'123','CL2','SES1','Bowling','T',' ',' ',NULL),(139,'MEM139','Miles Morales','miles1@gmail.com','7890065436',18,'456','CL2','SES1','Fielding','T',' ',' ',NULL),(140,'MEM140','Aron Doppler','aron1@gmail.com','7890654678',34,'123','CL2','SES1','Bowling','T',' ',' ',NULL),(141,'MEM141','Peter Parker','peter1@gmail.com','8906784563',22,'111','CL2','SES1','All Rounder','T',' ',' ',NULL),(142,'MEM142','Tony Stark','stark1@gmail.com','1234567895',30,'567','CL2','SES1','Batting','T',' ',' ',NULL),(143,'MEM143','Clint Barton','hawkeye@gmail.com','7890364783',34,'789','CL2','SES1','Bowling','T',' ',' ',NULL),(147,'MEM147','ABC','abc@gmail.com','2222233333',30,'123','CL3','SES3','Fielding','T',' ',' ',NULL),(150,'MEM150','d','d@gmail.com','1111111111',33,'333','CL1','SES1','Batting','T',' ',' ',NULL),(151,'MEM151','Srushti','aryanmishra46889@gmail.com','8369464463',22,'111','CL1','SES2','Batting','M',' ',' ',NULL),(152,'MEM152','Srushti','aryanmishra4688911@gmail.com','8369464463',22,'111','CL1','SES2','Batting','M','red','dog',NULL),(153,'MEM153','Jamie Lanister','jamie@gmail.com','8989232456',25,'111','CL1','SES2','Batting','profile.png','Red','Dog','M'),(154,'MEM154','Rahul Shah','rahul@gmail.com','1111111111',20,'111','CL1','SES2','Batting','profile.png','red','dog','M'),(155,'MEM155','Aditya Kachare','joemama@gmail.com','9224303446',10,'111','CL1','SES2','Batting','profile.png','red','dog','M'),(156,'MEM156','Rohit Sharma','rohit@gmail.com','5667134',18,'123','CL1','SES2','Batting','profile.png','red','dog','M'),(157,'MEM157','Sachin','sachin@gmail.com','78676575',18,'111','CL1','SES2','Batting','M','blue','dog','profile.png'),(158,'MEM158','abc','joemam1a@gmail.com','9224303446',19,'111','CL1','SES20','Batting','M','red','dog','profile.png'),(159,'MEM159','aryan','am4@gmail.com','11111111111',18,'111','CL2','SES9','Batting','MS','red','dog','profile.png');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_admin`
--

DROP TABLE IF EXISTS `notifications_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_admin` (
  `Notification_No` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(200) DEFAULT NULL,
  `Date` varchar(45) DEFAULT NULL,
  `Time` varchar(45) DEFAULT NULL,
  `Club_Id` varchar(45) DEFAULT NULL,
  `Noti_Category` varchar(30) DEFAULT NULL,
  `Sender_mail` varchar(100) DEFAULT ' ',
  PRIMARY KEY (`Notification_No`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_admin`
--

LOCK TABLES `notifications_admin` WRITE;
/*!40000 ALTER TABLE `notifications_admin` DISABLE KEYS */;
INSERT INTO `notifications_admin` VALUES (3,'New Club request byff.<a href=\'admin_add_club_req.jsp?id=CL27\'> Click to view.</a>','Mon, Mar 14 2022','5:27 PM','CL27','add club req',' '),(4,'New Club request bysa.<a href=\'admin_add_club_req.jsp?id=CL36\'> Click to view.</a>','Thu, Mar 17 2022','2:45 PM','CL36','add club req',' '),(5,'wed<br>wsdxcvbghjk,.<br>By asadfe, bruce@gmail.com','Thu, Mar 17 2022','9:54 PM','','contact us','bruce@gmail.com'),(6,'New Club request byPranay Pawar.<a href=\'admin_add_club_req.jsp?id=CL37\'> Click to view.</a>','Thu, Apr 28 2022','10:35 am','CL37','add club req',' '),(7,'New Club request byjjfn.<a href=\'admin_add_club_req.jsp?id=CL38\'> Click to view.</a>','Thu, Apr 28 2022','10:41 am','CL38','add club req',' '),(8,'New Club request byTufayl Dalvi.<a href=\'admin_add_club_req.jsp?id=CL39\'> Click to view.</a>','Mon, May 02 2022','3:49 pm','CL39','add club req',' '),(9,'New Club request byHarsh Bhatt.<a href=\'admin_add_club_req.jsp?id=CL40\'> Click to view.</a>','Sat, May 07 2022','5:05 pm','CL40','add club req',' '),(10,'New Club request byHarsh Bhatt.<a href=\'admin_add_club_req.jsp?id=CL41\'> Click to view.</a>','Sat, May 07 2022','5:15 pm','CL41','add club req',' '),(11,'New Club request byHarsh Bhatt.<a href=\'admin_add_club_req.jsp?id=CL42\'> Click to view.</a>','Sat, May 07 2022','5:17 pm','CL42','add club req',' '),(12,'Dummy Subject<br>Dummy Subject<br>By Adiya Kachare, aditya767@gmai.com','Sat, May 07 2022','5:51 pm','','contact us','aditya767@gmai.com'),(13,'Dummy Subject<br>Dummy Message<br>By Aditya Patil, adityaak@gmai.com','Sat, May 07 2022','5:53 pm','','contact us','adityaak@gmai.com'),(14,'New Club request byJamie Lanister.<a href=\'admin_add_club_req.jsp?id=CL43\'> Click to view.</a>','Thu, May 19 2022','3:24 pm','CL43','add club req',' '),(15,'abc<br>abc<br>By Aditya Ashok Kachare, tufayldalvi@gmail.com','Thu, May 19 2022','3:27 pm','','contact us','tufayldalvi@gmail.com');
/*!40000 ALTER TABLE `notifications_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_coach`
--

DROP TABLE IF EXISTS `notifications_coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_coach` (
  `Notification_No` int NOT NULL AUTO_INCREMENT,
  `Visibility` varchar(45) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Date` varchar(45) DEFAULT NULL,
  `Time` varchar(30) DEFAULT NULL,
  `Noti_Category` varchar(50) DEFAULT ' ',
  `Challenge_Id` varchar(45) DEFAULT ' ',
  `Mem_Id` varchar(45) DEFAULT ' ',
  PRIMARY KEY (`Notification_No`)
) ENGINE=InnoDB AUTO_INCREMENT=489 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_coach`
--

LOCK TABLES `notifications_coach` WRITE;
/*!40000 ALTER TABLE `notifications_coach` DISABLE KEYS */;
INSERT INTO `notifications_coach` VALUES (309,'CL1','You have challenged SuperNovas','Mon, Feb 21 2022','12:04 AM','','CLN155','0'),(311,'all','Spartan Strikers and SuperNovas are having a match ','Mon, Feb 21 2022','12:05 AM','','CLN155','0'),(312,'CL3','ABC has rejected to participate in the match.','Mon, Feb 21 2022','12:19 AM','team approval','MEM147','0'),(313,'CL1','You have challenged Thunder Wolves','Mon, Feb 21 2022','12:39 AM','','CLN156','0'),(315,'all','Spartan Strikers and Thunder Wolves are having a match ','Mon, Feb 21 2022','12:39 AM','','CLN156','0'),(316,'CL1','Aditya Kachare, who is among one of your club\'s member, has changed their pratice session time to 5 - 1 (SES2).','Tue, Feb 22 2022','12:59 AM','member session','','0'),(317,'CL1','Aditya Kachare, who is among one of your club\'s member, has changed their pratice session time to 5 - 8 (SES20).','Tue, Feb 22 2022','6:04 PM','member session','','0'),(318,'CL1','You have challenged Thunder Wolves','Wed, Feb 23 2022','5:00 PM','','CLN157','0'),(320,'all','Spartan Strikers and Thunder Wolves are having a match ','Wed, Feb 23 2022','5:03 PM','','CLN157','0'),(321,'all','Spartan Strikers and Thunder Wolves are having a match ','Wed, Feb 23 2022','5:04 PM','','CLN157','0'),(322,'CL1','You have challenged Thunder Wolves','Wed, Feb 23 2022','6:14 PM','','CLN158','0'),(324,'all','Spartan Strikers and Thunder Wolves are having a match ','Wed, Feb 23 2022','6:15 PM','','CLN158','0'),(325,'CL1','Pranay Pawar has accepted to participate in the match.','Wed, Feb 23 2022','8:33 PM','team approval','MEM124','0'),(326,'all','dazcdsfc<br> Posted by tufayldalvi@gmail.com, CL1','Mon, Feb 28 2022','4:20 PM','','','0'),(327,'all','fafedgfrg<br> Posted by tufayldalvi@gmail.com, CL1','Mon, Feb 28 2022','4:23 PM','','','0'),(328,'all','djtre<br> Posted by tufayldalvi@gmail.com, Spartan Strikers','Mon, Feb 28 2022','4:33 PM','','','0'),(329,'all','hello<br> Posted by tufayldalvi@gmail.com, Spartan Strikers','Mon, Feb 28 2022','4:51 PM','by coach','','0'),(332,'CL2','dopp@gmail.com , one of your club member has requested to participate for match held on Fri, Feb 25 2022 at 3:00 AM between Spartan Strikers and Thunder Wolves.','Wed, Mar 02 2022','1:35 PM','request from member','CLN158','0'),(333,'CL2','dopp@gmail.com , one of your club member has requested to participate for match held on Fri, Feb 25 2022 at 3:00 AM between Spartan Strikers and Thunder Wolves.','Wed, Mar 02 2022','1:56 PM','request from member','CLN158','dopp@gmail.com'),(334,'CL2','You have challenged Spartan Strikers','Fri, Mar 04 2022','3:08 PM','','CLN165',' '),(336,'all','Thunder Wolves and Spartan Strikers are having a match ','Fri, Mar 04 2022','3:10 PM','','CLN165',' '),(337,'CL2','You have challenged Spartan Strikers','Fri, Mar 04 2022','3:21 PM','','CLN167',' '),(339,'CL2','You have challenged SuperNovas','Fri, Mar 04 2022','3:22 PM','','CLN168',' '),(340,'CL3','Thunder Wolves challenged you','Fri, Mar 04 2022','3:22 PM','challenge','CLN168',' '),(341,'CL2','You have challenged Game Swingers','Fri, Mar 04 2022','3:25 PM','','CLN169',' '),(342,'CL4','Thunder Wolves challenged you','Fri, Mar 04 2022','3:25 PM','challenge','CLN169',' '),(343,'all','Thunder Wolves and Spartan Strikers are having a match.','Fri, Mar 04 2022','3:26 PM','','CLN167',' '),(344,'CL1','You have challenged Thunder Wolves','Fri, Mar 04 2022','3:31 PM','','CLN171',' '),(346,'all','Spartan Strikers and Thunder Wolves are having a match.','Fri, Mar 04 2022','3:31 PM','','CLN171',' '),(347,'CL1','You have challenged Thunder Wolves','Fri, Mar 04 2022','3:32 PM','','CLN172',' '),(349,'all','Spartan Strikers and Thunder Wolves are having a match.','Fri, Mar 04 2022','3:32 PM','','CLN172',' '),(350,'CL2','You have challenged Spartan Strikers','Fri, Mar 04 2022','3:38 PM','','CLN173',' '),(352,'all','Thunder Wolves and Spartan Strikers are having a match.','Fri, Mar 04 2022','3:39 PM','','CLN173',' '),(353,'CL2','You have challenged Spartan Strikers','Fri, Mar 04 2022','3:39 PM','','CLN174',' '),(355,'all','Thunder Wolves and Spartan Strikers are having a match.','Fri, Mar 04 2022','3:39 PM','','CLN174',' '),(356,'CL1','pranaypawar@gmail.com , one of your club member has requested to participate for match held on Sat, Mar 05 2022 at 6:00 AM between Thunder Wolves and Spartan Strikers (CLN174).','Fri, Mar 04 2022','3:42 PM','request from member','CLN174','pranaypawar@gmail.com'),(357,'CL1','You have challenged Thunder Wolves','Fri, Mar 04 2022','6:41 PM','','CLN175',' '),(359,'all','Spartan Strikers and Thunder Wolves are having a match.','Fri, Mar 04 2022','6:41 PM','','CLN175',' '),(360,'CL1','You have challenged Thunder Wolves','Fri, Mar 04 2022','7:06 PM','','CLN176',' '),(362,'all','Spartan Strikers and Thunder Wolves are having a match.','Fri, Mar 04 2022','7:06 PM','','CLN176',' '),(363,'CL1','You have challenged Thunder Wolves','Fri, Mar 04 2022','7:24 PM','','CLN177',' '),(365,'all','Spartan Strikers and Thunder Wolves are having a match.','Fri, Mar 04 2022','7:26 PM','','CLN177',' '),(366,'CL2','You have challenged Spartan Strikers','Fri, Mar 04 2022','7:34 PM','','CLN178',' '),(368,'all','Thunder Wolves and Spartan Strikers are having a match.','Fri, Mar 04 2022','7:35 PM','','CLN178',' '),(372,'CL2','Will Byres has accepted to participate in the match (CLN178).','Fri, Mar 04 2022','11:25 PM','team approval','CLN178','MEM133'),(373,'CL2','Will Byres , one of your club member has requested to participate for match held on Tue, Mar 15 2022 at 5:00 AM between Spartan Strikers and Thunder Wolves (CLN176).','Fri, Mar 04 2022','11:29 PM','request from member','CLN176','will@gmail.com'),(374,'CL2','You have challenged Spartan Strikers','Tue, Mar 08 2022','9:40 AM','','CLN179',' '),(376,'all','Thunder Wolves and Spartan Strikers are having a match.','Tue, Mar 08 2022','10:42 AM','','CLN179',' '),(377,'CL34','Welcome coach, your club has been approved by Sportify. You can now make your club\'s practise session slots. <a href=\'coach_profile.jsp?count=1>Click to edit.</a>','Mon, Mar 14 2022','6:28 PM',' ',' ',' '),(378,'CL34','Welcome coach, your club has been approved by Sportify. You can now make your club\'s practise session slots. <a href=\'coach_profile.jsp?count=1>Click to edit.</a>','Mon, Mar 14 2022','6:54 PM',' ',' ',' '),(379,'CL34','Welcome coach, your club has been approved by Sportify. You can now make your club\'s practise session slots. <a href=\'coach_profile.jsp?count=1>Click to edit.</a>','Mon, Mar 14 2022','6:55 PM',' ',' ',' '),(380,'CL34','Welcome coach, your club has been approved by Sportify. You can now make your club\'s practise session slots. <a href=\'coach_profile.jsp?count=1>Click to edit.</a>','Mon, Mar 14 2022','6:57 PM',' ',' ',' '),(381,'CL34','Welcome coach, your club has been approved by Sportify. You can now make your club\'s practise session slots. <a href=\'coach_profile.jsp?count=1>Click to edit.</a>','Mon, Mar 14 2022','10:16 PM',' ',' ',' '),(382,'CL27','Welcome coach, your club has been approved by Sportify. You can now make your club\'s practise session slots. <a href=\'coach_profile.jsp?count=1>Click to edit.</a>','Mon, Mar 14 2022','10:28 PM',' ',' ',' '),(383,'CL27','Welcome coach, your club has been approved by Sportify. You can now make your club\'s practise session slots. <a href=\'coach_profile.jsp?count=1>Click to edit.</a>','Mon, Mar 14 2022','10:28 PM',' ',' ',' '),(384,'CL27','Welcome coach, your club has been approved by Sportify. You can now make your club\'s practise session slots. <a href=\'coach_profile.jsp?count=1>Click to edit.</a>','Mon, Mar 14 2022','10:35 PM',' ',' ',' '),(385,'CL27','Welcome coach, your club has been approved by Sportify. You can now make your club\'s practise session slots. <a href=\'coach_profile.jsp?count=1>Click to edit.</a>','Mon, Mar 14 2022','10:38 PM',' ',' ',' '),(386,'CL27','Welcome coach, your club has been approved by Sportify. You can now make your club\'s practise session slots. <a href=\'coach_profile.jsp?count=1>Click to edit.</a>','Mon, Mar 14 2022','10:43 PM',' ',' ',' '),(387,'CL27','Welcome coach, your club has been approved by Sportify. You can now make your club\'s practise session slots. <a href=\'coach_profile.jsp?count=1>Click to edit.</a>','Mon, Mar 14 2022','11:35 PM',' ',' ',' '),(388,'CL1','You have challenged Thunder Wolves','Thu, Mar 17 2022','2:29 PM','','CLN180',' '),(390,'all','Spartan Strikers and Thunder Wolves are having a match.','Thu, Mar 17 2022','2:30 PM','','CLN180',' '),(391,'CL1','Pranay Pawar has accepted to participate in the match (CLN177).','Thu, Mar 17 2022','2:32 PM','team approval','CLN177','MEM124'),(392,'CL36','Welcome coach, your club has been approved by Sportify. You can now make your club\'s practise session slots. <a href=\'coach_profile.jsp?count=1>Click to edit.</a>','Thu, Mar 17 2022','2:47 PM',' ',' ',' '),(393,'CL37','Welcome coach, your club has been approved by Sportify. You can now make your club\'s practise session slots. <a href=\'coach_profile.jsp?count=1>Click to edit.</a>','Thu, Apr 28 2022','10:37 am',' ',' ',' '),(394,'CL38','Welcome coach, your club has been approved by Sportify. You can now make your club\'s practise session slots. <a href=\'coach_profile.jsp?count=1>Click to edit.</a>','Thu, Apr 28 2022','10:42 am',' ',' ',' '),(395,'CL2','You have challenged Spartan Strikers','Thu, Apr 28 2022','10:57 am','','CLN183',' '),(397,'all','Thunder Wolves and Spartan Strikers are having a match.','Thu, Apr 28 2022','11:04 am','','CLN183',' '),(398,'CL2','Aditya Kachare has accepted to participate in the match (CLN183).','Thu, Apr 28 2022','11:06 am','team approval','CLN183','MEM128'),(399,'CL1','You have challenged Thunder Wolves','Thu, Apr 28 2022','3:45 pm','','CLN184',' '),(401,'all','Spartan Strikers and Thunder Wolves are having a match.','Thu, Apr 28 2022','3:46 pm','','CLN184',' '),(402,'CL1','Pranay Pawar1 has accepted to participate in the match (CLN183).','Thu, Apr 28 2022','4:17 pm','team approval','CLN183','MEM124'),(403,'CL1','You have challenged Thunder Wolves','Thu, Apr 28 2022','4:18 pm','','CLN185',' '),(405,'all','Spartan Strikers and Thunder Wolves are having a match.','Thu, Apr 28 2022','4:19 pm','','CLN185',' '),(406,'CL1','You have challenged Thunder Wolves','Thu, Apr 28 2022','5:31 pm','','CLN186',' '),(408,'all','Spartan Strikers and Thunder Wolves are having a match.','Thu, Apr 28 2022','5:31 pm','','CLN186',' '),(409,'CL1','You have challenged Thunder Wolves','Thu, Apr 28 2022','5:34 pm','','CLN187',' '),(411,'all','Spartan Strikers and Thunder Wolves are having a match.','Thu, Apr 28 2022','5:34 pm','','CLN187',' '),(412,'CL2','John has accepted to participate in the match (CLN187).','Thu, Apr 28 2022','5:41 pm','team approval','CLN187','MEM125'),(413,'CL1','You have challenged Thunder Wolves','Thu, Apr 28 2022','6:22 pm','','CLN188',' '),(415,'all','Spartan Strikers and Thunder Wolves are having a match.','Thu, Apr 28 2022','6:31 pm','','CLN188',' '),(416,'CL2','You have challenged Spartan Strikers','Thu, Apr 28 2022','7:00 pm','','CLN189',' '),(418,'all','Thunder Wolves and Spartan Strikers are having a match.','Thu, Apr 28 2022','7:02 pm','','CLN189',' '),(419,'CL2','You have challenged Spartan Strikers','Thu, Apr 28 2022','7:09 pm','','CLN190',' '),(421,'all','Thunder Wolves and Spartan Strikers are having a match.','Thu, Apr 28 2022','7:09 pm','','CLN190',' '),(422,'CL2','Aditya Kachare , one of your club member has requested to participate for match held on Fri, May 06 2022 at 6:00 am between Thunder Wolves and Spartan Strikers (CLN190).','Thu, Apr 28 2022','7:10 pm','request from member','CLN190','aadityakachare@gmail.com'),(423,'CL1','You have challenged Thunder Wolves','Thu, Apr 28 2022','11:36 pm','','CLN191',' '),(425,'all','Spartan Strikers and Thunder Wolves are having a match.','Thu, Apr 28 2022','11:36 pm','','CLN191',' '),(426,'CL1','You have challenged Thunder Wolves','Fri, Apr 29 2022','12:11 am','','CLN192',' '),(428,'all','Spartan Strikers and Thunder Wolves are having a match.','Fri, Apr 29 2022','12:11 am','','CLN192',' '),(429,'CL1','Pranay Pawar1 has accepted to participate in the match (CLN190).','Fri, Apr 29 2022','1:12 am','team approval','CLN190','MEM124'),(430,'CL2','John has accepted to participate in the match (CLN192).','Fri, Apr 29 2022','1:16 am','team approval','CLN192','MEM125'),(431,'CL2','Aditya Kachare has accepted to participate in the match (CLN183).','Fri, Apr 29 2022','1:33 am','team approval','CLN183','MEM128'),(432,'CL2','Aditya Kachare , one of your club member has requested to participate for match held on Sun, May 01 2022 at 12:45 pm between Spartan Strikers and Thunder Wolves (CLN192).','Fri, Apr 29 2022','1:34 am','request from member','CLN192','aadityakachare@gmail.com'),(433,'CL2','Aditya Kachare , one of your club member has requested to participate for match held on Fri, May 06 2022 at 6:00 am between Thunder Wolves and Spartan Strikers (CLN190).','Fri, Apr 29 2022','2:05 am','request from member','CLN190','aadityakachare@gmail.com'),(434,'CL2','Aditya Kachare , one of your club member has requested to participate for match held on Sun, May 01 2022 at 4:00 pm between Spartan Strikers and Thunder Wolves (CLN188).','Fri, Apr 29 2022','2:06 am','request from member','CLN188','aadityakachare@gmail.com'),(435,'CL2','Aditya Kachare , one of your club member has requested to participate for match held on Sun, May 01 2022 at 4:00 pm between Spartan Strikers and Thunder Wolves (CLN188).','Fri, Apr 29 2022','2:13 am','request from member','CLN188','aadityakachare@gmail.com'),(436,'CL2','Aditya Kachare , one of your club member has requested to participate for match held on Sun, May 01 2022 at 12:45 pm between Spartan Strikers and Thunder Wolves (CLN192).','Fri, Apr 29 2022','2:29 am','request from member','CLN192','aadityakachare@gmail.com'),(437,'CL2','You have challenged Spartan Strikers','Fri, Apr 29 2022','9:20 am','','CLN193',' '),(439,'all','Thunder Wolves and Spartan Strikers are having a match.','Fri, Apr 29 2022','9:20 am','','CLN193',' '),(440,'CL1','Pranay Pawar1 has accepted to participate in the match (CLN193).','Fri, Apr 29 2022','9:21 am','team approval','CLN193','MEM124'),(441,'CL2','Aditya Kachare has accepted to participate in the match (CLN193).','Fri, Apr 29 2022','9:21 am','team approval','CLN193','MEM128'),(442,'CL2','John , one of your club member has requested to participate for match held on Tue, May 03 2022 at 5:00 am between Thunder Wolves and Spartan Strikers (CLN193).','Fri, Apr 29 2022','9:21 am','request from member','CLN193','sahiljadhav@gmail.com'),(443,'all','bhnj<br> Posted by tufayldalvi@gmail.com, Spartan Strikers','Fri, Apr 29 2022','9:37 am','by coach','',' '),(444,'CL39','Welcome coach, your club has been approved by Sportify. You can now make your club\'s practise session slots. <a href=\'coach_profile.jsp?count=1>Click to edit.</a>','Mon, May 02 2022','3:49 pm',' ',' ',' '),(445,'CL40','Welcome coach, your club has been approved by Sportify. You can now make your club\'s practise session slots. <a href=\'coach_profile.jsp?count=1>Click to edit.</a>','Sat, May 07 2022','5:11 pm',' ',' ',' '),(446,'CL42','Welcome coach, your club has been approved by Sportify. You can now make your club\'s practise session slots. <a href=\'coach_profile.jsp?count=1>Click to edit.</a>','Sat, May 07 2022','5:19 pm',' ',' ',' '),(447,'CL1','Pranay Pawar, who is among one of your club\'s member, has changed their pratice session time to 5.00 - 7.00 (SES31).','Sat, May 07 2022','6:35 pm','session changed','',' '),(448,'CL2','You have challenged Spartan Strikers','Sat, May 07 2022','6:55 pm','','CLN194',' '),(450,'all','Thunder Wolves and Spartan Strikers are having a match.','Sat, May 07 2022','7:13 pm','','CLN194',' '),(451,'CL1','Pranay Pawar has accepted to participate in the match (CLN194).','Sat, May 07 2022','7:19 pm','team approval','CLN194','MEM124'),(453,'CL2','Bruce Banner  , one of your club member has requested to participate for match held on Mon, May 09 2022 at 4:00 pm between Thunder Wolves and Spartan Strikers (CLN194).','Sat, May 07 2022','7:32 pm','request from member','CLN194','bruce@gmail.com'),(454,'all','Hi all coaches<br> Posted by aditya@gmail.com, Thunder Wolves','Sat, May 07 2022','7:36 pm','by coach','',' '),(455,'CL2','Aditya Kachare, who is among one of your club\'s member, has changed their pratice session time to 5 - 6 (SES9).','Thu, May 19 2022','1:26 pm','session changed','',' '),(456,'CL2','You have challenged Spartan Strikers','Thu, May 19 2022','1:36 pm','','CLN195',' '),(458,'all','Thunder Wolves and Spartan Strikers are having a match.','Thu, May 19 2022','1:37 pm','','CLN195',' '),(459,'CL1','Pranay Pawar has accepted to participate in the match (CLN195).','Thu, May 19 2022','1:38 pm','team approval','CLN195','MEM124'),(460,'CL2','Aditya Kachare has accepted to participate in the match (CLN195).','Thu, May 19 2022','1:40 pm','team approval','CLN195','MEM128'),(461,'CL1','Sachin , one of your club member has requested to participate for match held on Sat, May 21 2022 at 4:00 pm between Thunder Wolves and Spartan Strikers (CLN195).','Thu, May 19 2022','1:50 pm','request from member','CLN195','sachin@gmail.com'),(462,'CL1','Pranay Pawar, who is among one of your club\'s member, has changed their pratice session time to 6 - 7 (SES16).','Thu, May 19 2022','2:13 pm','session changed','',' '),(463,'CL1','Pranay Pawar, who is among one of your club\'s member, has changed their pratice session time to 6 - 7 (SES16).','Thu, May 19 2022','2:13 pm','session changed','',' '),(464,'CL1','You have challenged Thunder Wolves','Thu, May 19 2022','2:28 pm','','CLN196',' '),(466,'all','Spartan Strikers and Thunder Wolves are having a match.','Thu, May 19 2022','2:29 pm','','CLN196',' '),(467,'CL2','Peter Parker has accepted to participate in the match (CLN196).','Thu, May 19 2022','2:32 pm','team approval','CLN196','MEM129'),(468,'CL1','Sachin has accepted to participate in the match (CLN196).','Thu, May 19 2022','2:33 pm','team approval','CLN196','MEM157'),(469,'CL2','Will Byres , one of your club member has requested to participate for match held on Sat, May 21 2022 at 7:00 am between Spartan Strikers and Thunder Wolves (CLN196).','Thu, May 19 2022','2:36 pm','request from member','CLN196','will@gmail.com'),(470,'CL43','Welcome coach, your club has been approved by Sportify. You can now make your club\'s practise session slots. <a href=\'coach_profile.jsp?count=1>Click to edit.</a>','Thu, May 19 2022','3:25 pm',' ',' ',' '),(471,'CL1','Pranay Pawar, who is among one of your club\'s member, has changed their pratice session time to 5 - 7 (SES34).','Thu, May 19 2022','3:42 pm','session changed','',' '),(472,'CL2','You have challenged Spartan Strikers','Thu, May 19 2022','3:44 pm','','CLN197',' '),(474,'all','Thunder Wolves and Spartan Strikers are having a match.','Thu, May 19 2022','3:45 pm','','CLN197',' '),(475,'CL1','Pranay Pawar has accepted to participate in the match (CLN197).','Thu, May 19 2022','3:46 pm','team approval','CLN197','MEM124'),(476,'CL2','Will Byres , one of your club member has requested to participate for match held on Sat, May 28 2022 at 7:00 am between Thunder Wolves and Spartan Strikers (CLN197).','Thu, May 19 2022','3:49 pm','request from member','CLN197','will@gmail.com'),(477,'CL2','John, who is among one of your club\'s member, has changed their pratice session time to 3.00pm - 6.00pm (SES35).','Wed, Jun 01 2022','12:29 pm','session changed','',' '),(478,'CL2','You have challenged Spartan Strikers','Wed, Jun 01 2022','12:33 pm','','CLN198',' '),(480,'all','Thunder Wolves and Spartan Strikers are having a match.','Wed, Jun 01 2022','12:34 pm','','CLN198',' '),(481,'CL1','Pranay Pawar has accepted to participate in the match (CLN198).','Wed, Jun 01 2022','12:36 pm','team approval','CLN198','MEM124'),(482,'CL2','Aditya Kachare , one of your club member has requested to participate for match held on Thu, Jun 02 2022 at 4:00 pm between Thunder Wolves and Spartan Strikers (CLN198).','Wed, Jun 01 2022','12:38 pm','request from member','CLN198','aadityakachare@gmail.com'),(483,'CL1','Pranay Pawar, who is among one of your club\'s member, has changed their pratice session time to 6 - 12 (SES30).','Wed, Jun 01 2022','2:20 pm','session changed','',' '),(484,'CL2','You have challenged Spartan Strikers','Wed, Jun 01 2022','2:21 pm','','CLN199',' '),(486,'all','Thunder Wolves and Spartan Strikers are having a match.','Wed, Jun 01 2022','2:22 pm','','CLN199',' '),(487,'CL1','Pranay Pawar has accepted to participate in the match (CLN199).','Wed, Jun 01 2022','2:24 pm','team approval','CLN199','MEM124'),(488,'CL2','Will Byres , one of your club member has requested to participate for match held on Fri, Jun 03 2022 at 4:00 pm between Thunder Wolves and Spartan Strikers (CLN199).','Wed, Jun 01 2022','2:26 pm','request from member','CLN199','will@gmail.com');
/*!40000 ALTER TABLE `notifications_coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_members`
--

DROP TABLE IF EXISTS `notifications_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_members` (
  `Notification_No` int NOT NULL AUTO_INCREMENT,
  `Visibility` varchar(45) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Date` varchar(45) DEFAULT NULL,
  `Time` varchar(45) DEFAULT NULL,
  `Noti_Category` varchar(100) DEFAULT NULL,
  `Challenge_Id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Notification_No`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_members`
--

LOCK TABLES `notifications_members` WRITE;
/*!40000 ALTER TABLE `notifications_members` DISABLE KEYS */;
INSERT INTO `notifications_members` VALUES (15,'all','Thunder Wolves and Spartan Strikers are having a match ','Sun, Feb 20 2022','11:18 PM','',' '),(16,'all','Spartan Strikers and SuperNovas are having a match ','Mon, Feb 21 2022','12:05 AM','',' '),(17,'all','Spartan Strikers and Thunder Wolves are having a match ','Mon, Feb 21 2022','12:39 AM','',' '),(18,'CL1','Some session timmings are altered by coach. <a href=\'member_coach_profile.jsp\'> Click to check. </a>','Tue, Feb 22 2022','7:39 PM','session changed',''),(19,'all','Spartan Strikers and Thunder Wolves are having a match ','Wed, Feb 23 2022','5:03 PM','','CLN157'),(21,'all','Spartan Strikers and Thunder Wolves are having a match ','Wed, Feb 23 2022','6:15 PM','','CLN158'),(22,'all','admin here<br> Posted by Admin aditinarkar@gmail.com','Mon, Feb 28 2022','4:56 PM','by admin',''),(23,'all','Thunder Wolves and Spartan Strikers are having a match ','Fri, Mar 04 2022','3:10 PM','','CLN165'),(24,'all','Thunder Wolves and Spartan Strikers are having a match ','Fri, Mar 04 2022','3:26 PM','','CLN167'),(25,'all','Spartan Strikers and Thunder Wolves are having a match ','Fri, Mar 04 2022','3:31 PM','','CLN171'),(26,'all','Spartan Strikers and Thunder Wolves are having a match ','Fri, Mar 04 2022','3:32 PM','','CLN172'),(27,'all','Thunder Wolves and Spartan Strikers are having a match ','Fri, Mar 04 2022','3:39 PM','','CLN173'),(28,'all','Thunder Wolves and Spartan Strikers are having a match ','Fri, Mar 04 2022','3:39 PM','','CLN174'),(29,'all','Spartan Strikers and Thunder Wolves are having a match ','Fri, Mar 04 2022','6:41 PM','','CLN175'),(30,'all','Spartan Strikers and Thunder Wolves are having a match ','Fri, Mar 04 2022','7:06 PM','','CLN176'),(31,'all','Spartan Strikers and Thunder Wolves are having a match ','Fri, Mar 04 2022','7:26 PM','','CLN177'),(32,'all','Thunder Wolves and Spartan Strikers are having a match ','Fri, Mar 04 2022','7:35 PM','','CLN178'),(33,'all','Thunder Wolves and Spartan Strikers are having a match ','Tue, Mar 08 2022','10:42 AM','','CLN179'),(34,'all','Spartan Strikers and Thunder Wolves are having a match ','Thu, Mar 17 2022','2:30 PM','','CLN180'),(35,'all','Thunder Wolves and Spartan Strikers are having a match ','Thu, Apr 28 2022','11:04 am','','CLN183'),(36,'all','Spartan Strikers and Thunder Wolves are having a match ','Thu, Apr 28 2022','3:46 pm','','CLN184'),(37,'all','Spartan Strikers and Thunder Wolves are having a match ','Thu, Apr 28 2022','4:19 pm','','CLN185'),(38,'all','Spartan Strikers and Thunder Wolves are having a match ','Thu, Apr 28 2022','5:31 pm','','CLN186'),(39,'all','Spartan Strikers and Thunder Wolves are having a match ','Thu, Apr 28 2022','5:34 pm','','CLN187'),(40,'all','Spartan Strikers and Thunder Wolves are having a match ','Thu, Apr 28 2022','6:31 pm','','CLN188'),(41,'all','Thunder Wolves and Spartan Strikers are having a match ','Thu, Apr 28 2022','7:02 pm','','CLN189'),(42,'all','Thunder Wolves and Spartan Strikers are having a match ','Thu, Apr 28 2022','7:09 pm','','CLN190'),(43,'all','Spartan Strikers and Thunder Wolves are having a match ','Thu, Apr 28 2022','11:36 pm','','CLN191'),(44,'all','Spartan Strikers and Thunder Wolves are having a match ','Fri, Apr 29 2022','12:11 am','','CLN192'),(45,'all','Thunder Wolves and Spartan Strikers are having a match ','Fri, Apr 29 2022','9:20 am','','CLN193'),(46,'CL1','hii','Fri, Apr 29 2022','9:34 am','by coach',''),(47,'CL2','vhbjnj','Fri, Apr 29 2022','9:37 am','by coach',''),(48,'CL1','Some session timmings are altered by coach. <a href=\'member_coach_profile.jsp\'> Click to check. </a>','Sat, May 07 2022','6:17 pm','session changed',''),(49,'all','Thunder Wolves and Spartan Strikers are having a match ','Sat, May 07 2022','7:13 pm','','CLN194'),(50,'CL2','Hi to my club','Sat, May 07 2022','7:37 pm','by coach',''),(51,'CL2','Some session timmings are altered by coach. <a href=\'member_coach_profile.jsp\'> Click to check. </a>','Thu, May 19 2022','1:10 pm','session changed',''),(52,'all','Thunder Wolves and Spartan Strikers are having a match ','Thu, May 19 2022','1:37 pm','','CLN195'),(53,'CL1','Some session timmings are altered by coach. <a href=\'member_coach_profile.jsp\'> Click to check. </a>','Thu, May 19 2022','2:12 pm','session changed',''),(54,'all','Spartan Strikers and Thunder Wolves are having a match ','Thu, May 19 2022','2:29 pm','','CLN196'),(55,'CL1','Some session timmings are altered by coach. <a href=\'member_coach_profile.jsp\'> Click to check. </a>','Thu, May 19 2022','3:38 pm','session changed',''),(56,'all','Thunder Wolves and Spartan Strikers are having a match ','Thu, May 19 2022','3:45 pm','','CLN197'),(57,'CL2','Some session timmings are altered by coach. <a href=\'member_coach_profile.jsp\'> Click to check. </a>','Wed, Jun 01 2022','12:27 pm','session changed',''),(58,'all','Thunder Wolves and Spartan Strikers are having a match ','Wed, Jun 01 2022','12:34 pm','','CLN198'),(59,'CL1','Some session timmings are altered by coach. <a href=\'member_coach_profile.jsp\'> Click to check. </a>','Wed, Jun 01 2022','2:19 pm','session changed',''),(60,'all','Thunder Wolves and Spartan Strikers are having a match ','Wed, Jun 01 2022','2:22 pm','','CLN199');
/*!40000 ALTER TABLE `notifications_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_team`
--

DROP TABLE IF EXISTS `notifications_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_team` (
  `Notification_No` int NOT NULL AUTO_INCREMENT,
  `Visibility` varchar(45) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Date` varchar(45) DEFAULT NULL,
  `Time` varchar(45) DEFAULT NULL,
  `Noti_Category` varchar(100) DEFAULT NULL,
  `Challenge_Id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Notification_No`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_team`
--

LOCK TABLES `notifications_team` WRITE;
/*!40000 ALTER TABLE `notifications_team` DISABLE KEYS */;
INSERT INTO `notifications_team` VALUES (8,'CL1','Your club has challenged Thunder Wolves.','Mon, Feb 14 2022','6:48 pm','match',' '),(9,'CL2','Your club has been challenged by Spartan Strikers.','Mon, Feb 14 2022','6:48 pm','match',' '),(10,'CL1','Your club has challenged Thunder Wolves.','Tue, Feb 15 2022','7:02 pm','match',' '),(11,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Tue, Feb 15 2022','7:02 pm','all',' '),(12,'CL2','Your club has been challenged by Spartan Strikers.','Tue, Feb 15 2022','7:02 pm','match',' '),(13,'CL2','Your club has challenged Spartan Strikers.','Sun, Feb 20 2022','4:12 pm','match',' '),(14,'CL2','Thunder Wolves and Spartan Strikers are having a match ','Sun, Feb 20 2022','4:12 pm','all',' '),(15,'CL1','Your club has been challenged by Thunder Wolves.','Sun, Feb 20 2022','4:12 pm','match',' '),(16,'CL2','Your club has challenged Spartan Strikers.','Sun, Feb 20 2022','4:16 pm','match',' '),(17,'CL2','Thunder Wolves and Spartan Strikers are having a match ','Sun, Feb 20 2022','4:16 pm','all',' '),(18,'CL1','Your club has been challenged by Thunder Wolves.','Sun, Feb 20 2022','4:16 pm','match',' '),(19,'CL1','Your club has challenged Thunder Wolves.','Sun, Feb 20 2022','11:01 PM','match',' '),(20,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Sun, Feb 20 2022','11:01 PM','all',' '),(21,'CL2','Your club has been challenged by Spartan Strikers.','Sun, Feb 20 2022','11:01 PM','match',' '),(22,'CL1','Your club has challenged Thunder Wolves.','Sun, Feb 20 2022','11:08 PM','match',' '),(23,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Sun, Feb 20 2022','11:08 PM','all',' '),(24,'CL2','Your club has been challenged by Spartan Strikers.','Sun, Feb 20 2022','11:08 PM','match',' '),(25,'CL1','Your club has challenged Thunder Wolves.','Sun, Feb 20 2022','11:09 PM','match',' '),(26,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Sun, Feb 20 2022','11:09 PM','all',' '),(27,'CL2','Your club has been challenged by Spartan Strikers.','Sun, Feb 20 2022','11:09 PM','match',' '),(28,'CL1','Your club has challenged Thunder Wolves.','Sun, Feb 20 2022','11:09 PM','match',' '),(29,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Sun, Feb 20 2022','11:09 PM','all',' '),(30,'CL2','Your club has been challenged by Spartan Strikers.','Sun, Feb 20 2022','11:09 PM','match',' '),(31,'CL1','Your club has challenged Thunder Wolves.','Sun, Feb 20 2022','11:09 PM','match',' '),(32,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Sun, Feb 20 2022','11:09 PM','all',' '),(33,'CL2','Your club has been challenged by Spartan Strikers.','Sun, Feb 20 2022','11:09 PM','match',' '),(34,'CL1','Your club has challenged Thunder Wolves.','Sun, Feb 20 2022','11:15 PM','match',' '),(35,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Sun, Feb 20 2022','11:15 PM','all',' '),(36,'CL2','Your club has been challenged by Spartan Strikers.','Sun, Feb 20 2022','11:15 PM','match',' '),(37,'CL2','Your club has challenged Spartan Strikers.','Sun, Feb 20 2022','11:18 PM','match',' '),(38,'CL2','Thunder Wolves and Spartan Strikers are having a match ','Sun, Feb 20 2022','11:18 PM','all',' '),(39,'CL1','Your club has been challenged by Thunder Wolves.','Sun, Feb 20 2022','11:18 PM','match',' '),(40,'CL1','Your club has challenged SuperNovas.','Mon, Feb 21 2022','12:05 AM','match',' '),(41,'CL1','Spartan Strikers and SuperNovas are having a match ','Mon, Feb 21 2022','12:05 AM','all',' '),(42,'CL3','Your club has been challenged by Spartan Strikers.','Mon, Feb 21 2022','12:05 AM','match',' '),(43,'CL1','Your club has challenged Thunder Wolves.','Mon, Feb 21 2022','12:39 AM','match',' '),(44,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Mon, Feb 21 2022','12:39 AM','all',' '),(45,'CL2','Your club has been challenged by Spartan Strikers.','Mon, Feb 21 2022','12:39 AM','match',' '),(46,'CL1','Some session timmings are altered by coach. <a href=\'member_coach_profile.jsp\'> Click to check. </a>','Tue, Feb 22 2022','7:39 PM','session changed',''),(47,'CL1','Your club has challenged Thunder Wolves.','Wed, Feb 23 2022','5:04 PM','match','CLN157'),(48,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Wed, Feb 23 2022','5:04 PM','all','CLN157'),(49,'CL2','Your club has been challenged by Spartan Strikers.','Wed, Feb 23 2022','5:04 PM','match','CLN157'),(50,'CL1','Your club has challenged Thunder Wolves.','Wed, Feb 23 2022','6:15 PM','match','CLN158'),(51,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Wed, Feb 23 2022','6:15 PM','all','CLN158'),(52,'CL2','Your club has been challenged by Spartan Strikers.','Wed, Feb 23 2022','6:15 PM','match','CLN158'),(53,'CL1','Pranay Pawar is your club\'s team captain.','Wed, Feb 23 2022','9:05 PM','match',''),(54,'all','admin here<br> Posted by Admin aditinarkar@gmail.com','Mon, Feb 28 2022','4:56 PM','by admin',''),(55,'CL2','Your club has challenged Spartan Strikers.','Fri, Mar 04 2022','3:10 PM','match','CLN165'),(56,'CL2','Thunder Wolves and Spartan Strikers are having a match ','Fri, Mar 04 2022','3:10 PM','all','CLN165'),(57,'CL1','Your club has been challenged by Thunder Wolves.','Fri, Mar 04 2022','3:10 PM','match','CLN165'),(58,'CL2','Your club has challenged Spartan Strikers.','Fri, Mar 04 2022','3:26 PM','match','CLN167'),(59,'CL2','Thunder Wolves and Spartan Strikers are having a match ','Fri, Mar 04 2022','3:26 PM','all','CLN167'),(60,'CL1','Your club has been challenged by Thunder Wolves.','Fri, Mar 04 2022','3:26 PM','match','CLN167'),(61,'CL1','Your club has challenged Thunder Wolves.','Fri, Mar 04 2022','3:31 PM','match','CLN171'),(62,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Fri, Mar 04 2022','3:31 PM','all','CLN171'),(63,'CL2','Your club has been challenged by Spartan Strikers.','Fri, Mar 04 2022','3:31 PM','match','CLN171'),(64,'CL1','Your club has challenged Thunder Wolves.','Fri, Mar 04 2022','3:32 PM','match','CLN172'),(65,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Fri, Mar 04 2022','3:32 PM','all','CLN172'),(66,'CL2','Your club has been challenged by Spartan Strikers.','Fri, Mar 04 2022','3:32 PM','match','CLN172'),(67,'CL2','Your club has challenged Spartan Strikers.','Fri, Mar 04 2022','3:39 PM','match','CLN173'),(68,'CL2','Thunder Wolves and Spartan Strikers are having a match ','Fri, Mar 04 2022','3:39 PM','all','CLN173'),(69,'CL1','Your club has been challenged by Thunder Wolves.','Fri, Mar 04 2022','3:39 PM','match','CLN173'),(70,'CL2','Your club has challenged Spartan Strikers.','Fri, Mar 04 2022','3:39 PM','match','CLN174'),(71,'CL2','Thunder Wolves and Spartan Strikers are having a match ','Fri, Mar 04 2022','3:39 PM','all','CLN174'),(72,'CL1','Your club has been challenged by Thunder Wolves.','Fri, Mar 04 2022','3:39 PM','match','CLN174'),(73,'CL1','Your club has challenged Thunder Wolves.','Fri, Mar 04 2022','6:41 PM','match','CLN175'),(74,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Fri, Mar 04 2022','6:41 PM','all','CLN175'),(75,'CL2','Your club has been challenged by Spartan Strikers.','Fri, Mar 04 2022','6:41 PM','match','CLN175'),(76,'CL1','Your club has challenged Thunder Wolves.','Fri, Mar 04 2022','7:06 PM','match','CLN176'),(77,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Fri, Mar 04 2022','7:06 PM','all','CLN176'),(78,'CL2','Your club has been challenged by Spartan Strikers.','Fri, Mar 04 2022','7:06 PM','match','CLN176'),(79,'CL1','Your club has challenged Thunder Wolves.','Fri, Mar 04 2022','7:26 PM','match','CLN177'),(80,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Fri, Mar 04 2022','7:26 PM','all','CLN177'),(81,'CL2','Your club has been challenged by Spartan Strikers.','Fri, Mar 04 2022','7:26 PM','match','CLN177'),(82,'CL2','Your club has challenged Spartan Strikers.','Fri, Mar 04 2022','7:35 PM','match','CLN178'),(83,'CL2','Thunder Wolves and Spartan Strikers are having a match ','Fri, Mar 04 2022','7:35 PM','all','CLN178'),(84,'CL1','Your club has been challenged by Thunder Wolves.','Fri, Mar 04 2022','7:35 PM','match','CLN178'),(85,'CL2','Your club has challenged Spartan Strikers.','Tue, Mar 08 2022','10:42 AM','match','CLN179'),(86,'CL2','Thunder Wolves and Spartan Strikers are having a match ','Tue, Mar 08 2022','10:42 AM','all','CLN179'),(87,'CL1','Your club has been challenged by Thunder Wolves.','Tue, Mar 08 2022','10:42 AM','match','CLN179'),(88,'CL1','Your club has challenged Thunder Wolves.','Thu, Mar 17 2022','2:30 PM','match','CLN180'),(89,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Thu, Mar 17 2022','2:30 PM','all','CLN180'),(90,'CL2','Your club has been challenged by Spartan Strikers.','Thu, Mar 17 2022','2:30 PM','match','CLN180'),(91,'CL1','Pranay Pawar is now your club\'s team captain.','Fri, Mar 18 2022','8:13 pm','match',''),(92,'CL1','Pranay Pawar is now your club\'s team captain.','Fri, Mar 18 2022','8:13 pm','match',''),(93,'CL2','Your club has challenged Spartan Strikers.','Thu, Apr 28 2022','11:04 am','match','CLN183'),(94,'CL2','Thunder Wolves and Spartan Strikers are having a match ','Thu, Apr 28 2022','11:04 am','all','CLN183'),(95,'CL1','Your club has been challenged by Thunder Wolves.','Thu, Apr 28 2022','11:04 am','match','CLN183'),(96,'CL2','Aditya Kachare is now your club\'s team captain.','Thu, Apr 28 2022','11:06 am','match',''),(97,'CL1','Your club has challenged Thunder Wolves.','Thu, Apr 28 2022','3:46 pm','match','CLN184'),(98,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Thu, Apr 28 2022','3:46 pm','all','CLN184'),(99,'CL2','Your club has been challenged by Spartan Strikers.','Thu, Apr 28 2022','3:46 pm','match','CLN184'),(100,'CL1','Your club has challenged Thunder Wolves.','Thu, Apr 28 2022','4:19 pm','match','CLN185'),(101,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Thu, Apr 28 2022','4:19 pm','all','CLN185'),(102,'CL2','Your club has been challenged by Spartan Strikers.','Thu, Apr 28 2022','4:19 pm','match','CLN185'),(103,'CL1','Your club has challenged Thunder Wolves.','Thu, Apr 28 2022','5:31 pm','match','CLN186'),(104,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Thu, Apr 28 2022','5:31 pm','all','CLN186'),(105,'CL2','Your club has been challenged by Spartan Strikers.','Thu, Apr 28 2022','5:31 pm','match','CLN186'),(106,'CL1','Your club has challenged Thunder Wolves.','Thu, Apr 28 2022','5:34 pm','match','CLN187'),(107,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Thu, Apr 28 2022','5:34 pm','all','CLN187'),(108,'CL2','Your club has been challenged by Spartan Strikers.','Thu, Apr 28 2022','5:34 pm','match','CLN187'),(109,'CL1','Your club has challenged Thunder Wolves.','Thu, Apr 28 2022','6:31 pm','match','CLN188'),(110,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Thu, Apr 28 2022','6:31 pm','all','CLN188'),(111,'CL2','Your club has been challenged by Spartan Strikers.','Thu, Apr 28 2022','6:31 pm','match','CLN188'),(112,'CL2','Your club has challenged Spartan Strikers.','Thu, Apr 28 2022','7:02 pm','match','CLN189'),(113,'CL2','Thunder Wolves and Spartan Strikers are having a match ','Thu, Apr 28 2022','7:02 pm','all','CLN189'),(114,'CL1','Your club has been challenged by Thunder Wolves.','Thu, Apr 28 2022','7:02 pm','match','CLN189'),(115,'CL2','Your club has challenged Spartan Strikers.','Thu, Apr 28 2022','7:09 pm','match','CLN190'),(116,'CL2','Thunder Wolves and Spartan Strikers are having a match ','Thu, Apr 28 2022','7:09 pm','all','CLN190'),(117,'CL1','Your club has been challenged by Thunder Wolves.','Thu, Apr 28 2022','7:09 pm','match','CLN190'),(118,'CL1','Your club has challenged Thunder Wolves.','Thu, Apr 28 2022','11:36 pm','match','CLN191'),(119,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Thu, Apr 28 2022','11:36 pm','all','CLN191'),(120,'CL2','Your club has been challenged by Spartan Strikers.','Thu, Apr 28 2022','11:36 pm','match','CLN191'),(121,'CL1','Your club has challenged Thunder Wolves.','Fri, Apr 29 2022','12:11 am','match','CLN192'),(122,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Fri, Apr 29 2022','12:11 am','all','CLN192'),(123,'CL2','Your club has been challenged by Spartan Strikers.','Fri, Apr 29 2022','12:11 am','match','CLN192'),(124,'CL2','Your club has challenged Spartan Strikers.','Fri, Apr 29 2022','9:20 am','match','CLN193'),(125,'CL2','Thunder Wolves and Spartan Strikers are having a match ','Fri, Apr 29 2022','9:20 am','all','CLN193'),(126,'CL1','Your club has been challenged by Thunder Wolves.','Fri, Apr 29 2022','9:20 am','match','CLN193'),(128,'CL1','Pranay Pawar is now your club\'s team captain.','Fri, Apr 29 2022','9:26 am','match',''),(129,'CL1','hii','Fri, Apr 29 2022','9:34 am','by coach',''),(130,'CL2','vhbjnj','Fri, Apr 29 2022','9:37 am','by coach',''),(131,'CL1','Some session timmings are altered by coach. <a href=\'member_coach_profile.jsp\'> Click to check. </a>','Sat, May 07 2022','6:17 pm','session changed',''),(132,'CL2','Your club has challenged Spartan Strikers.','Sat, May 07 2022','7:13 pm','match','CLN194'),(133,'CL2','Thunder Wolves and Spartan Strikers are having a match ','Sat, May 07 2022','7:13 pm','all','CLN194'),(134,'CL1','Your club has been challenged by Thunder Wolves.','Sat, May 07 2022','7:13 pm','match','CLN194'),(135,'CL1','Pranay Pawar is now your club\'s team captain.','Sat, May 07 2022','7:24 pm','match',''),(136,'CL2','Hi to my club','Sat, May 07 2022','7:37 pm','by coach',''),(137,'CL2','Some session timmings are altered by coach. <a href=\'member_coach_profile.jsp\'> Click to check. </a>','Thu, May 19 2022','1:10 pm','session changed',''),(138,'CL2','Your club has challenged Spartan Strikers.','Thu, May 19 2022','1:37 pm','match','CLN195'),(139,'CL2','Thunder Wolves and Spartan Strikers are having a match ','Thu, May 19 2022','1:37 pm','all','CLN195'),(140,'CL1','Your club has been challenged by Thunder Wolves.','Thu, May 19 2022','1:37 pm','match','CLN195'),(141,'CL1','Pranay Pawar is now your club\'s team captain.','Thu, May 19 2022','1:42 pm','match',''),(142,'CL1','Sachin is now your club\'s team captain.','Thu, May 19 2022','1:55 pm','match',''),(143,'CL1','Pranay Pawar is now your club\'s team captain.','Thu, May 19 2022','1:56 pm','match',''),(144,'CL1','Sachin is now your club\'s team captain.','Thu, May 19 2022','1:56 pm','match',''),(145,'CL1','Pranay Pawar is now your club\'s team captain.','Thu, May 19 2022','1:57 pm','match',''),(146,'CL1','Some session timmings are altered by coach. <a href=\'member_coach_profile.jsp\'> Click to check. </a>','Thu, May 19 2022','2:12 pm','session changed',''),(147,'CL1','Your club has challenged Thunder Wolves.','Thu, May 19 2022','2:29 pm','match','CLN196'),(148,'CL1','Spartan Strikers and Thunder Wolves are having a match ','Thu, May 19 2022','2:29 pm','all','CLN196'),(149,'CL2','Your club has been challenged by Spartan Strikers.','Thu, May 19 2022','2:29 pm','match','CLN196'),(150,'CL2','Peter Parker is now your club\'s team captain.','Thu, May 19 2022','2:34 pm','match',''),(151,'CL1','Some session timmings are altered by coach. <a href=\'member_coach_profile.jsp\'> Click to check. </a>','Thu, May 19 2022','3:38 pm','session changed',''),(152,'CL2','Your club has challenged Spartan Strikers.','Thu, May 19 2022','3:45 pm','match','CLN197'),(153,'CL2','Thunder Wolves and Spartan Strikers are having a match ','Thu, May 19 2022','3:45 pm','all','CLN197'),(154,'CL1','Your club has been challenged by Thunder Wolves.','Thu, May 19 2022','3:45 pm','match','CLN197'),(155,'CL1','Pranay Pawar is now your club\'s team captain.','Thu, May 19 2022','3:47 pm','match',''),(156,'CL2','Some session timmings are altered by coach. <a href=\'member_coach_profile.jsp\'> Click to check. </a>','Wed, Jun 01 2022','12:27 pm','session changed',''),(157,'CL2','Your club has challenged Spartan Strikers.','Wed, Jun 01 2022','12:34 pm','match','CLN198'),(158,'CL2','Thunder Wolves and Spartan Strikers are having a match ','Wed, Jun 01 2022','12:34 pm','all','CLN198'),(159,'CL1','Your club has been challenged by Thunder Wolves.','Wed, Jun 01 2022','12:34 pm','match','CLN198'),(160,'CL1','Pranay Pawar is now your club\'s team captain.','Wed, Jun 01 2022','12:37 pm','match',''),(161,'CL1','Some session timmings are altered by coach. <a href=\'member_coach_profile.jsp\'> Click to check. </a>','Wed, Jun 01 2022','2:19 pm','session changed',''),(162,'CL2','Your club has challenged Spartan Strikers.','Wed, Jun 01 2022','2:22 pm','match','CLN199'),(163,'CL2','Thunder Wolves and Spartan Strikers are having a match ','Wed, Jun 01 2022','2:22 pm','all','CLN199'),(164,'CL1','Your club has been challenged by Thunder Wolves.','Wed, Jun 01 2022','2:22 pm','match','CLN199'),(165,'CL1','Pranay Pawar is now your club\'s team captain.','Wed, Jun 01 2022','2:25 pm','match','');
/*!40000 ALTER TABLE `notifications_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `Session_No` int NOT NULL AUTO_INCREMENT,
  `Session_Id` varchar(45) DEFAULT NULL,
  `Start_Time` varchar(10) DEFAULT NULL,
  `End_Time` varchar(10) DEFAULT NULL,
  `Team_Member` varchar(45) DEFAULT NULL,
  `Club_Id` varchar(45) DEFAULT NULL,
  `Current_Capacity` int DEFAULT NULL,
  `Max_Capacity` int DEFAULT NULL,
  PRIMARY KEY (`Session_No`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (1,'SES1','5','7','Team','CL2',16,45),(2,'SES2','5','1','Member','CL1',7,34),(3,'SES3','4','3','Team','CL3',1,23),(9,'SES9','5','6','Member','CL2',2,8),(10,'SES10','5','6','Member','CL3',0,9),(13,'SES13','5','6','Member','CL2',0,66),(16,'SES16','6','7','Team','CL1',0,65),(20,'SES20','5','8','Member','CL1',1,80),(30,'SES30','6','12','Team','CL1',1,55),(31,'SES31','5.00','7.00','Team','CL1',0,20),(32,'SES32','2','5','Team','CL2',0,5),(33,'SES33','6','7','Member','CL1',0,80),(34,'SES34','5','7','Team','CL1',0,80),(35,'SES35','3.00pm','6.00pm','Team','CL2',1,50),(36,'SES36','5.00pm','8.00pm','Member','CL1',0,50);
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `Team_No` int NOT NULL AUTO_INCREMENT,
  `Team_Id` varchar(45) DEFAULT NULL,
  `Member_Id` varchar(255) DEFAULT NULL,
  `Club_Id` varchar(45) DEFAULT NULL,
  `Captain` varchar(45) DEFAULT '0',
  `Challenge_Id` varchar(45) DEFAULT ' ',
  `Status` varchar(45) DEFAULT 'Pending',
  PRIMARY KEY (`Team_No`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (246,'TM246','MEM159','CL1','0','CLN198','Pending'),(247,'TM247','MEM124','CL1','0','CLN198','Approved'),(248,'TM248','MEM129','CL1','0','CLN198','Pending'),(249,'TM249','MEM130','CL1','0','CLN198','Pending'),(250,'TM250','MEM131','CL1','0','CLN198','Pending'),(251,'TM251','MEM132','CL1','0','CLN198','Pending'),(252,'TM252','MEM135','CL1','0','CLN198','Pending'),(253,'TM253','MEM137','CL1','0','CLN198','Pending'),(254,'TM254','MEM138','CL1','0','CLN198','Pending'),(255,'TM255','MEM139','CL1','0','CLN198','Pending'),(256,'TM256','MEM140','CL1','0','CLN198','Pending'),(257,'TM257','MEM141','CL1','0','CLN198','Pending'),(258,'TM258','MEM142','CL1','0','CLN198','Pending'),(259,'TM259','MEM143','CL1','0','CLN198','Pending'),(260,'TM260','MEM150','CL1','0','CLN198','Pending'),(261,'TM261','MEM128','CL2','0','CLN198','Approved'),(262,'TM262','MEM134','CL1','0','CLN199','Pending'),(263,'TM263','MEM159','CL1','0','CLN199','Pending'),(264,'TM264','MEM124','CL1','1','CLN199','Approved'),(265,'TM265','MEM129','CL1','0','CLN199','Pending'),(266,'TM266','MEM131','CL1','0','CLN199','Pending'),(267,'TM267','MEM132','CL1','0','CLN199','Pending'),(268,'TM268','MEM135','CL1','0','CLN199','Pending'),(269,'TM269','MEM137','CL1','0','CLN199','Pending'),(270,'TM270','MEM138','CL1','0','CLN199','Pending'),(271,'TM271','MEM139','CL1','0','CLN199','Pending'),(272,'TM272','MEM140','CL1','0','CLN199','Pending'),(273,'TM273','MEM141','CL1','0','CLN199','Pending'),(274,'TM274','MEM142','CL1','0','CLN199','Pending'),(275,'TM275','MEM143','CL1','0','CLN199','Pending'),(276,'TM276','MEM150','CL1','0','CLN199','Pending'),(277,'TM277','MEM133','CL2','0','CLN199','Approved');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venue` (
  `Venue_No` int NOT NULL AUTO_INCREMENT,
  `Venue_Id` varchar(45) DEFAULT NULL,
  `Venue_Name` varchar(45) DEFAULT NULL,
  `Venue_Address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Venue_No`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` VALUES (1,'VN1','Eden Park','Bandra'),(2,'VN2','Highland Ground','Colaba'),(4,'VN4','SuperSport Park','Matunga'),(5,'VN5','Centurion Park','Sion'),(34,'VN34','Wankhede','Mumbai'),(39,'VN39','fff','ff'),(40,'VN40','fff','ff'),(41,'VN41','Wankhede','Mumbai'),(42,'VN42','Wankhede','Mumbai'),(43,'VN43','Wankhede','Mumbai'),(44,'VN44','Wankhede','Mumbai'),(45,'VN45','MCA Cricket Ground','Mumbai'),(46,'VN46','Wankhede','Mumbai'),(47,'VN47','Wankhede','Mumbai'),(48,'VN48','Wankhede','Mumbai');
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-24 19:21:44
