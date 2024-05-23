-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: aecp_dev_db
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.20.04.1

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
-- Table structure for table `churches`
--

DROP TABLE IF EXISTS `churches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `churches` (
  `name` varchar(128) NOT NULL,
  `subcounty_id` varchar(60) NOT NULL,
  `id` varchar(60) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subcounty_id` (`subcounty_id`),
  CONSTRAINT `churches_ibfk_1` FOREIGN KEY (`subcounty_id`) REFERENCES `subcounties` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `churches`
--

LOCK TABLES `churches` WRITE;
/*!40000 ALTER TABLE `churches` DISABLE KEYS */;
INSERT INTO `churches` VALUES ('AECP Light','429197b1-8f9a-4a7a-b67c-390a94c5bd47','04ea3c7f-3810-49f9-81e6-5c7a8078402f','2024-05-03 16:28:38'),('AECP Cathedral','b12d46f2-b287-4ef3-b468-fd339b852f35','19a7762b-15bb-43ee-aa66-dd174da78d0d','2024-05-21 18:08:29'),('AECP South','5c61059f-5523-4449-94aa-d779e1a3af91','2d7d8211-a24c-4b0c-aed0-0e74e3a26ac4','2024-05-21 12:05:46'),('AECP West','5c61059f-5523-4449-94aa-d779e1a3af91','384f0ad8-7550-4744-a994-3dbe78c9aa46','2024-05-21 12:04:40'),('AECP Parish','429197b1-8f9a-4a7a-b67c-390a94c5bd47','4b8dfddf-2b58-4d13-a002-b5bf55dde6aa','2024-05-03 16:28:38'),('AECP West','b12d46f2-b287-4ef3-b468-fd339b852f35','56bb3f95-463a-4c48-be92-3803fa4145dc','2024-05-21 18:08:29'),('AECP Cathedral','f4e039f4-41b6-4e5a-8f03-a5ecf7e3b51f','5c7e6b1b-c69c-43e4-a698-807f822af973','2024-05-21 18:04:08'),('AECP Parish','b12d46f2-b287-4ef3-b468-fd339b852f35','5e2d51dd-4b01-4740-898c-564b612df130','2024-05-21 18:08:29'),('AECP Light','5c61059f-5523-4449-94aa-d779e1a3af91','6167fc0e-97a4-49e1-9494-01ce0283baa1','2024-05-21 12:30:32'),('AECP North','0782b5dd-5ef9-4529-a258-be5fcf3adecb','6f896f4b-c643-42f3-bf06-3f18ea440564','2024-05-22 09:26:31'),('AECP West','f4e039f4-41b6-4e5a-8f03-a5ecf7e3b51f','83d85d4b-ee9c-43ec-ba7e-ede08cc0c0d0','2024-05-21 18:04:08'),('AECP North','5c61059f-5523-4449-94aa-d779e1a3af91','876693a6-5d5f-4c19-b3c8-314fc5b101a2','2024-05-04 11:07:39'),('AECP West','0782b5dd-5ef9-4529-a258-be5fcf3adecb','94b54ac9-62b2-4efe-b47e-97bb15e2250f','2024-05-22 09:37:53'),('AECP Cathedral','429197b1-8f9a-4a7a-b67c-390a94c5bd47','b40a7cd1-3f87-49d1-a3eb-2b4fce466491','2024-05-03 16:28:38'),('AECP Central','b12d46f2-b287-4ef3-b468-fd339b852f35','c88b4f06-c287-46a4-9685-2134c26e6673','2024-05-21 18:08:29'),('AECP Cathedral','5c61059f-5523-4449-94aa-d779e1a3af91','d2d77952-8714-40a3-8470-ad4973c18399','2024-05-04 11:07:39'),('AECP Parish','f4e039f4-41b6-4e5a-8f03-a5ecf7e3b51f','d807ab4a-fa96-42cf-bd21-5de3cd0d41c5','2024-05-21 18:04:08'),('AECP Central','5c61059f-5523-4449-94aa-d779e1a3af91','e7025651-1def-4c4d-9365-88fc788672fe','2024-05-04 11:07:39');
/*!40000 ALTER TABLE `churches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counties`
--

DROP TABLE IF EXISTS `counties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counties` (
  `name` varchar(128) NOT NULL,
  `id` varchar(60) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counties`
--

LOCK TABLES `counties` WRITE;
/*!40000 ALTER TABLE `counties` DISABLE KEYS */;
INSERT INTO `counties` VALUES ('Mombasa','06eaca64-bd53-4119-906e-9e40e2ef97cd','2024-05-03 13:30:45'),('Meru','1419283d-ca9d-42a2-9b04-45b530430a65','2024-05-03 13:30:47'),('Nairobi','1d62bb0d-7b72-4bef-bbc8-37b593c557b0','2024-05-21 18:04:08'),('Marsabit','421a55f1-7d82-45d9-b54c-a76916479545','2024-03-25 19:42:40'),('Nakuru','5c51be92-53d8-4c13-8519-829c3cad61f7','2024-05-21 18:08:28'),('Wajir','5d60b362-9737-48e5-8cd3-530032d705f9','2024-05-03 13:31:57'),('Kilifi','5e7a5c4f-54ca-4185-bf51-fa0ea1ea2aff','2024-05-22 11:15:48'),('Uasin Gishu','918f9c7a-f8d7-403c-bc5a-a6a18844896e','2024-05-03 16:08:46'),('Muranga','9dd5e428-dcf2-4bad-b655-b2a1778d77c3','2024-05-04 11:07:39'),('Busia','b420e4cd-018c-46ee-b66d-77056eb60d61','2024-05-22 08:46:54'),('Turkana','c1d0b577-368f-4d6f-b5ba-1abc80f51ec5','2024-05-03 16:28:38');
/*!40000 ALTER TABLE `counties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deptfinances`
--

DROP TABLE IF EXISTS `deptfinances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deptfinances` (
  `finance_type` varchar(128) NOT NULL,
  `amount` int DEFAULT NULL,
  `dated` datetime NOT NULL,
  `church_id` varchar(60) NOT NULL,
  `id` varchar(60) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `church_id` (`church_id`),
  CONSTRAINT `deptfinances_ibfk_1` FOREIGN KEY (`church_id`) REFERENCES `churches` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deptfinances`
--

LOCK TABLES `deptfinances` WRITE;
/*!40000 ALTER TABLE `deptfinances` DISABLE KEYS */;
INSERT INTO `deptfinances` VALUES ('Men\'s_Guild',48823,'2023-05-01 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','026048cf-81f5-4f00-a5e9-b56d891adb9c','2024-05-20 21:28:07'),('Men\'s_Guild',122186,'2024-01-02 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','2d99a1f1-ded7-426c-887f-7dba58ab165d','2024-05-20 21:28:06'),('Men\'s_Guild',100270,'2023-02-18 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','4e7010a5-e72e-4e95-9ba1-01f5eb63c3c7','2024-05-20 21:28:07'),('Men\'s_Guild',19119,'2023-09-09 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','501fc3aa-dd76-49a4-9663-b787c171c528','2024-05-21 18:22:34'),('Mother\'s_Union',112650,'2024-08-31 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','65b40ab0-4612-4d64-8aa0-bf1910c603aa','2024-05-21 18:22:35'),('Mother\'s_Union',58597,'2024-04-20 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','720b581e-6588-4e55-9f65-2af0b2e478a3','2024-05-21 18:22:34'),('Mother\'s_Union',102121,'2022-10-06 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','79911d82-a5f6-4358-923c-6069639e62a7','2024-05-20 21:28:06'),('Men\'s_Guild',155641,'2023-12-24 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','826ec140-c532-457f-bb19-ea59238d0923','2024-05-21 18:22:32'),('Mother\'s_Union',32926,'2024-04-13 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','884b5dba-abd5-492b-8804-0c29d3338b82','2024-05-20 21:28:06'),('Mother\'s_Union',52323,'2024-06-29 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','a9cd8239-27d8-44d9-977a-e51e2544dc3f','2024-05-21 18:22:33'),('Men\'s_Guild',137563,'2023-05-11 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','d3d2c7fb-e2aa-451d-b67b-ac1b4b4e746a','2024-05-21 18:22:32'),('Men\'s_Guild',141645,'2024-04-01 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','df1ff477-c95b-4693-a10e-2cb3b1ca0e2b','2024-05-21 18:22:32');
/*!40000 ALTER TABLE `deptfinances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infinances`
--

DROP TABLE IF EXISTS `infinances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infinances` (
  `finance_type` varchar(128) NOT NULL,
  `amount` int DEFAULT NULL,
  `dated` datetime NOT NULL,
  `church_id` varchar(60) NOT NULL,
  `id` varchar(60) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `church_id` (`church_id`),
  CONSTRAINT `infinances_ibfk_1` FOREIGN KEY (`church_id`) REFERENCES `churches` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infinances`
--

LOCK TABLES `infinances` WRITE;
/*!40000 ALTER TABLE `infinances` DISABLE KEYS */;
INSERT INTO `infinances` VALUES ('Offering',114916,'2024-09-22 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','01b51327-85d7-4a23-a1da-2c42e2109d79','2024-05-21 18:34:23'),('Offering',34289,'2024-06-14 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','029ec349-b97a-41f0-8b5c-d215e3b45f95','2024-05-21 18:34:21'),('Fundraiser',8144273,'2023-08-29 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','02ad0ea9-9b97-4440-8329-79d68f1b0605','2024-05-20 21:01:00'),('Donation',3127443,'2023-08-31 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','04659670-c9d2-4f52-836d-2fcaae409c86','2024-05-20 21:00:50'),('Fundraiser',3568192,'2020-06-06 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','05ed373a-0266-4316-a302-f2220795b0d3','2024-05-20 21:01:03'),('Fundraiser',6192390,'2022-02-19 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','0b635d99-f130-4c8e-acc5-a2138c04b7f8','2024-05-20 21:01:04'),('Tithe',13000,'2024-11-05 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','0e0168df-feec-423b-aa2f-8a2ac442ac63','2024-05-22 10:22:24'),('Grant',9669477,'2022-09-17 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','11528130-0676-4865-9eb2-cd4a9ed63581','2024-05-20 21:01:03'),('Grant',8372261,'2022-08-05 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','11c3cb06-ff81-4563-a898-2b37ab067ea3','2024-05-20 21:01:06'),('Donation',163253,'2024-06-30 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','12525674-428d-4ab4-a82b-a98cf06fed20','2024-05-21 18:34:20'),('Fundraiser',41531,'2024-01-07 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','13c23682-bafa-43d0-8ce4-026e82329176','2024-05-21 18:34:20'),('Fundraiser',7445455,'2024-01-31 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','1417a3aa-ba22-40a2-a83e-2683ad1d063a','2024-05-20 21:01:02'),('Offering',32312,'2024-01-24 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','15278f95-de8a-48b6-a462-6a0fa6e3484f','2024-05-21 18:34:21'),('Tithe',6622376,'2022-10-05 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','1960e358-71ae-49c0-93d2-d8087225cae9','2024-05-20 21:00:57'),('Fundraiser',4095,'2020-12-12 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','19ac89f2-d837-4013-bfb6-9b1206c2ce68','2024-05-20 21:01:04'),('Donation',4798060,'2024-01-10 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','1f7ede17-776a-4e27-bbaa-fcf2c331f80b','2024-05-20 21:00:53'),('Offering',7744773,'2020-07-16 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','1f845d48-7957-4666-ad25-0c1a405b71a6','2024-05-20 21:00:55'),('Tithe',366698,'2021-10-26 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','2774e2aa-0c3f-4798-97fc-fdb7f5fd10e6','2024-05-20 21:00:59'),('Offering',96509,'2023-10-16 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','2c36a6e5-7e42-47b9-8e36-8e88136feb47','2024-05-21 18:34:23'),('Fundraiser',403841,'2021-04-15 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','2d70776a-74de-4785-af7e-afbeb56df666','2024-05-20 21:01:07'),('Offering',158635,'2024-09-16 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','3133b728-003d-4aa6-bc3c-49d9e5e79b84','2024-05-21 18:34:21'),('Offering',5995278,'2022-07-08 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','36f551fb-adb4-4c4e-ae13-7c0250d34f42','2024-05-20 21:00:57'),('Offering',9859573,'2023-04-09 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','3a00fdd3-d073-4eec-9a54-6783acda3e07','2024-05-20 21:01:00'),('Offering',8575165,'2020-11-30 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','3bcb4da4-3c82-4e83-a36b-2ff838001dd3','2024-05-20 21:01:02'),('Others',118302,'2023-11-20 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','3e094658-133e-413a-b0a9-4f35165f69a4','2024-05-21 18:34:21'),('Offering',6894917,'2023-02-06 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','4092ebf5-2f1d-40ab-8f94-88c003b5d147','2024-05-20 21:00:57'),('Tithe',4487,'2023-03-20 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','42dfd10f-72de-4232-a9ca-079c94e37b09','2024-05-21 18:34:23'),('Grant',8308802,'2024-04-29 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','43b44883-bb56-4425-a998-fd87b8d802ef','2024-05-20 21:01:01'),('Donation',1264413,'2021-03-13 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','49b6aa1e-67c6-40c7-a355-7ec546df9f21','2024-05-20 21:01:00'),('Fundraiser',5618832,'2023-09-29 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','4a843f49-f59d-45eb-a20d-151a425cebc3','2024-05-20 21:00:52'),('Donation',6601718,'2023-01-26 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','4bc364ae-9d31-4ebb-b03e-2553e419dc15','2024-05-20 21:01:02'),('Grants',71863,'2023-08-07 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','4eafde98-c716-4586-80a4-ab040d256dfd','2024-05-21 18:34:19'),('Fundraiser',4731912,'2023-07-06 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','4ee4c7a3-4bb9-4ec1-8510-7e466ae2cab3','2024-05-20 21:00:58'),('Tithe',6867171,'2020-06-11 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','4fdfc56a-837b-4c58-ae54-795910c6d33b','2024-05-20 21:01:01'),('Offering',4151,'2021-12-21 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','579ab573-7ae0-4503-9d35-ed8fe4aaf26e','2024-05-20 20:27:46'),('Donation',2924583,'2020-06-20 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','591ac51a-b532-4cbf-9fd9-6db9fd1d9ca3','2024-05-20 21:01:00'),('Donation',52092,'2024-08-07 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','5b784282-a649-4583-a4d8-0e5bd9e044f2','2024-05-21 18:34:20'),('Offering',9983611,'2023-07-02 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','5d0a3cec-282f-4df9-94da-7e0c73474e39','2024-05-20 21:00:58'),('Grants',172589,'2023-10-02 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','67ea0025-ba49-443b-afca-aac7b9c8c8c8','2024-05-21 18:34:20'),('Grant',9200228,'2022-12-13 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','6b3149d6-a4ac-452c-a2d3-8f74f4325f7b','2024-05-20 21:01:08'),('Offering',7104265,'2023-11-07 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','6b862706-baf6-4778-a242-792d86b78d4b','2024-05-20 21:01:00'),('Grant',4576880,'2023-11-23 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','6d79c71e-fc81-4f5c-9c32-8a7a6458ba29','2024-05-20 21:01:02'),('Offering',5057700,'2023-10-21 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','6db31d2c-faa9-40c4-a616-fc78d7019d11','2024-05-20 21:01:03'),('Offering',43230,'2024-06-14 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','6f3372cc-483b-4c91-bf14-3abdc4715eea','2024-05-21 18:34:21'),('Others',179418,'2024-08-28 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','761d0438-518f-456d-929d-7d717f9b9f6a','2024-05-21 18:34:20'),('Offering',1719551,'2024-03-25 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','7ce8ef6a-2cb5-4fae-b332-508f4f05b817','2024-05-20 21:01:06'),('Fundraiser',7244844,'2023-10-19 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','7f2d2595-bc6a-4a5c-a835-dec743f19659','2024-05-20 21:00:58'),('Tithe',13500,'2024-11-05 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','82b9f3c4-4540-40a8-bd8a-b98211b446bc','2024-05-22 10:23:35'),('Donation',6269597,'2020-12-24 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','847a33aa-d1b6-4c2b-82e4-e5ab8b556099','2024-05-20 21:01:01'),('Tithe',3526938,'2020-07-13 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','892c75d4-3c4f-48f1-a420-aaa95893501a','2024-05-20 21:01:00'),('Donation',2299733,'2021-04-15 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','8cc6b336-8d31-4a49-8fe2-dcfd6c39d9f8','2024-05-20 21:01:02'),('Donation',160925,'2024-09-19 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','8d27d5f5-b9b1-404e-8087-db016d0d5680','2024-05-21 18:34:20'),('Fundraiser',2049196,'2022-12-17 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','907ef600-bf61-4f00-ba9c-2d83e3abccdc','2024-05-20 21:00:57'),('Fundraiser',84250,'2023-08-16 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','942d8f73-3bb0-4487-8635-d5c9b5d634bb','2024-05-21 18:34:20'),('Offering',101743,'2024-02-19 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','97cd34a2-fbea-4db7-845f-28a3634d6efc','2024-05-21 18:34:21'),('Others',141103,'2023-01-25 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','999c3b99-714c-40b2-a151-a1657f4418a0','2024-05-21 18:34:23'),('Fundraiser',9846554,'2023-01-03 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','9a6b9249-4183-4e6a-8bec-cc0290bef96e','2024-05-20 21:01:06'),('Grant',3518956,'2024-02-27 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','9ade92c2-19ac-47b9-8625-000cd738d4ee','2024-05-20 21:01:06'),('Fundraiser',59512,'2024-08-21 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','9cc3cd10-2298-44fb-94cb-e60dde1b2157','2024-05-21 18:34:20'),('Donation',13063,'2023-05-05 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','a3844083-16f9-484d-b789-9c78dfc94573','2024-05-21 18:34:19'),('Donation',2605396,'2020-12-18 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','a7e3c50f-0a89-44b9-8c5c-7ae87773f68e','2024-05-20 21:00:56'),('Grant',7235218,'2022-08-16 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','adfc497d-66b0-4c6b-9465-2ce019c37c80','2024-05-20 21:01:00'),('Tithe',13600,'2024-11-05 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','b61e2bd9-d60a-4811-9892-7bc1672a925e','2024-05-22 10:33:11'),('Donation',2042837,'2022-05-22 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','b77b385e-a7b2-44bc-8646-95040dbd9581','2024-05-20 21:01:03'),('Offering',5239298,'2020-05-23 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','bfb03d41-e9b9-4bc6-8926-2d152f59d8f9','2024-05-20 21:01:07'),('Offering',183547,'2024-05-04 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','c40ece5b-2345-47d7-9ac3-05a7a9255e6f','2024-05-21 18:34:21'),('Offering',151367,'2024-03-19 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','c8086efb-457c-4d0a-870d-556b54a2dfeb','2024-05-21 18:34:23'),('Tithe',8419777,'2020-10-07 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','c91058c6-70c6-4486-abf9-1caf6e44dbdf','2024-05-20 21:00:47'),('Grants',54980,'2024-04-03 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','d0a1b231-5fa9-4b16-a90c-b85bd3be7af8','2024-05-21 18:34:23'),('Offering',173150,'2023-01-27 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','d11e5f31-b143-4666-b466-e872ce1e2256','2024-05-21 18:34:21'),('Tithe',13600,'2024-12-05 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','d7e1af33-4263-4b89-847d-10193fdd06e0','2024-05-22 10:35:03'),('Tithe',4056652,'2023-08-15 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','d808c9ae-4450-45e2-8f39-240e4451826b','2024-05-20 21:00:58'),('Grant',8732675,'2023-02-03 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','db534418-938a-4193-8747-0114416239aa','2024-05-20 21:00:58'),('Grant',8786233,'2021-03-20 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','ee5e774b-c7d0-43cb-b30a-97c0f5438f0f','2024-05-20 21:01:04'),('Grants',47039,'2023-11-18 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','ee961fce-1e56-4bf0-b784-8bf5e52d5dae','2024-05-21 18:34:19'),('Grant',9000995,'2023-04-24 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','ef8bf753-d52d-4ec0-be94-6bc97269d300','2024-05-20 21:00:59'),('Donation',9986776,'2024-05-09 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','f49c4497-7a45-41a5-93f3-0eaa7a3421f5','2024-05-20 14:02:39'),('Tithe',108547,'2023-03-08 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','f6ae5afd-baad-41bb-9d5a-a2cb6c3dbe05','2024-05-21 18:34:19'),('Grant',865734,'2022-07-17 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','f73f763e-ffa5-4a35-a5e6-13aaa1f0b90e','2024-05-20 21:00:48'),('Grant',6975439,'2023-11-16 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','f7431dec-161a-4701-b73e-a0d5b61d624e','2024-05-20 21:01:00'),('Offering',176481,'2024-03-04 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','f9054648-46ef-4e52-957d-3c26fe448854','2024-05-21 18:34:20'),('Donation',179471,'2023-09-16 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','fb3abdfa-de33-4e77-bf4b-6af30efdac49','2024-05-21 18:34:20');
/*!40000 ALTER TABLE `infinances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outfinances`
--

DROP TABLE IF EXISTS `outfinances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outfinances` (
  `finance_type` varchar(128) NOT NULL,
  `amount` int DEFAULT NULL,
  `dated` datetime NOT NULL,
  `church_id` varchar(60) NOT NULL,
  `id` varchar(60) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `church_id` (`church_id`),
  CONSTRAINT `outfinances_ibfk_1` FOREIGN KEY (`church_id`) REFERENCES `churches` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outfinances`
--

LOCK TABLES `outfinances` WRITE;
/*!40000 ALTER TABLE `outfinances` DISABLE KEYS */;
INSERT INTO `outfinances` VALUES ('Hospital_Project',149451,'2023-06-15 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','02cef755-48cc-42e8-9149-ea991ce566cc','2024-05-20 21:29:43'),('Other',140915,'2023-12-17 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','02fd8d02-3fed-4b42-acd3-a1bd7fe5503b','2024-05-21 18:43:46'),('School_Project',184549,'2023-06-21 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','052df298-80f5-4b6d-9e7d-05c8fe8273e9','2024-05-20 21:29:43'),('Hospital_Project',149451,'2023-06-15 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','07a85e26-370a-4cf1-a248-231434087423','2024-05-21 18:43:45'),('Other',122692,'2024-05-14 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','15d9dd97-376c-4a3d-b6ab-32925bd1764f','2024-05-20 21:29:42'),('School_Project',81979,'2024-09-09 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','1b752ef1-0f76-4a38-99be-4c7d83e66786','2024-05-20 21:29:45'),('Other',181491,'2023-02-11 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','1e85cf1b-ca83-425a-9816-f54ac7e0ea7a','2024-05-20 21:29:42'),('Other',171516,'2023-11-18 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','2664ef4e-164e-48dd-86ae-2e7df680db5c','2024-05-21 18:43:48'),('Childrens_Home',154705,'2023-08-08 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','29fd6367-80da-4341-ab2c-518aeea6deaa','2024-05-20 21:29:43'),('School_Project',93769,'2023-12-17 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','2d009a72-3585-455a-9ed8-2c853ebd5b27','2024-05-20 21:29:44'),('Childrens_Home',117659,'2023-02-21 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','2d2ba28e-415d-4284-8449-3b10bfb6d1bc','2024-05-21 18:43:48'),('Other',177318,'2024-04-15 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','3418d62c-9c15-44bd-9220-a2a01e326f16','2024-05-21 18:43:46'),('School_Project',184294,'2023-01-15 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','3e8399c1-c34d-4c60-a383-79afdbec5f17','2024-05-21 18:43:46'),('Other',181491,'2023-02-11 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','41e5fcc3-ae94-47b6-8936-f57a00f0f545','2024-05-21 18:43:45'),('Other',1038,'2024-07-07 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','429a0247-e0ff-4189-860f-c691cb7033a4','2024-05-20 21:29:45'),('School_Project',18165,'2024-05-31 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','44d8b0e5-2027-411c-ae02-63683fa85644','2024-05-20 21:29:42'),('School_Project',38040,'2024-05-07 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','468cd2ef-9f91-46d5-8781-9257f9e89cc5','2024-05-21 18:43:47'),('Childrens_Home',13368,'2023-09-18 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','4e554e83-cc6e-429e-886a-de7d528113cd','2024-05-20 21:29:43'),('Salary',38118,'2023-04-13 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','4fb03545-df85-4787-8456-cf7e392e3d33','2024-05-20 21:29:46'),('School_Project',184294,'2023-01-15 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','597d608a-e7db-491c-9813-cd6e0f43ed92','2024-05-20 21:29:43'),('Childrens_Home',13368,'2023-09-18 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','62a45599-ade3-4bb2-98c9-4fb336f878e8','2024-05-21 18:43:45'),('Salary',38118,'2023-04-13 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','6389a439-c05d-44c6-9627-07afdbaba983','2024-05-21 18:43:48'),('School_Project',38040,'2024-05-07 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','6d40d500-aa5a-4b00-b288-121b0e7d118d','2024-05-20 21:29:44'),('Salary',121074,'2024-05-25 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','77c51227-a305-4fae-9b5f-41db206c5f5f','2024-05-20 21:04:33'),('School_Project',81979,'2024-09-09 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','799c14c3-d4be-44ab-bb64-6c64672ffe1b','2024-05-21 18:43:48'),('Other',40541,'2023-10-09 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','79da9499-f2c7-4e50-8c59-7b027fb640bf','2024-05-21 18:43:44'),('School_Project',127463,'2023-05-06 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','7cf74de5-8dc9-49a9-afad-b9ab2c71ab77','2024-05-20 21:29:46'),('Other',36582,'2022-11-01 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','83cb6608-7e87-457c-93d8-b94ee2b462eb','2024-05-20 21:29:42'),('Other',171516,'2023-11-18 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','895b544e-5c18-4b55-b8e4-65c8fb707117','2024-05-20 21:29:46'),('Other',177318,'2024-04-15 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','8ddd83f5-e24f-41bc-b754-651418c2f69d','2024-05-20 21:29:43'),('Salary',136872,'2024-07-13 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','8f2156ca-7fcd-48c1-bc50-9fa44359866e','2024-05-20 21:29:46'),('Salary',152027,'2023-04-30 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','94c253f1-d1d5-4f70-b995-36ac9f817d0c','2024-05-21 18:43:47'),('Other',172259,'2024-07-06 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','984c3762-739e-4d33-bb80-70d16d6cdb4f','2024-05-21 18:43:47'),('Hospital_Project',121213,'2024-10-02 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','99e66b73-e34d-4b8e-a6a0-d02297ae9507','2024-05-20 21:29:42'),('Salary',152027,'2023-04-30 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','9e529e58-4fd9-4c36-8ed6-930e07c0f1bf','2024-05-20 21:29:44'),('Salary',102188,'2022-10-17 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','a6b0b7af-8ea3-4df9-a1dd-fdd5a469560c','2024-05-21 18:43:46'),('Other',36582,'2022-11-01 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','ad19b975-8765-4a28-a998-1fa391c4b956','2024-05-21 18:43:45'),('Other',40541,'2023-10-09 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','b0748159-f60f-4f01-b181-011ac43b73ab','2024-05-20 21:29:42'),('Other',140915,'2023-12-17 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','b5c03272-2552-404c-bca3-9e0b5a541de5','2024-05-20 21:29:43'),('Other',80949,'2023-10-24 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','bc8c2587-f631-4e36-b4a3-e93683f198c2','2024-05-20 21:29:44'),('Salary',102188,'2022-10-17 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','c785a265-fa9b-4ba3-a228-f4cf36e8d4d1','2024-05-20 21:29:44'),('Other',80949,'2023-10-24 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','c9830735-fc28-4e3c-80f7-ae4d9b282da6','2024-05-21 18:43:47'),('School_Project',127463,'2023-05-06 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','cc5781b8-60ac-4911-8a84-56d809acea2e','2024-05-21 18:43:48'),('School_Project',184549,'2023-06-21 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','cc8fabdb-403f-4ae9-9b16-272e841ab85f','2024-05-21 18:43:45'),('Childrens_Home',154705,'2023-08-08 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','d6c16f3f-d594-4bdc-b383-bc4117f85091','2024-05-21 18:43:45'),('Other',122692,'2024-05-14 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','db185b19-5c56-449d-bc42-bfb5ec3103d3','2024-05-21 18:43:45'),('School_Project',93769,'2023-12-17 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','dd892d0b-c6ac-480b-9d59-853693291544','2024-05-21 18:43:47'),('Other',172259,'2024-07-06 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','e046bc4a-b5e4-4506-8203-2b6ceaea2dca','2024-05-20 21:29:44'),('Childrens_Home',117659,'2023-02-21 00:00:00','876693a6-5d5f-4c19-b3c8-314fc5b101a2','e2ca52cc-40db-4600-8467-0de877deb9d7','2024-05-20 21:29:46'),('School_Project',18165,'2024-05-31 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','e8cec47e-28be-4fbb-848c-fc477ee64b02','2024-05-21 18:43:45'),('Salary',136872,'2024-07-13 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','f3b9ce77-1320-4f6f-8803-be6899bab9cc','2024-05-21 18:43:48'),('Hospital_Project',121213,'2024-10-02 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','f471a057-42f8-4c68-8f6c-c418d93ef610','2024-05-21 18:43:45'),('Other',1038,'2024-07-07 00:00:00','5c7e6b1b-c69c-43e4-a698-807f822af973','fa7e149d-c96f-4a50-8888-a4deb5291d11','2024-05-21 18:43:48');
/*!40000 ALTER TABLE `outfinances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcounties`
--

DROP TABLE IF EXISTS `subcounties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcounties` (
  `name` varchar(128) NOT NULL,
  `county_id` varchar(60) NOT NULL,
  `id` varchar(60) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `county_id` (`county_id`),
  CONSTRAINT `subcounties_ibfk_1` FOREIGN KEY (`county_id`) REFERENCES `counties` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcounties`
--

LOCK TABLES `subcounties` WRITE;
/*!40000 ALTER TABLE `subcounties` DISABLE KEYS */;
INSERT INTO `subcounties` VALUES ('Imenti North','1419283d-ca9d-42a2-9b04-45b530430a65','0782b5dd-5ef9-4529-a258-be5fcf3adecb','2024-05-03 13:30:48'),('Nyali','06eaca64-bd53-4119-906e-9e40e2ef97cd','127dfa5b-9fbb-457d-9bf6-0d155d1fe09f','2024-05-03 13:30:48'),('Likoni','06eaca64-bd53-4119-906e-9e40e2ef97cd','1d1a3846-0741-4a17-bcea-4e11482792aa','2024-05-03 13:30:48'),('Loima','c1d0b577-368f-4d6f-b5ba-1abc80f51ec5','429197b1-8f9a-4a7a-b67c-390a94c5bd47','2024-05-03 16:28:38'),('Kandara','9dd5e428-dcf2-4bad-b655-b2a1778d77c3','5c61059f-5523-4449-94aa-d779e1a3af91','2024-05-04 11:07:39'),('Naivasha','5c51be92-53d8-4c13-8519-829c3cad61f7','b12d46f2-b287-4ef3-b468-fd339b852f35','2024-05-21 18:08:28'),('Westlands','1d62bb0d-7b72-4bef-bbc8-37b593c557b0','f4e039f4-41b6-4e5a-8f03-a5ecf7e3b51f','2024-05-21 18:04:08');
/*!40000 ALTER TABLE `subcounties` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23 13:20:02