-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: railway_management_system
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','5af554431d976fdc57ea02908a8e0ce6'),(2,'sarang','1');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `between_stations`
--

DROP TABLE IF EXISTS `between_stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `between_stations` (
  `Station_Number` int NOT NULL,
  `Train_Number` int DEFAULT NULL,
  `Station_Name` varchar(255) DEFAULT NULL,
  `Arrival_Time` time DEFAULT NULL,
  PRIMARY KEY (`Station_Number`),
  KEY `Train_Number` (`Train_Number`),
  CONSTRAINT `between_stations_ibfk_1` FOREIGN KEY (`Train_Number`) REFERENCES `trains` (`Train_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `between_stations`
--

LOCK TABLES `between_stations` WRITE;
/*!40000 ALTER TABLE `between_stations` DISABLE KEYS */;
INSERT INTO `between_stations` VALUES (1,11001,'Thane','07:50:00'),(2,11001,'Lonavala','09:35:00'),(3,11002,'Satara','08:30:00'),(4,11002,'Miraj','10:45:00'),(5,11003,'Karjat','19:30:00');
/*!40000 ALTER TABLE `between_stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `Passenger_ID` int NOT NULL,
  `Ticket_ID` int NOT NULL,
  `Booking_Date` date DEFAULT NULL,
  PRIMARY KEY (`Passenger_ID`,`Ticket_ID`),
  KEY `Ticket_ID` (`Ticket_ID`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`Passenger_ID`) REFERENCES `passenger` (`Passenger_ID`) ON DELETE CASCADE,
  CONSTRAINT `books_ibfk_2` FOREIGN KEY (`Ticket_ID`) REFERENCES `ticket` (`Ticket_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,1,'2024-09-08'),(2,2,'2024-09-08');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaches` (
  `Coach_Number` int NOT NULL,
  `Train_Number` int NOT NULL,
  `Available_Seats` int DEFAULT NULL,
  PRIMARY KEY (`Coach_Number`,`Train_Number`),
  KEY `Train_Number` (`Train_Number`),
  CONSTRAINT `coaches_ibfk_1` FOREIGN KEY (`Train_Number`) REFERENCES `trains` (`Train_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES (1,11001,6),(2,11001,10),(3,11002,10),(4,11002,10),(5,11003,10);
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `confirmed_tickets_view`
--

DROP TABLE IF EXISTS `confirmed_tickets_view`;
/*!50001 DROP VIEW IF EXISTS `confirmed_tickets_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `confirmed_tickets_view` AS SELECT 
 1 AS `Ticket_ID`,
 1 AS `PNR_Number`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `Notification_ID` int NOT NULL AUTO_INCREMENT,
  `Passenger_ID` int NOT NULL,
  `Message` varchar(255) NOT NULL,
  `Created_At` datetime NOT NULL,
  PRIMARY KEY (`Notification_ID`),
  KEY `Passenger_ID` (`Passenger_ID`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`Passenger_ID`) REFERENCES `passenger` (`Passenger_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,2,'Ticket booked with ID 5','2024-10-27 23:25:43');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `Passenger_ID` int NOT NULL,
  `Passenger_Name` varchar(255) NOT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Date_Of_Birth` date DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `Pin_Code` varchar(10) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  PRIMARY KEY (`Passenger_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Soham Rajput','Male','2005-05-29','sohamrajput0405@gmail.com','Virar','Maharashtra','401303','India',19),(2,'Omkar Pawar','Male','2005-06-02','omkarpawar123@gmail.com','Pune','Maharashtra','411045','India',19),(3,'Pooja Deshmukh','Female','2004-08-15','poojadeshmukh@gmail.com','Nashik','Maharashtra','422001','India',20),(5,'Neha Kulkarni','Female','2002-11-10','nehakulkarni@gmail.com','Mumbai','Maharashtra','400001','India',21),(6,'Aditya Shinde','Male','2000-03-15','aditya.shinde@example.com','Virar','Maharashtra','401303','India',24);
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_passenger_age` BEFORE INSERT ON `passenger` FOR EACH ROW BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, NEW.Date_Of_Birth, CURDATE());

    IF age < 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Passenger must be at least 5 years old.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `passenger_info_view`
--

DROP TABLE IF EXISTS `passenger_info_view`;
/*!50001 DROP VIEW IF EXISTS `passenger_info_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `passenger_info_view` AS SELECT 
 1 AS `Passenger_ID`,
 1 AS `Passenger_Name`,
 1 AS `Gender`,
 1 AS `Date_Of_Birth`,
 1 AS `Email`,
 1 AS `City`,
 1 AS `State`,
 1 AS `Pin_Code`,
 1 AS `Country`,
 1 AS `Age`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `passenger_mobile`
--

DROP TABLE IF EXISTS `passenger_mobile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger_mobile` (
  `Passenger_ID` int NOT NULL,
  `Mobile_Number` varchar(15) NOT NULL,
  PRIMARY KEY (`Passenger_ID`,`Mobile_Number`),
  CONSTRAINT `passenger_mobile_ibfk_1` FOREIGN KEY (`Passenger_ID`) REFERENCES `passenger` (`Passenger_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger_mobile`
--

LOCK TABLES `passenger_mobile` WRITE;
/*!40000 ALTER TABLE `passenger_mobile` DISABLE KEYS */;
INSERT INTO `passenger_mobile` VALUES (1,'9123456789'),(1,'9876543210'),(2,'9234567890'),(2,'9876543211'),(3,'9876543212'),(5,'9012345678'),(5,'9876543214');
/*!40000 ALTER TABLE `passenger_mobile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `Ticket_ID` int NOT NULL,
  `Journey_Date` date DEFAULT NULL,
  `Boarding_Station` varchar(255) DEFAULT NULL,
  `Destination_Station` varchar(255) DEFAULT NULL,
  `Coach_Number` int DEFAULT NULL,
  `Seat_Number` int DEFAULT NULL,
  `Number_Of_Passengers` int DEFAULT NULL,
  `Ticket_Price` decimal(10,2) DEFAULT NULL,
  `PNR_Number` varchar(20) DEFAULT NULL,
  `Status` enum('Pending','Confirmed','Canceled') NOT NULL,
  `Passenger_ID` int DEFAULT NULL,
  `Train_Number` int DEFAULT NULL,
  PRIMARY KEY (`Ticket_ID`),
  KEY `Passenger_ID` (`Passenger_ID`),
  KEY `Train_Number` (`Train_Number`),
  KEY `Coach_Number` (`Coach_Number`,`Train_Number`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`Passenger_ID`) REFERENCES `passenger` (`Passenger_ID`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`Train_Number`) REFERENCES `trains` (`Train_Number`),
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`Coach_Number`, `Train_Number`) REFERENCES `coaches` (`Coach_Number`, `Train_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'2024-09-10','Mumbai CST','Pune',1,5,1,500.00,'PNR1234567890','Canceled',1,11001),(2,'2024-09-11','Kolhapur','Gondia',3,8,2,600.00,'PNR1234567891','Confirmed',2,11002),(3,'2024-09-12','Mumbai CST','Kolhapur',5,2,1,450.00,'PNR1234567892','Pending',6,11003),(4,'2024-10-12','Mumbai CST','Pune',1,6,1,500.00,'PNR1234567893','Confirmed',3,11001),(5,'2024-10-30','Mumbai CST','Pune',1,1,1,500.00,'PNR1234567895','Confirmed',2,11001);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_seats_on_booking` AFTER INSERT ON `ticket` FOR EACH ROW BEGIN
    UPDATE coaches
    SET Available_Seats = Available_Seats - NEW.Number_Of_Passengers
    WHERE Coach_Number = NEW.Coach_Number
      AND Train_Number = NEW.Train_Number;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `notify_on_booking` AFTER INSERT ON `ticket` FOR EACH ROW BEGIN
    INSERT INTO notifications (passenger_id, message, created_at)
    VALUES (NEW.passenger_id, CONCAT('Ticket booked with ID ', NEW.ticket_id), NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_seats_on_cancellation` AFTER UPDATE ON `ticket` FOR EACH ROW BEGIN
    IF NEW.Status = 'Canceled' AND OLD.Status != 'Canceled' THEN
        UPDATE coaches
        SET Available_Seats = Available_Seats + OLD.Number_Of_Passengers
        WHERE Coach_Number = OLD.Coach_Number
          AND Train_Number = OLD.Train_Number;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `ticket_passenger_view`
--

DROP TABLE IF EXISTS `ticket_passenger_view`;
/*!50001 DROP VIEW IF EXISTS `ticket_passenger_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ticket_passenger_view` AS SELECT 
 1 AS `Ticket_ID`,
 1 AS `Passenger_Name`,
 1 AS `Journey_Date`,
 1 AS `Boarding_Station`,
 1 AS `Destination_Station`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `train_passenger_summary`
--

DROP TABLE IF EXISTS `train_passenger_summary`;
/*!50001 DROP VIEW IF EXISTS `train_passenger_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `train_passenger_summary` AS SELECT 
 1 AS `Train_Number`,
 1 AS `Total_Passengers`,
 1 AS `Total_Revenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `trains`
--

DROP TABLE IF EXISTS `trains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trains` (
  `Train_Number` int NOT NULL,
  `Train_Name` varchar(255) NOT NULL,
  `Source` varchar(255) DEFAULT NULL,
  `Destination` varchar(255) DEFAULT NULL,
  `Departure_Time` time DEFAULT NULL,
  `Arrival_Time` time DEFAULT NULL,
  PRIMARY KEY (`Train_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trains`
--

LOCK TABLES `trains` WRITE;
/*!40000 ALTER TABLE `trains` DISABLE KEYS */;
INSERT INTO `trains` VALUES (11001,'Deccan Queen','Mumbai CST','Pune','07:00:00','10:25:00'),(11002,'Maharashtra Express','Kolhapur','Gondia','05:30:00','05:15:00'),(11003,'Sahyadri Express','Mumbai CST','Kolhapur','17:50:00','04:00:00'),(11004,'Vidarbha Express','Mumbai CST','Nagpur','19:05:00','07:50:00'),(11005,'Sinhagad Express','Pune','Mumbai CST','06:05:00','09:55:00');
/*!40000 ALTER TABLE `trains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `confirmed_tickets_view`
--

/*!50001 DROP VIEW IF EXISTS `confirmed_tickets_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `confirmed_tickets_view` AS select `ticket`.`Ticket_ID` AS `Ticket_ID`,`ticket`.`PNR_Number` AS `PNR_Number`,`ticket`.`Status` AS `Status` from `ticket` where (`ticket`.`Status` = 'Confirmed') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `passenger_info_view`
--

/*!50001 DROP VIEW IF EXISTS `passenger_info_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `passenger_info_view` AS select `passenger`.`Passenger_ID` AS `Passenger_ID`,`passenger`.`Passenger_Name` AS `Passenger_Name`,`passenger`.`Gender` AS `Gender`,`passenger`.`Date_Of_Birth` AS `Date_Of_Birth`,`passenger`.`Email` AS `Email`,`passenger`.`City` AS `City`,`passenger`.`State` AS `State`,`passenger`.`Pin_Code` AS `Pin_Code`,`passenger`.`Country` AS `Country`,`passenger`.`Age` AS `Age` from `passenger` where ((`passenger`.`Passenger_ID` % 2) = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ticket_passenger_view`
--

/*!50001 DROP VIEW IF EXISTS `ticket_passenger_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ticket_passenger_view` AS select `t`.`Ticket_ID` AS `Ticket_ID`,`p`.`Passenger_Name` AS `Passenger_Name`,`t`.`Journey_Date` AS `Journey_Date`,`t`.`Boarding_Station` AS `Boarding_Station`,`t`.`Destination_Station` AS `Destination_Station` from (`ticket` `t` join `passenger` `p` on((`t`.`Passenger_ID` = `p`.`Passenger_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `train_passenger_summary`
--

/*!50001 DROP VIEW IF EXISTS `train_passenger_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `train_passenger_summary` AS select `ticket`.`Train_Number` AS `Train_Number`,count(`ticket`.`Passenger_ID`) AS `Total_Passengers`,sum(`ticket`.`Ticket_Price`) AS `Total_Revenue` from `ticket` group by `ticket`.`Train_Number` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-30 11:33:30
