-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2022 at 06:02 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fifa`
--

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

CREATE TABLE `club` (
  `CID` int(11) NOT NULL AUTO_INCREMENT,
  `ClubName` varchar(50) NOT NULL,
  `EstablishDate` date NOT NULL,
  `Street` varchar(50) NOT NULL,
  `ZIP` int(11) NOT NULL,
  `City` varchar(50) NOT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `CountryName` varchar(50) NOT NULL,
  `Continent` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `league`
--

CREATE TABLE `league` (
  `LeagueName` varchar(50) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `CountryName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `MID` int(11) NOT NULL AUTO_INCREMENT,
  `ManagerName` varchar(11) NOT NULL,
  `CID` int(11) NOT NULL,
  PRIMARY KEY (`MID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `participates`
-
- --------------------------------------------------------
--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Pace` int(11) NOT NULL,
  `Dribbling` int(11) NOT NULL,
  `Physical` int(11) NOT NULL,
  `Passing` int(11) NOT NULL,
  `Shooting` int(11) NOT NULL,
  `Defending` int(11) NOT NULL,
  `Pname` varchar(11) NOT NULL,
  `Image` text NOT NULL,
  `CID` int(11) NOT NULL,
  `CountryName` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `club`
--


-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`CountryName`);

--
-- Indexes for table `league`
--
ALTER TABLE `league`
  ADD PRIMARY KEY (`LeagueName`),
  ADD KEY `FK_CountryName_League` (`CountryName`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD KEY `Manager_CID` (`CID`);

--
-- Indexes for table `participates`

--
-- Indexes for table `player`player
--
ALTER TABLE `player`
  ADD KEY `FK_CID` (`CID`),
  ADD KEY `FK_CountryName` (`CountryName`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `league`
--
ALTER TABLE `league`
  ADD CONSTRAINT `FK_CountryName_League` FOREIGN KEY (`CountryName`) REFERENCES `country` (`CountryName`);

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `Manager_CID` FOREIGN KEY (`CID`) REFERENCES `club` (`CID`);

--
-- Constraints for table `participates`
-
--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `FK_CID` FOREIGN KEY (`CID`) REFERENCES `club` (`CID`),
  ADD CONSTRAINT `FK_CountryName` FOREIGN KEY (`CountryName`) REFERENCES `country` (`CountryName`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Levw1234';
flush privileges;



