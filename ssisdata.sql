CREATE DATABASE  IF NOT EXISTS `ssis_web_tan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ssis_web_tan`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ssis_web_tan
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `college`
--

DROP TABLE IF EXISTS `college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `college` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college`
--

LOCK TABLES `college` WRITE;
/*!40000 ALTER TABLE `college` DISABLE KEYS */;
INSERT INTO `college` VALUES (1, 'College of Computer Studies'),
(2, 'College of Engineering'),
(3, 'College of Business Administration'),
(4, 'College of Arts and Sciences'),
(5, 'College of Education'),
(6, 'College of Nursing'),
(7, 'College of Agriculture'),
(8, 'College of Tourism and Hospitality'),
(9, 'College of Law'),
(10, 'College of Architecture'),
(11, 'College of Sports Science'),
(12, 'College of Music and Arts'),
(13, 'College of Social Work'),
(14, 'College of Fisheries'),
(15, 'College of Veterinary Medicine'),
(16, 'College of Environmental Science'),
(17, 'College of Medicine'),
(18, 'College of Pharmacy'),
(19, 'College of Maritime Studies'),
(20, 'College of Information Technology');
/*!40000 ALTER TABLE `college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program` (
  `courseCode` varchar(45) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `college` int DEFAULT NULL,
  PRIMARY KEY (`courseCode`),
  UNIQUE KEY `courseCode_UNIQUE` (`courseCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES ('BSCS', 'BS Computer Science', 1),
('BSIT', 'BS Information Technology', 1),
('BSIS', 'BS Information Systems', 1),
('BSDS', 'BS Data Science', 1),
('BSEE', 'BS Electrical Engineering', 2),
('BSME', 'BS Mechanical Engineering', 2),
('BSCE', 'BS Civil Engineering', 2),
('BSIE', 'BS Industrial Engineering', 2),
('BSA', 'BS Accountancy', 3),
('BSBA', 'BS Business Administration', 3),
('BSE', 'BS Entrepreneurship', 3),
('BSMM', 'BS Marketing Management', 3),
('BAPSY', 'BA Psychology', 4),
('BACOM', 'BA Communication', 4),
('BSBIO', 'BS Biology', 4),
('BSCHE', 'BS Chemistry', 4),
('BSEDSEC', 'BS Secondary Education', 5),
('BSEDELEM', 'BS Elementary Education', 5),
('BSN', 'BS Nursing', 6),
('BSTHM', 'BS Tourism Management', 8),
('BSHM', 'BS Hospitality Management', 8),
('BSARCH', 'BS Architecture', 10),
('BSSS', 'BS Sports Science', 11),
('BAMUS', 'BA Music', 12),
('BASW', 'BA Social Work', 13),
('BSFISH', 'BS Fisheries', 14),
('BSAGRI', 'BS Agriculture', 7),
('DVM', 'DVM Veterinary Medicine', 15),
('BSENVSCI', 'BS Environmental Science', 16),
('BSMED', 'BS Medicine', 17),
('BSPHARM', 'BS Pharmacy', 18),
('BSMARITIME', 'BS Maritime Studies', 19),
('BSCYBER', 'BS Cybersecurity', 1),
('BSSWE', 'BS Software Engineering', 1),
('BSGD', 'BS Game Development', 1),
('BSDATA', 'BS Data Analytics', 1),
('BSFE', 'BS Financial Engineering', 2),
('BSECE', 'BS Electronics Engineering', 2),
('BSMINING', 'BS Mining Engineering', 2),
('BSAERO', 'BS Aeronautical Engineering', 2),
('BSFM', 'BS Financial Management', 3),
('BSLM', 'BS Legal Management', 9),
('BSLAW', 'BS Law', 9),
('BSPA', 'BS Public Administration', 3),
('BAHIST', 'BA History', 4),
('BASOCIO', 'BA Sociology', 4),
('BSFS', 'BS Forensic Science', 4),
('BSSPED', 'BS Special Education', 5),
('BSPT', 'BS Physical Therapy', 6),
('BSRT', 'BS Radiologic Technology', 6);
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` varchar(15) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `yearLevel` enum('First Year','Second Year','Third Year','Fourth Year') DEFAULT NULL,
  `enrollmentStatus` enum('Enrolled','Not Enrolled') DEFAULT NULL,
  `program` varchar(20) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('2024-3810', 'John Doe', 'First Year', 'Enrolled', 'BSCS', NULL),
('2025-0002', 'Jane Smith', 'Second Year', 'Not Enrolled', 'BSIT', NULL),
('2025-0003', 'Mark Johnson', 'Third Year', 'Enrolled', 'BSIS', NULL),
('2025-0004', 'Emily Davis', 'Fourth Year', 'Enrolled', 'BSDS', NULL),
('2025-0005', 'Michael Brown', 'First Year', 'Not Enrolled', 'BSEE', NULL),
('2025-0006', 'Sarah Wilson', 'Second Year', 'Enrolled', 'BSME', NULL),
('2025-0007', 'David Martinez', 'Third Year', 'Enrolled', 'BSCE', NULL),
('2025-0008', 'Laura Hernandez', 'Fourth Year', 'Not Enrolled', 'BSIE', NULL),
('2025-0009', 'Daniel Lee', 'First Year', 'Enrolled', 'BSA', NULL),
('2025-0010', 'Emma Garcia', 'Second Year', 'Enrolled', 'BSBA', NULL),
('2025-0011', 'Christopher Miller', 'Third Year', 'Enrolled', 'BSE', NULL),
('2025-0012', 'Olivia Lopez', 'Fourth Year', 'Not Enrolled', 'BSMM', NULL),
('2025-0013', 'James Anderson', 'First Year', 'Enrolled', 'BAPSY', NULL),
('2025-0014', 'Sophia Thomas', 'Second Year', 'Not Enrolled', 'BACOM', NULL),
('2025-0015', 'William Taylor', 'Third Year', 'Enrolled', 'BSBIO', NULL),
('2025-0016', 'Isabella Moore', 'Fourth Year', 'Enrolled', 'BSCHE', NULL),
('2025-0017', 'Alexander White', 'First Year', 'Not Enrolled', 'BSEDSEC', NULL),
('2025-0018', 'Mia Harris', 'Second Year', 'Enrolled', 'BSEDELEM', NULL),
('2025-0019', 'Benjamin Clark', 'Third Year', 'Enrolled', 'BSN', NULL),
('2025-0020', 'Charlotte Hall', 'Fourth Year', 'Not Enrolled', 'BSTHM', NULL),
('2025-0021', 'LeBron James', 'First Year', 'Enrolled', 'BSCS', NULL),
('2025-0022', 'Stephen Curry', 'Second Year', 'Not Enrolled', 'BSIT', NULL),
('2025-0023', 'Kevin Durant', 'Third Year', 'Enrolled', 'BSIS', NULL),
('2025-0024', 'Giannis Antetokounmpo', 'Fourth Year', 'Enrolled', 'BSDS', NULL),
('2025-0025', 'Kawhi Leonard', 'First Year', 'Not Enrolled', 'BSEE', NULL),
('2025-0026', 'James Harden', 'Second Year', 'Enrolled', 'BSME', NULL),
('2025-0027', 'Anthony Davis', 'Third Year', 'Enrolled', 'BSCE', NULL),
('2025-0028', 'Jayson Tatum', 'Fourth Year', 'Not Enrolled', 'BSIE', NULL),
('2025-0029', 'Joel Embiid', 'First Year', 'Enrolled', 'BSA', NULL),
('2025-0030', 'Luka Dončić', 'Second Year', 'Enrolled', 'BSBA', NULL),
('2025-0031', 'Zion Williamson', 'Third Year', 'Enrolled', 'BSE', NULL),
('2025-0032', 'Ja Morant', 'Fourth Year', 'Not Enrolled', 'BSMM', NULL),
('2025-0033', 'Devin Booker', 'First Year', 'Enrolled', 'BAPSY', NULL),
('2025-0034', 'Damian Lillard', 'Second Year', 'Not Enrolled', 'BACOM', NULL),
('2025-0035', 'Nikola Jokić', 'Third Year', 'Enrolled', 'BSBIO', NULL),
('2025-0036', 'Jimmy Butler', 'Fourth Year', 'Enrolled', 'BSCHE', NULL),
('2025-0037', 'Chris Paul', 'First Year', 'Not Enrolled', 'BSEDSEC', NULL),
('2025-0038', 'Klay Thompson', 'Second Year', 'Enrolled', 'BSEDELEM', NULL),
('2025-0039', 'Draymond Green', 'Third Year', 'Enrolled', 'BSN', NULL),
('2025-0040', 'Rudy Gobert', 'Fourth Year', 'Not Enrolled', 'BSTHM', NULL),
('2025-0041', 'Bradley Beal', 'First Year', 'Enrolled', 'BSARCH', NULL),
('2025-0042', 'Kyrie Irving', 'Second Year', 'Enrolled', 'BSSS', NULL),
('2025-0043', 'Paul George', 'Third Year', 'Enrolled', 'BSAGRI', NULL),
('2025-0044', 'Andrew Wiggins', 'Fourth Year', 'Not Enrolled', 'BSMARITIME', NULL),
('2025-0045', 'Karl-Anthony Towns', 'First Year', 'Enrolled', 'BSCYBER', NULL),
('2025-0046', 'Donovan Mitchell', 'Second Year', 'Not Enrolled', 'BSSWE', NULL),
('2025-0047', 'Brandon Ingram', 'Third Year', 'Enrolled', 'BSGD', NULL),
('2025-0048', 'Bam Adebayo', 'Fourth Year', 'Enrolled', 'BSDATA', NULL),
('2025-0049', 'Trae Young', 'First Year', 'Not Enrolled', 'BSFE', NULL),
('2025-0050', 'CJ McCollum', 'Second Year', 'Enrolled', 'BSECE', NULL),
('2025-0051', 'Jamal Murray', 'Third Year', 'Enrolled', 'BSMINING', NULL),
('2025-0052', 'DeAaron Fox', 'Fourth Year', 'Not Enrolled', 'BSAERO', NULL),
('2025-0053', 'Fred VanVleet', 'First Year', 'Enrolled', 'BSFM', NULL),
('2025-0054', 'Shai Gilgeous-Alexander', 'Second Year', 'Not Enrolled', 'BSLAW', NULL),
('2025-0055', 'LaMelo Ball', 'Third Year', 'Enrolled', 'BSLM', NULL),
('2025-0056', 'Tyrese Haliburton', 'Fourth Year', 'Enrolled', 'BSPA', NULL),
('2025-0057', 'Jaren Jackson Jr.', 'First Year', 'Not Enrolled', 'BAHIST', NULL),
('2025-0058', 'Tyler Herro', 'Second Year', 'Enrolled', 'BASOCIO', NULL),
('2025-0059', 'RJ Barrett', 'Third Year', 'Enrolled', 'BSFS', NULL),
('2025-0060', 'Jordan Poole', 'Fourth Year', 'Not Enrolled', 'BSSPED', NULL),
('2025-0061', 'Derrick Rose', 'First Year', 'Enrolled', 'BSPT', NULL),
('2025-0062', 'Russell Westbrook', 'Second Year', 'Enrolled', 'BSRT', NULL),
('2025-0063', 'Victor Wembanyama', 'Third Year', 'Enrolled', 'BSENVSCI', NULL),
('2025-0064', 'Scoot Henderson', 'Fourth Year', 'Not Enrolled', 'BSBIO', NULL),
('2025-0065', 'Alperen Sengun', 'First Year', 'Enrolled', 'BSDS', NULL),
('2025-0066', 'Jabari Smith Jr.', 'Second Year', 'Enrolled', 'BSEE', NULL),
('2025-0067', 'Paolo Banchero', 'Third Year', 'Enrolled', 'BSCE', NULL),
('2025-0068', 'Evan Mobley', 'Fourth Year', 'Not Enrolled', 'BSN', NULL),
('2025-0069', 'Franz Wagner', 'First Year', 'Enrolled', 'BSCS', NULL),
('2025-0070', 'Cade Cunningham', 'Second Year', 'Not Enrolled', 'BSIS', NULL),
('2025-0071', 'Scottie Barnes', 'Third Year', 'Enrolled', 'BSSWE', NULL),
('2025-0072', 'Desmond Bane', 'Fourth Year', 'Enrolled', 'BSGD', NULL),
('2025-0073', 'OG Anunoby', 'First Year', 'Not Enrolled', 'BSDATA', NULL),
('2025-0074', 'Michael Porter Jr.', 'Second Year', 'Enrolled', 'BSIT', NULL),
('2025-0075', 'Mikal Bridges', 'Third Year', 'Enrolled', 'BSARCH', NULL),
('2025-0076', 'Darius Garland', 'Fourth Year', 'Not Enrolled', 'BSLAW', NULL),
('2025-0077', 'Josh Giddey', 'First Year', 'Enrolled', 'BSSS', NULL),
('2025-0078', 'Jarrett Allen', 'Second Year', 'Enrolled', 'BSPHARM', NULL),
('2025-0079', 'Brook Lopez', 'Third Year', 'Enrolled', 'BSMARITIME', NULL),
('2025-0080', 'Clint Capela', 'Fourth Year', 'Not Enrolled', 'BSA', NULL),
('2025-0081', 'Nikola Vučević', 'First Year', 'Enrolled', 'BSE', NULL),
('2025-0082', 'Jonas Valančiūnas', 'Second Year', 'Enrolled', 'BSMM', NULL),
('2025-0083', 'Domantas Sabonis', 'Third Year', 'Enrolled', 'BSAGRI', NULL),
('2025-0084', 'P.J. Washington', 'Fourth Year', 'Not Enrolled', 'BSTHM', NULL),
('2025-0085', 'Kyle Kuzma', 'First Year', 'Enrolled', 'BAMUS', NULL),
('2025-0086', 'Buddy Hield', 'Second Year', 'Not Enrolled', 'BASW', NULL),
('2025-0087', 'Bobby Portis', 'Third Year', 'Enrolled', 'BSEDSEC', NULL),
('2025-0088', 'Miles Bridges', 'Fourth Year', 'Enrolled', 'BSEDELEM', NULL),
('2025-0089', 'Caris LeVert', 'First Year', 'Not Enrolled', 'BSRT', NULL),
('2025-0090', 'Julius Randle', 'Second Year', 'Enrolled', 'BSBIO', NULL),
('2025-0091', 'Tobias Harris', 'Third Year', 'Enrolled', 'BSDS', NULL),
('2025-0092', 'Spencer Dinwiddie', 'Fourth Year', 'Not Enrolled', 'BSEE', NULL),
('2025-0093', 'Tyrese Maxey', 'First Year', 'Enrolled', 'BSIT', NULL),
('2025-0094', 'Christian Wood', 'Second Year', 'Enrolled', 'BSCE', NULL),
('2025-0095', 'Jaden Ivey', 'Third Year', 'Enrolled', 'BSCS', NULL),
('2025-0096', 'Jalen Green', 'Fourth Year', 'Not Enrolled', 'BSLAW', NULL),
('2025-0097', 'Kevin Porter Jr.', 'First Year', 'Enrolled', 'BSN', NULL),
('2025-0098', 'Rui Hachimura', 'Second Year', 'Not Enrolled', 'BSMINING', NULL),
('2025-0099', 'Tyus Jones', 'Third Year', 'Enrolled', 'BSCHE', NULL),
('2025-0100', 'Monte Morris', 'Fourth Year', 'Enrolled', 'BSSPED', NULL),
('2025-0101', 'Aja Wilson', 'First Year', 'Enrolled', 'BSCS', NULL),
('2025-0102', 'Breanna Stewart', 'Second Year', 'Not Enrolled', 'BSIT', NULL),
('2025-0103', 'Candace Parker', 'Third Year', 'Enrolled', 'BSIS', NULL),
('2025-0104', 'Elena Delle Donne', 'Fourth Year', 'Enrolled', 'BSDS', NULL),
('2025-0105', 'Diana Taurasi', 'First Year', 'Not Enrolled', 'BSEE', NULL),
('2025-0106', 'Sue Bird', 'Second Year', 'Enrolled', 'BSME', NULL),
('2025-0107', 'Sylvia Fowles', 'Third Year', 'Enrolled', 'BSCE', NULL),
('2025-0108', 'Nneka Ogwumike', 'Fourth Year', 'Not Enrolled', 'BSIE', NULL),
('2025-0109', 'Skylar Diggins-Smith', 'First Year', 'Enrolled', 'BSA', NULL),
('2025-0110', 'Liz Cambage', 'Second Year', 'Enrolled', 'BSBA', NULL),
('2025-0111', 'Jonquel Jones', 'Third Year', 'Enrolled', 'BSE', NULL),
('2025-0112', 'Arike Ogunbowale', 'Fourth Year', 'Not Enrolled', 'BSMM', NULL),
('2025-0113', 'Kelsey Plum', 'First Year', 'Enrolled', 'BAPSY', NULL),
('2025-0114', 'Courtney Vandersloot', 'Second Year', 'Not Enrolled', 'BACOM', NULL),
('2025-0115', 'Jewell Loyd', 'Third Year', 'Enrolled', 'BSBIO', NULL),
('2025-0116', 'Chelsea Gray', 'Fourth Year', 'Enrolled', 'BSCHE', NULL),
('2025-0117', 'Kahleah Copper', 'First Year', 'Not Enrolled', 'BSEDSEC', NULL),
('2025-0118', 'Alyssa Thomas', 'Second Year', 'Enrolled', 'BSEDELEM', NULL),
('2025-0119', 'Natasha Howard', 'Third Year', 'Enrolled', 'BSN', NULL),
('2025-0120', 'Brittney Griner', 'Fourth Year', 'Not Enrolled', 'BSTHM', NULL),
('2025-0121', 'Tiffany Hayes', 'First Year', 'Enrolled', 'BSARCH', NULL),
('2025-0122', 'Emma Meesseman', 'Second Year', 'Enrolled', 'BSSS', NULL),
('2025-0123', 'Lindsay Whalen', 'Third Year', 'Enrolled', 'BSAGRI', NULL),
('2025-0124', 'Katie Lou Samuelson', 'Fourth Year', 'Not Enrolled', 'BSMARITIME', NULL),
('2025-0125', 'Rhyne Howard', 'First Year', 'Enrolled', 'BSCYBER', NULL),
('2025-0126', 'Allisha Gray', 'Second Year', 'Not Enrolled', 'BSSWE', NULL),
('2025-0127', 'Sabrina Ionescu', 'Third Year', 'Enrolled', 'BSGD', NULL),
('2025-0128', 'Shakira Austin', 'Fourth Year', 'Enrolled', 'BSDATA', NULL),
('2025-0129', 'Elena Baranova', 'First Year', 'Not Enrolled', 'BSFE', NULL),
('2025-0130', 'Tamika Catchings', 'Second Year', 'Enrolled', 'BSECE', NULL),
('2025-0131', 'Lauren Jackson', 'Third Year', 'Enrolled', 'BSMINING', NULL),
('2025-0132', 'Becky Hammon', 'Fourth Year', 'Not Enrolled', 'BSAERO', NULL),
('2025-0133', 'Angel McCoughtry', 'First Year', 'Enrolled', 'BSFM', NULL),
('2025-0134', 'Tina Charles', 'Second Year', 'Not Enrolled', 'BSLAW', NULL),
('2025-0135', 'DeWanna Bonner', 'Third Year', 'Enrolled', 'BSLM', NULL),
('2025-0136', 'Alana Beard', 'Fourth Year', 'Enrolled', 'BSPA', NULL),
('2025-0137', 'Seimone Augustus', 'First Year', 'Not Enrolled', 'BAHIST', NULL),
('2025-0138', 'Kia Nurse', 'Second Year', 'Enrolled', 'BASOCIO', NULL),
('2025-0139', 'Chiney Ogwumike', 'Third Year', 'Enrolled', 'BSFS', NULL),
('2025-0140', 'Breann January', 'Fourth Year', 'Not Enrolled', 'BSSPED', NULL),
('2025-0141', 'Shavonte Zellous', 'First Year', 'Enrolled', 'BSPT', NULL),
('2025-0142', 'Kayla McBride', 'Second Year', 'Enrolled', 'BSRT', NULL),
('2025-0143', 'Monique Currie', 'Third Year', 'Enrolled', 'BSENVSCI', NULL),
('2025-0144', 'Ticha Penicheiro', 'Fourth Year', 'Not Enrolled', 'BSBIO', NULL),
('2025-0145', 'Cappie Pondexter', 'First Year', 'Enrolled', 'BSDS', NULL),
('2025-0146', 'Swin Cash', 'Second Year', 'Enrolled', 'BSEE', NULL),
('2025-0147', 'Maya Moore', 'Third Year', 'Enrolled', 'BSCE', NULL),
('2025-0148', 'Lisa Leslie', 'Fourth Year', 'Not Enrolled', 'BSN', NULL),
('2025-0149', 'Ruthie Bolton', 'First Year', 'Enrolled', 'BSCS', NULL),
('2025-0150', 'Nikki McCray', 'Second Year', 'Not Enrolled', 'BSIS', NULL),
('2025-0151', 'Jessica Breland', 'Third Year', 'Enrolled', 'BSSWE', NULL),
('2025-0152', 'Carolyn Swords', 'Fourth Year', 'Enrolled', 'BSGD', NULL),
('2025-0153', 'Courtney Williams', 'First Year', 'Not Enrolled', 'BSDATA', NULL),
('2025-0154', 'Crystal Langhorne', 'Second Year', 'Enrolled', 'BSIT', NULL),
('2025-0155', 'Taj McWilliams-Franklin', 'Third Year', 'Enrolled', 'BSARCH', NULL),
('2025-0156', 'Penny Taylor', 'Fourth Year', 'Not Enrolled', 'BSLAW', NULL),
('2025-0157', 'Dawn Staley', 'First Year', 'Enrolled', 'BSSS', NULL),
('2025-0158', 'Natalie Achonwa', 'Second Year', 'Enrolled', 'BSPHARM', NULL),
('2025-0159', 'Natalie Williams', 'Third Year', 'Enrolled', 'BSMARITIME', NULL),
('2025-0160', 'Teresa Weatherspoon', 'Fourth Year', 'Not Enrolled', 'BSA', NULL),
('2025-0161', 'Rebecca Lobo', 'First Year', 'Enrolled', 'BSE', NULL),
('2025-0162', 'Bria Hartley', 'Second Year', 'Enrolled', 'BSMM', NULL),
('2025-0163', 'Erica Wheeler', 'Third Year', 'Enrolled', 'BSAGRI', NULL),
('2025-0164', 'Tanisha Wright', 'Fourth Year', 'Not Enrolled', 'BSTHM', NULL),
('2025-0165', 'Betnijah Laney', 'First Year', 'Enrolled', 'BAMUS', NULL),
('2025-0166', 'Asia Durr', 'Second Year', 'Not Enrolled', 'BASW', NULL),
('2025-0167', 'Kiah Stokes', 'Third Year', 'Enrolled', 'BSEDSEC', NULL),
('2025-0168', 'Renee Montgomery', 'Fourth Year', 'Enrolled', 'BSEDELEM', NULL),
('2025-0169', 'Tamera Young', 'First Year', 'Not Enrolled', 'BSRT', NULL),
('2025-0170', 'Katie Douglas', 'Second Year', 'Enrolled', 'BSBIO', NULL),
('2025-0171', 'Kristi Toliver', 'Third Year', 'Enrolled', 'BSDS', NULL),
('2025-0172', 'Tina Thompson', 'Fourth Year', 'Not Enrolled', 'BSEE', NULL),
('2025-0173', 'Chamique Holdsclaw', 'First Year', 'Enrolled', 'BSIT', NULL),
('2025-0174', 'Cynthia Cooper', 'Second Year', 'Enrolled', 'BSCE', NULL),
('2025-0175', 'Sheryl Swoopes', 'Third Year', 'Enrolled', 'BSCS', NULL),
('2025-0176', 'Michelle Snow', 'Fourth Year', 'Not Enrolled', 'BSLAW', NULL),
('2025-0177', 'Kara Lawson', 'First Year', 'Enrolled', 'BSECE', NULL),
('2025-0178', 'Marissa Coleman', 'Second Year', 'Not Enrolled', 'BSSWE', NULL),
('2025-0179', 'Alison Bales', 'Third Year', 'Enrolled', 'BSGD', NULL),
('2025-0180', 'Erin Phillips', 'Fourth Year', 'Enrolled', 'BSCYBER', NULL),
('2025-0181', 'Asjha Jones', 'First Year', 'Not Enrolled', 'BSBA', NULL),
('2025-0182', 'Cindy Brown', 'Second Year', 'Enrolled', 'BSAERO', NULL),
('2025-0183', 'Tammy Sutton-Brown', 'Third Year', 'Enrolled', 'BSLAW', NULL),
('2025-0184', 'Nikki Teasley', 'First Year', 'Enrolled', 'BSBA', NULL),
('2025-0185', 'Michelle Edwards', 'Second Year', 'Not Enrolled', 'BSBIO', NULL),
('2025-0186', 'Vickie Johnson', 'Third Year', 'Enrolled', 'BSCHE', NULL),
('2025-0187', 'Tasha Humphrey', 'Fourth Year', 'Not Enrolled', 'BSAGRI', NULL),
('2025-0188', 'Tina Charles', 'First Year', 'Enrolled', 'BSDS', NULL),
('2025-0189', 'Samantha Prahalis', 'Second Year', 'Enrolled', 'BSAERO', NULL),
('2025-0190', 'Kristen Mann', 'Third Year', 'Enrolled', 'BSECE', NULL),
('2025-0191', 'Joanne McCarthy', 'Fourth Year', 'Not Enrolled', 'BSPT', NULL),
('2025-0192', 'Margo Dydek', 'First Year', 'Enrolled', 'BSCS', NULL),
('2025-0193', 'Janeth Arcain', 'Second Year', 'Not Enrolled', 'BSCS', NULL),
('2025-0194', 'Sue Wicks', 'Third Year', 'Enrolled', 'BSLAW', NULL),
('2025-0195', 'Shay Murphy', 'Fourth Year', 'Enrolled', 'BSAGRI', NULL),
('2025-0196', 'Debbie Black', 'First Year', 'Not Enrolled', 'BSCE', NULL),
('2025-0197', 'Tonya Edwards', 'Second Year', 'Enrolled', 'BSCS', NULL),
('2025-0198', 'Catherine Kraayeveld', 'Third Year', 'Enrolled', 'BSDS', NULL),
('2025-0199', 'Dawn Staley', 'Fourth Year', 'Not Enrolled', 'BSBIO', NULL),
('2025-0200', 'Tina Thompson', 'First Year', 'Enrolled', 'BSLAW', NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-13  1:24:21
