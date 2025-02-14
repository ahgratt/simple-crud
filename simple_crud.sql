-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2023 at 05:39 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simple_crud`
--
CREATE DATABASE IF NOT EXISTS `simple_crud` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `simple_crud`;

-- --------------------------------------------------------

--
-- Table structure for table `berobat`
--

CREATE TABLE IF NOT EXISTS `berobat` (
  `No_Transaksi` varchar(255) NOT NULL,
  `Pasien_ID` int(11) DEFAULT NULL,
  `Tanggal_Berobat` date DEFAULT NULL,
  `Dokter_ID` int(11) DEFAULT NULL,
  `Keluhan` varchar(255) DEFAULT NULL,
  `Biaya_Adm` int(11) DEFAULT NULL,
  PRIMARY KEY (`No_Transaksi`),
  KEY `Pasien_ID` (`Pasien_ID`),
  KEY `Tanggal_Berobat` (`Tanggal_Berobat`),
  KEY `Dokter_ID` (`Dokter_ID`),
  KEY `Keluhan` (`Keluhan`),
  KEY `Biaya_Adm` (`Biaya_Adm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `berobat`
--

INSERT INTO `berobat` (`No_Transaksi`, `Pasien_ID`, `Tanggal_Berobat`, `Dokter_ID`, `Keluhan`, `Biaya_Adm`) VALUES
('TR001', 1, '2020-12-12', 1, 'Sakit Gigi', 125000),
('TR002', 2, '2020-05-16', 2, 'Demam', 75000),
('TR003', 3, '2020-08-17', 3, 'Telinga', 90000);

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE IF NOT EXISTS `dokter` (
  `Dokter_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Dokter` varchar(255) DEFAULT NULL,
  `Poli_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Dokter_ID`),
  KEY `Nama Dokter` (`Nama_Dokter`),
  KEY `Poli_ID` (`Poli_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`Dokter_ID`, `Nama_Dokter`, `Poli_ID`) VALUES
(1, 'dr. Ratna', 1),
(2, 'dr. Rudy', 2),
(3, 'dr. Joko', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE IF NOT EXISTS `pasien` (
  `Pasien_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Pasien` varchar(255) DEFAULT NULL,
  `Tanggal_Lahir` date DEFAULT NULL,
  `Jenis_Kelamin` varchar(255) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Pasien_ID`),
  KEY `Nama_Pasien` (`Nama_Pasien`),
  KEY `Tanggal_Lahir` (`Tanggal_Lahir`),
  KEY `Jenis_Kelamin` (`Jenis_Kelamin`),
  KEY `Alamat` (`Alamat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`Pasien_ID`, `Nama_Pasien`, `Tanggal_Lahir`, `Jenis_Kelamin`, `Alamat`) VALUES
(1, 'Barata Yuda', '1982-07-23', 'Laki-laki', 'Depok'),
(2, 'Indah Susanti', '2005-05-05', 'Perempuan', 'Cibinong'),
(3, 'Kurniawan', '2012-04-26', 'Laki-laki', 'Bogor');

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE IF NOT EXISTS `poli` (
  `Poli_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Poli` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Poli_ID`),
  KEY `Nama_Poli` (`Nama_Poli`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`Poli_ID`, `Nama_Poli`) VALUES
(1, 'Gigi'),
(3, 'THT'),
(2, 'Umum');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
