-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: covid-dashboard
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.27-MariaDB

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
-- Table structure for table `covid_daily_stats`
--

DROP TABLE IF EXISTS `covid_daily_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `covid_daily_stats` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `iso` char(3) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `confirmed` int(11) NOT NULL,
  `confirmed_diff` int(11) DEFAULT NULL,
  `deaths` int(11) NOT NULL,
  `deaths_diff` int(11) DEFAULT NULL,
  `recovered` int(11) NOT NULL,
  `recovered_diff` int(11) DEFAULT NULL,
  `active` int(11) NOT NULL,
  `active_diff` int(11) DEFAULT NULL,
  `fatality_rate` decimal(10,4) DEFAULT NULL,
  `cities` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `covid_daily_stats`
--

LOCK TABLES `covid_daily_stats` WRITE;
/*!40000 ALTER TABLE `covid_daily_stats` DISABLE KEYS */;
INSERT INTO `covid_daily_stats` VALUES (1,'2020-03-14','ABW','2020-03-13 16:53:03',2,0,0,0,0,0,2,0,0.0000,NULL,'2025-08-29 00:48:02'),(2,'2020-03-14','AFG','2020-03-14 07:53:04',11,4,0,0,0,0,11,4,0.0000,NULL,'2025-08-29 00:48:02'),(3,'2020-03-14','ALB','2020-03-14 05:33:03',38,5,1,0,0,0,37,5,0.0263,NULL,'2025-08-29 00:48:02'),(4,'2020-03-14','AND','2020-03-13 15:22:02',1,0,0,0,1,1,0,-1,0.0000,NULL,'2025-08-29 00:48:02'),(5,'2020-03-15','ABW','2020-03-13 16:53:03',2,0,0,0,0,0,2,0,0.0000,NULL,'2025-08-29 00:51:03'),(6,'2020-03-15','AFG','2020-03-15 11:20:18',16,5,0,0,0,0,16,5,0.0000,NULL,'2025-08-29 00:51:03'),(7,'2020-03-15','ALB','2020-03-15 11:20:18',42,4,1,0,0,0,41,4,0.0238,NULL,'2025-08-29 00:51:03'),(8,'2020-03-15','AND','2020-03-13 15:22:02',1,0,0,0,1,0,0,0,0.0000,NULL,'2025-08-29 00:51:03'),(9,'2020-03-13','AFG','2020-03-11 13:00:00',7,0,0,0,0,0,7,0,0.0000,NULL,'2025-08-29 01:41:03'),(10,'2020-03-13','ALB','2020-03-11 13:00:00',33,10,1,0,0,0,32,10,0.0303,NULL,'2025-08-29 01:41:03'),(11,'2020-03-13','AND','2020-03-11 13:00:00',1,0,0,0,0,-1,1,1,0.0000,NULL,'2025-08-29 01:41:03');
/*!40000 ALTER TABLE `covid_daily_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `iso` char(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`iso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES ('ABW','Aruba','2025-08-29 01:45:01'),('AFG','Afghanistan','2025-08-29 01:45:01'),('AGO','Angola','2025-08-29 01:45:01'),('ALB','Albania','2025-08-29 01:45:01'),('AND','Andorra','2025-08-29 01:45:01'),('ARE','United Arab Emirates','2025-08-29 01:45:01'),('ARG','Argentina','2025-08-29 01:45:01'),('ARM','Armenia','2025-08-29 01:45:01'),('ATG','Antigua and Barbuda','2025-08-29 01:45:01'),('AUS','Australia','2025-08-29 01:45:01'),('AUT','Austria','2025-08-29 01:45:01'),('AZE','Azerbaijan','2025-08-29 01:45:01'),('BDI','Burundi','2025-08-29 01:45:01'),('BEL','Belgium','2025-08-29 01:45:01'),('BEN','Benin','2025-08-29 01:45:01'),('BFA','Burkina Faso','2025-08-29 01:45:01'),('BGD','Bangladesh','2025-08-29 01:45:01'),('BGR','Bulgaria','2025-08-29 01:45:01'),('BHR','Bahrain','2025-08-29 01:45:01'),('BHS','Bahamas','2025-08-29 01:45:01'),('BIH','Bosnia and Herzegovina','2025-08-29 01:45:01'),('BLM','Saint Barthelemy','2025-08-29 01:45:01'),('BLR','Belarus','2025-08-29 01:45:01'),('BLZ','Belize','2025-08-29 01:45:01'),('BOL','Bolivia','2025-08-29 01:45:01'),('BRA','Brazil','2025-08-29 01:45:01'),('BRB','Barbados','2025-08-29 01:45:01'),('BRN','Brunei','2025-08-29 01:45:01'),('BTN','Bhutan','2025-08-29 01:45:01'),('BWA','Botswana','2025-08-29 01:45:01'),('CAF','Central African Republic','2025-08-29 01:45:01'),('CAN','Canada','2025-08-29 01:45:01'),('CHE','Switzerland','2025-08-29 01:45:01'),('CHL','Chile','2025-08-29 01:45:01'),('CHN','China','2025-08-29 01:45:01'),('CIV','Cote d\'Ivoire','2025-08-29 01:45:01'),('CMR','Cameroon','2025-08-29 01:45:01'),('COD','Congo (Kinshasa)','2025-08-29 01:45:01'),('COG','Congo (Brazzaville)','2025-08-29 01:45:01'),('COL','Colombia','2025-08-29 01:45:01'),('COM','Comoros','2025-08-29 01:45:01'),('CPV','Cabo Verde','2025-08-29 01:45:01'),('CRI','Costa Rica','2025-08-29 01:45:01'),('cru','Cruise Ship','2025-08-29 01:45:01'),('CUB','Cuba','2025-08-29 01:45:01'),('CUW','Curacao','2025-08-29 01:45:01'),('CYM','Cayman Islands','2025-08-29 01:45:01'),('CYP','Cyprus','2025-08-29 01:45:01'),('CZE','Czechia','2025-08-29 01:45:01'),('DEU','Germany','2025-08-29 01:45:01'),('DJI','Djibouti','2025-08-29 01:45:01'),('DMA','Dominica','2025-08-29 01:45:01'),('DNK','Denmark','2025-08-29 01:45:01'),('DOM','Dominican Republic','2025-08-29 01:45:01'),('DZA','Algeria','2025-08-29 01:45:01'),('ECU','Ecuador','2025-08-29 01:45:01'),('EGY','Egypt','2025-08-29 01:45:01'),('ERI','Eritrea','2025-08-29 01:45:01'),('ESH','Western Sahara','2025-08-29 01:45:01'),('ESP','Spain','2025-08-29 01:45:01'),('EST','Estonia','2025-08-29 01:45:01'),('ETH','Ethiopia','2025-08-29 01:45:01'),('FIN','Finland','2025-08-29 01:45:01'),('FJI','Fiji','2025-08-29 01:45:01'),('FRA','France','2025-08-29 01:45:01'),('FRO','Faroe Islands','2025-08-29 01:45:01'),('GAB','Gabon','2025-08-29 01:45:01'),('GBR','United Kingdom','2025-08-29 01:45:01'),('GEO','Georgia','2025-08-29 01:45:01'),('GGY','Guernsey','2025-08-29 01:45:01'),('GHA','Ghana','2025-08-29 01:45:01'),('GIB','Gibraltar','2025-08-29 01:45:01'),('GIN','Guinea','2025-08-29 01:45:01'),('GLP','Guadeloupe','2025-08-29 01:45:01'),('GMB','Gambia','2025-08-29 01:45:01'),('GNB','Guinea-Bissau','2025-08-29 01:45:01'),('GNQ','Equatorial Guinea','2025-08-29 01:45:01'),('GRC','Greece','2025-08-29 01:45:01'),('GRD','Grenada','2025-08-29 01:45:01'),('GRL','Greenland','2025-08-29 01:45:01'),('GTM','Guatemala','2025-08-29 01:45:01'),('GUF','French Guiana','2025-08-29 01:45:01'),('GUM','Guam','2025-08-29 01:45:01'),('GUY','Guyana','2025-08-29 01:45:01'),('HND','Honduras','2025-08-29 01:45:01'),('HRV','Croatia','2025-08-29 01:45:01'),('HTI','Haiti','2025-08-29 01:45:01'),('HUN','Hungary','2025-08-29 01:45:01'),('IDN','Indonesia','2025-08-29 01:45:01'),('IND','India','2025-08-29 01:45:01'),('IRL','Ireland','2025-08-29 01:45:01'),('IRN','Iran','2025-08-29 01:45:01'),('IRQ','Iraq','2025-08-29 01:45:01'),('ISL','Iceland','2025-08-29 01:45:01'),('ISR','Israel','2025-08-29 01:45:01'),('ITA','Italy','2025-08-29 01:45:01'),('JAM','Jamaica','2025-08-29 01:45:01'),('JEY','Jersey','2025-08-29 01:45:01'),('JOR','Jordan','2025-08-29 01:45:01'),('JPN','Japan','2025-08-29 01:45:01'),('KAZ','Kazakhstan','2025-08-29 01:45:01'),('KEN','Kenya','2025-08-29 01:45:01'),('KGZ','Kyrgyzstan','2025-08-29 01:45:01'),('KHM','Cambodia','2025-08-29 01:45:01'),('KIR','Kiribati','2025-08-29 01:45:01'),('KNA','Saint Kitts and Nevis','2025-08-29 01:45:01'),('KOR','Korea, South','2025-08-29 01:45:01'),('KWT','Kuwait','2025-08-29 01:45:01'),('LAO','Laos','2025-08-29 01:45:01'),('LBN','Lebanon','2025-08-29 01:45:01'),('LBR','Liberia','2025-08-29 01:45:01'),('LBY','Libya','2025-08-29 01:45:01'),('LCA','Saint Lucia','2025-08-29 01:45:01'),('LIE','Liechtenstein','2025-08-29 01:45:01'),('LKA','Sri Lanka','2025-08-29 01:45:01'),('LSO','Lesotho','2025-08-29 01:45:01'),('LTU','Lithuania','2025-08-29 01:45:01'),('LUX','Luxembourg','2025-08-29 01:45:01'),('LVA','Latvia','2025-08-29 01:45:01'),('MAC','Macao SAR','2025-08-29 01:45:01'),('MAF','Saint Martin','2025-08-29 01:45:01'),('MAR','Morocco','2025-08-29 01:45:01'),('MCO','Monaco','2025-08-29 01:45:01'),('MDA','Moldova','2025-08-29 01:45:01'),('MDG','Madagascar','2025-08-29 01:45:01'),('MDV','Maldives','2025-08-29 01:45:01'),('MEX','Mexico','2025-08-29 01:45:01'),('MHL','Marshall Islands','2025-08-29 01:45:01'),('MKD','North Macedonia','2025-08-29 01:45:01'),('MLI','Mali','2025-08-29 01:45:01'),('MLT','Malta','2025-08-29 01:45:01'),('MMR','Burma','2025-08-29 01:45:01'),('MNE','Montenegro','2025-08-29 01:45:01'),('MNG','Mongolia','2025-08-29 01:45:01'),('MOZ','Mozambique','2025-08-29 01:45:01'),('MRT','Mauritania','2025-08-29 01:45:01'),('MTQ','Martinique','2025-08-29 01:45:01'),('MUS','Mauritius','2025-08-29 01:45:01'),('MWI','Malawi','2025-08-29 01:45:01'),('MYS','Malaysia','2025-08-29 01:45:01'),('MYT','Mayotte','2025-08-29 01:45:01'),('NA-','MS Zaandam','2025-08-29 01:45:01'),('NAM','Namibia','2025-08-29 01:45:01'),('NER','Niger','2025-08-29 01:45:01'),('NGA','Nigeria','2025-08-29 01:45:01'),('NIC','Nicaragua','2025-08-29 01:45:01'),('NLD','Netherlands','2025-08-29 01:45:01'),('NOR','Norway','2025-08-29 01:45:01'),('NPL','Nepal','2025-08-29 01:45:01'),('NRU','Nauru','2025-08-29 01:45:01'),('NZL','New Zealand','2025-08-29 01:45:01'),('OMN','Oman','2025-08-29 01:45:01'),('Oth','Others','2025-08-29 01:45:01'),('PAK','Pakistan','2025-08-29 01:45:01'),('PAN','Panama','2025-08-29 01:45:01'),('PER','Peru','2025-08-29 01:45:01'),('PHL','Philippines','2025-08-29 01:45:01'),('PLW','Palau','2025-08-29 01:45:01'),('PNG','Papua New Guinea','2025-08-29 01:45:01'),('POL','Poland','2025-08-29 01:45:01'),('PRI','Puerto Rico','2025-08-29 01:45:01'),('PRT','Portugal','2025-08-29 01:45:01'),('PRY','Paraguay','2025-08-29 01:45:01'),('PSE','West Bank and Gaza','2025-08-29 01:45:01'),('QAT','Qatar','2025-08-29 01:45:01'),('REU','Reunion','2025-08-29 01:45:01'),('RKS','Kosovo','2025-08-29 01:45:01'),('ROU','Romania','2025-08-29 01:45:01'),('RUS','Russia','2025-08-29 01:45:01'),('RWA','Rwanda','2025-08-29 01:45:01'),('SAU','Saudi Arabia','2025-08-29 01:45:01'),('SDN','Sudan','2025-08-29 01:45:01'),('SEN','Senegal','2025-08-29 01:45:01'),('SGP','Singapore','2025-08-29 01:45:01'),('SLB','Solomon Islands','2025-08-29 01:45:01'),('SLE','Sierra Leone','2025-08-29 01:45:01'),('SLV','El Salvador','2025-08-29 01:45:01'),('SMR','San Marino','2025-08-29 01:45:01'),('SOM','Somalia','2025-08-29 01:45:01'),('SRB','Serbia','2025-08-29 01:45:01'),('SSD','South Sudan','2025-08-29 01:45:01'),('STP','Sao Tome and Principe','2025-08-29 01:45:01'),('SUR','Suriname','2025-08-29 01:45:01'),('SVK','Slovakia','2025-08-29 01:45:01'),('SVN','Slovenia','2025-08-29 01:45:01'),('SWE','Sweden','2025-08-29 01:45:01'),('SWZ','Eswatini','2025-08-29 01:45:01'),('SYC','Seychelles','2025-08-29 01:45:01'),('SYR','Syria','2025-08-29 01:45:01'),('TCD','Chad','2025-08-29 01:45:01'),('TGO','Togo','2025-08-29 01:45:01'),('THA','Thailand','2025-08-29 01:45:01'),('TJK','Tajikistan','2025-08-29 01:45:01'),('TLS','Timor-Leste','2025-08-29 01:45:01'),('TON','Tonga','2025-08-29 01:45:01'),('TTO','Trinidad and Tobago','2025-08-29 01:45:01'),('TUN','Tunisia','2025-08-29 01:45:01'),('TUR','Turkey','2025-08-29 01:45:01'),('TUV','Tuvalu','2025-08-29 01:45:01'),('TWN','Taiwan*','2025-08-29 01:45:01'),('TZA','Tanzania','2025-08-29 01:45:01'),('UGA','Uganda','2025-08-29 01:45:01'),('UKR','Ukraine','2025-08-29 01:45:01'),('URY','Uruguay','2025-08-29 01:45:01'),('USA','US','2025-08-29 01:45:01'),('UZB','Uzbekistan','2025-08-29 01:45:01'),('VAT','Holy See','2025-08-29 01:45:01'),('VCT','Saint Vincent and the Grenadines','2025-08-29 01:45:01'),('VEN','Venezuela','2025-08-29 01:45:01'),('VNM','Vietnam','2025-08-29 01:45:01'),('VUT','Vanuatu','2025-08-29 01:45:01'),('WSM','Samoa','2025-08-29 01:45:01'),('YEM','Yemen','2025-08-29 01:45:01'),('ZAF','South Africa','2025-08-29 01:45:01'),('ZMB','Zambia','2025-08-29 01:45:01'),('ZWE','Zimbabwe','2025-08-29 01:45:01');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'covid-dashboard'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-29  9:25:46
