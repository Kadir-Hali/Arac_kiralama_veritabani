-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.30-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema `ödevvvv`
--

CREATE DATABASE IF NOT EXISTS `ödevvvv`;
USE `ödevvvv`;

--
-- Definition of table `araç`
--

DROP TABLE IF EXISTS `araç`;
CREATE TABLE `araç` (
  `arac_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `arac_marka` varchar(45) NOT NULL,
  `arac_model` varchar(45) NOT NULL,
  `arac_yıl` varchar(45) NOT NULL,
  `arac_yakıt` varchar(45) NOT NULL,
  `arac_vites` varchar(45) NOT NULL,
  PRIMARY KEY (`arac_no`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `araç`
--

/*!40000 ALTER TABLE `araç` DISABLE KEYS */;
INSERT INTO `araç` (`arac_no`,`arac_marka`,`arac_model`,`arac_yıl`,`arac_yakıt`,`arac_vites`) VALUES 
 (10,'Peugeot','208','2018','Benzin','Manuel'),
 (11,'Ford','Puma','2020','Benzin','Otomatik'),
 (12,'Renault','Symbol','2019','Dizel','Manuel'),
 (13,'Ford','Focus','2021','Dizel','Otomatik'),
 (14,'Audi','A3','2017','Benzin','Manuel');
/*!40000 ALTER TABLE `araç` ENABLE KEYS */;


--
-- Definition of table `işyeri`
--

DROP TABLE IF EXISTS `işyeri`;
CREATE TABLE `işyeri` (
  `işyeri_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `işyeri_tel` varchar(45) NOT NULL,
  `işyeri_vergino` varchar(45) NOT NULL,
  `işyeri_sehir` varchar(45) NOT NULL,
  `işyeri_yöneticiad` varchar(45) NOT NULL,
  `işyeri_yöneticisoyad` varchar(45) NOT NULL,
  PRIMARY KEY (`işyeri_no`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `işyeri`
--

/*!40000 ALTER TABLE `işyeri` DISABLE KEYS */;
INSERT INTO `işyeri` (`işyeri_no`,`işyeri_tel`,`işyeri_vergino`,`işyeri_sehir`,`işyeri_yöneticiad`,`işyeri_yöneticisoyad`) VALUES 
 (32,'05991234567','8527419630','Isparta','Kadir','Hali');
/*!40000 ALTER TABLE `işyeri` ENABLE KEYS */;


--
-- Definition of table `kazanç`
--

DROP TABLE IF EXISTS `kazanç`;
CREATE TABLE `kazanç` (
  `kazanç_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `arac_no` int(10) unsigned NOT NULL,
  `arac_marka` varchar(45) NOT NULL,
  `arac_model` varchar(45) NOT NULL,
  `m_no` int(10) unsigned NOT NULL,
  `kira_ücret` varchar(45) NOT NULL,
  PRIMARY KEY (`kazanç_no`),
  KEY `FK_kazanç_1` (`arac_no`),
  KEY `FK_kazanç_2` (`m_no`),
  CONSTRAINT `FK_kazanç_2` FOREIGN KEY (`m_no`) REFERENCES `müşteri` (`m_no`),
  CONSTRAINT `FK_kazanç_1` FOREIGN KEY (`arac_no`) REFERENCES `araç` (`arac_no`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kazanç`
--

/*!40000 ALTER TABLE `kazanç` DISABLE KEYS */;
INSERT INTO `kazanç` (`kazanç_no`,`arac_no`,`arac_marka`,`arac_model`,`m_no`,`kira_ücret`) VALUES 
 (26,13,'Ford','Focus',1,'500'),
 (27,11,'Ford','Puma',4,'150'),
 (28,10,'Peugeot','208',3,'200'),
 (29,12,'Renault','Symbol',5,'180'),
 (30,14,'Audi','A3',2,'800');
/*!40000 ALTER TABLE `kazanç` ENABLE KEYS */;


--
-- Definition of table `kira`
--

DROP TABLE IF EXISTS `kira`;
CREATE TABLE `kira` (
  `kira_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `m_no` int(10) unsigned NOT NULL,
  `arac_no` int(10) unsigned NOT NULL,
  `işyeri_no` int(10) unsigned NOT NULL,
  `alış_tarihi` varchar(45) NOT NULL,
  `veriş_tarihi` varchar(45) NOT NULL,
  PRIMARY KEY (`kira_no`),
  KEY `FK_kira_1` (`m_no`),
  KEY `FK_kira_2` (`arac_no`),
  KEY `FK_kira_3` (`işyeri_no`),
  CONSTRAINT `FK_kira_3` FOREIGN KEY (`işyeri_no`) REFERENCES `işyeri` (`işyeri_no`),
  CONSTRAINT `FK_kira_1` FOREIGN KEY (`m_no`) REFERENCES `müşteri` (`m_no`),
  CONSTRAINT `FK_kira_2` FOREIGN KEY (`arac_no`) REFERENCES `araç` (`arac_no`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kira`
--

/*!40000 ALTER TABLE `kira` DISABLE KEYS */;
INSERT INTO `kira` (`kira_no`,`m_no`,`arac_no`,`işyeri_no`,`alış_tarihi`,`veriş_tarihi`) VALUES 
 (20,1,13,32,'13.04.2021','15.04.2021'),
 (21,4,11,32,'19.05.2021','20.05.202'),
 (22,3,10,32,'05.04.2021','06.04.2021'),
 (23,5,12,32,'01.04.2021','02.04.2021'),
 (24,2,14,32,'02.05.2021','05.05.2021');
/*!40000 ALTER TABLE `kira` ENABLE KEYS */;


--
-- Definition of table `müşteri`
--

DROP TABLE IF EXISTS `müşteri`;
CREATE TABLE `müşteri` (
  `m_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `m_ad` varchar(45) NOT NULL,
  `m_soyad` varchar(45) NOT NULL,
  `m_tc` varchar(45) NOT NULL,
  `m_ehliyetyas` varchar(45) NOT NULL,
  `m_heskodu` varchar(45) NOT NULL,
  PRIMARY KEY (`m_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `müşteri`
--

/*!40000 ALTER TABLE `müşteri` DISABLE KEYS */;
INSERT INTO `müşteri` (`m_no`,`m_ad`,`m_soyad`,`m_tc`,`m_ehliyetyas`,`m_heskodu`) VALUES 
 (1,'Doga','Erol','23456789101','3','J4Q8-7854-45'),
 (2,'Ilayda','Uyurdag','34567891012','14','H7A2-4125-65'),
 (3,'Enes','Kilinc','4567891012','4','A2T5-2569-47'),
 (4,'Eda','Yilmaz','5678910123','5','D6T5_8569-14'),
 (5,'Ezgi','Isaoglu','6789101234','2','D9O2-4739-45');
/*!40000 ALTER TABLE `müşteri` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
