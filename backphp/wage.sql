-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: wage
-- ------------------------------------------------------
-- Server version	5.5.53-0ubuntu0.14.04.1

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
-- Table structure for table `bonus`
--

DROP TABLE IF EXISTS `bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonus` (
  `employeeNo` char(4) NOT NULL,
  `bonusDate` date NOT NULL,
  `bonusAmount` float NOT NULL,
  `bonusTypeNo` char(5) NOT NULL,
  PRIMARY KEY (`employeeNo`,`bonusDate`),
  KEY `F_bonus_bonusTypeNo` (`bonusTypeNo`),
  CONSTRAINT `F_bonus_employeeNo` FOREIGN KEY (`employeeNo`) REFERENCES `employee` (`employeeNo`),
  CONSTRAINT `F_bonus_bonusTypeNo` FOREIGN KEY (`bonusTypeNo`) REFERENCES `bonustype` (`bonusTypeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonus`
--

LOCK TABLES `bonus` WRITE;
/*!40000 ALTER TABLE `bonus` DISABLE KEYS */;
INSERT INTO `bonus` VALUES ('0001','2017-05-10',500000,'b0001'),('0038','2017-09-12',88888,'b0038'),('0124','2017-07-20',30000,'b0124'),('1742','2017-05-05',5000,'b1742');
/*!40000 ALTER TABLE `bonus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonustype`
--

DROP TABLE IF EXISTS `bonustype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonustype` (
  `bonusTypeNo` char(5) NOT NULL,
  `bonusDescription` varchar(40) NOT NULL,
  PRIMARY KEY (`bonusTypeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonustype`
--

LOCK TABLES `bonustype` WRITE;
/*!40000 ALTER TABLE `bonustype` DISABLE KEYS */;
INSERT INTO `bonustype` VALUES ('b0001','推出企业改革方案'),('b0038','出勤率满勤'),('b0124','促进项目的完成'),('b1742','工作认真负责'),('b3123','45754过'),('b4231','535');
/*!40000 ALTER TABLE `bonustype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deduction`
--

DROP TABLE IF EXISTS `deduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deduction` (
  `employeeNo` char(4) NOT NULL,
  `deductDate` date NOT NULL,
  `deductAmount` float NOT NULL,
  `deductTypeNo` char(5) NOT NULL,
  PRIMARY KEY (`employeeNo`,`deductDate`),
  KEY `F_deduction_deductTypeNo` (`deductTypeNo`),
  CONSTRAINT `F_deduction_employeeNo` FOREIGN KEY (`employeeNo`) REFERENCES `employee` (`employeeNo`),
  CONSTRAINT `F_deduction_deductTypeNo` FOREIGN KEY (`deductTypeNo`) REFERENCES `deducttype` (`deductTypeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deduction`
--

LOCK TABLES `deduction` WRITE;
/*!40000 ALTER TABLE `deduction` DISABLE KEYS */;
INSERT INTO `deduction` VALUES ('0001','2017-11-15',1000000,'d0001'),('0038','2017-12-10',4500,'d0038'),('0124','2017-01-24',45000,'d0124'),('1742','2017-11-20',600,'d1742');
/*!40000 ALTER TABLE `deduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deducttype`
--

DROP TABLE IF EXISTS `deducttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deducttype` (
  `deductTypeNo` char(5) NOT NULL,
  `deductDescription` varchar(40) NOT NULL,
  PRIMARY KEY (`deductTypeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deducttype`
--

LOCK TABLES `deducttype` WRITE;
/*!40000 ALTER TABLE `deducttype` DISABLE KEYS */;
INSERT INTO `deducttype` VALUES ('d0001','个人所得税'),('d0038','住房公积金'),('d0124','个人所得税'),('d1742','医疗保险'),('d3123','456744给'),('d4231','534');
/*!40000 ALTER TABLE `deducttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employeeNo` char(4) NOT NULL,
  `title` varchar(10) NOT NULL,
  `firstName` varchar(5) NOT NULL,
  `middleName` varchar(5) NOT NULL,
  `lastName` varchar(5) NOT NULL,
  `address` varchar(30) NOT NULL,
  `workTelExt` char(11) NOT NULL,
  `homeTelNo` char(11) NOT NULL,
  `empEmailAddress` char(50) NOT NULL,
  `socialSecurityNumber` char(9) NOT NULL,
  `DOB` date NOT NULL,
  `position` varchar(30) NOT NULL,
  `sex` enum('男','女') NOT NULL,
  `salary` float NOT NULL DEFAULT '0',
  `dateStarted` date NOT NULL,
  PRIMARY KEY (`employeeNo`),
  UNIQUE KEY `socialSecurityNumber` (`socialSecurityNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('0001','总经理','本','伟','卢','武汉市洪山区民族大道182号','15429834515','13255464567','lubenw@163.com','243454366','1988-11-23','广东惠州','男',4650000,'2015-01-13'),('0012','副总经理','伍','德','王','武汉市洪山区324号','13457450760','18454354362','34355659@qq.com','234567266','1985-10-16','湖北武汉','男',0,'2016-12-15'),('0025','市场部经理','任','健','吴','武汉市江夏区454号','15832423595','18302452564','32432556@qq.com','343251612','1988-02-09','四川成都','男',0,'2016-08-17'),('0038','总经理助理','卡','西','赵','上海普陀区中山路45号','18343242504','13791291279','3246485567@qq.com','345768778','1993-06-15','北京海淀区','女',127890,'2016-01-18'),('0124','营销总监','泓','海','钱','武汉市洪山区中南路99号','14721233290','18340450452','375846869asd@163.com','324657623','1985-10-28','湖北武汉','男',580000,'2016-06-15'),('1375','策划部职员','桂','花','李','武汉市洪山区34号','18341320432','13329597907','14325465@qq.com','326547662','1991-10-22','广西百色市','女',0,'2016-01-12'),('1742','营销部职员','铁','柱','赵','广东深圳市元朗区天水围184号','13728970787','18343435456','345457486@qq.com','437809803','1994-09-20','广东惠州','男',84350,'2017-06-20');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holiday`
--

DROP TABLE IF EXISTS `holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holiday` (
  `employeeNo` char(4) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  PRIMARY KEY (`employeeNo`,`startDate`),
  CONSTRAINT `F_holiday_employeeNo` FOREIGN KEY (`employeeNo`) REFERENCES `employee` (`employeeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holiday`
--

LOCK TABLES `holiday` WRITE;
/*!40000 ALTER TABLE `holiday` DISABLE KEYS */;
INSERT INTO `holiday` VALUES ('0001','2017-12-05','2017-12-20'),('0038','2017-09-30','2017-10-07'),('0124','2017-07-04','2017-07-19'),('1742','2017-10-09','2018-01-16');
/*!40000 ALTER TABLE `holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paydetails`
--

DROP TABLE IF EXISTS `paydetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paydetails` (
  `employeeNo` char(4) NOT NULL,
  `startDate` date NOT NULL,
  `routingNumber` char(9) NOT NULL,
  `accountType` varchar(10) NOT NULL,
  `bankName` varchar(16) NOT NULL,
  `bankAddress` varchar(30) NOT NULL,
  `payTypeNo` char(5) NOT NULL,
  PRIMARY KEY (`employeeNo`,`startDate`),
  KEY `F_paydetails_payTypeNo` (`payTypeNo`),
  CONSTRAINT `F_paydetails_employeeNo` FOREIGN KEY (`employeeNo`) REFERENCES `employee` (`employeeNo`),
  CONSTRAINT `F_paydetails_payTypeNo` FOREIGN KEY (`payTypeNo`) REFERENCES `paytype` (`payTypeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paydetails`
--

LOCK TABLES `paydetails` WRITE;
/*!40000 ALTER TABLE `paydetails` DISABLE KEYS */;
INSERT INTO `paydetails` VALUES ('0001','2017-12-31','452387103','银行卡','中国工商银行','武汉市洪山区','p0001'),('0038','2017-12-31','234325623','支票','中国工商银行','武汉市洪山区','p0038'),('0124','2017-12-31','543786123','银行卡','中国工商银行','武汉市洪山区','p0124'),('1742','2017-12-31','247677322','银行卡','中国农业银行','武汉市洪山区','p1742');
/*!40000 ALTER TABLE `paydetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payhistory`
--

DROP TABLE IF EXISTS `payhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payhistory` (
  `payNo` char(6) NOT NULL,
  `employeeNo` char(4) NOT NULL,
  `payDate` date NOT NULL,
  `checkNumber` char(4) NOT NULL,
  `payAmount` float NOT NULL,
  PRIMARY KEY (`payNo`),
  KEY `F_payhistory_employeeNo` (`employeeNo`),
  CONSTRAINT `F_payhistory_employeeNo` FOREIGN KEY (`employeeNo`) REFERENCES `employee` (`employeeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payhistory`
--

LOCK TABLES `payhistory` WRITE;
/*!40000 ALTER TABLE `payhistory` DISABLE KEYS */;
INSERT INTO `payhistory` VALUES ('pN0001','0001','2017-12-31','2314',4650000),('pN0038','0038','2017-12-31','3455',127890),('pN0124','0124','2017-12-31','3456',580000),('pN1742','1742','2017-12-31','3452',84350);
/*!40000 ALTER TABLE `payhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paytype`
--

DROP TABLE IF EXISTS `paytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paytype` (
  `payTypeNo` char(5) NOT NULL,
  `payTypeDescription` varchar(50) NOT NULL,
  PRIMARY KEY (`payTypeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paytype`
--

LOCK TABLES `paytype` WRITE;
/*!40000 ALTER TABLE `paytype` DISABLE KEYS */;
INSERT INTO `paytype` VALUES ('p0001','基本工资+奖金—扣除金额'),('p0038','基本工资+奖金-扣除金额'),('p0124','基本工资+奖金-扣除金额'),('p1742','基本工资+奖金-扣除金额');
/*!40000 ALTER TABLE `paytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sickleave`
--

DROP TABLE IF EXISTS `sickleave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sickleave` (
  `employeeNo` char(4) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `reason` varchar(40) NOT NULL,
  PRIMARY KEY (`employeeNo`,`startDate`),
  CONSTRAINT `F_sickleave_employeeNo` FOREIGN KEY (`employeeNo`) REFERENCES `employee` (`employeeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sickleave`
--

LOCK TABLES `sickleave` WRITE;
/*!40000 ALTER TABLE `sickleave` DISABLE KEYS */;
INSERT INTO `sickleave` VALUES ('0001','2017-09-12','2017-09-19','重度流感'),('0038','2017-08-21','2017-08-24','发烧'),('0124','2017-10-18','2018-01-25','工作受伤'),('1742','2017-11-13','2017-11-30','肋膜炎');
/*!40000 ALTER TABLE `sickleave` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-14 16:43:20
