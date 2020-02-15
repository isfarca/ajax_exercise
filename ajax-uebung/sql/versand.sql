-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 07, 2019 at 03:09 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.39

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `bm`
--
CREATE DATABASE IF NOT EXISTS `bm` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bm`;

-- --------------------------------------------------------

--
-- Table structure for table `versand_artikel`
--

DROP TABLE IF EXISTS `versand_artikel`;
CREATE TABLE `versand_artikel` (
  `artikelnr` int(11) NOT NULL,
  `bezeichnung` varchar(50) DEFAULT NULL,
  `preis` decimal(6,2) DEFAULT NULL,
  `beschreibung` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `versand_artikel`
--

INSERT INTO `versand_artikel` (`artikelnr`, `bezeichnung`, `preis`, `beschreibung`) VALUES
(3, 'Schokolade', '0.65', '100 g, Vollnuss'),
(15, 'T-Shirt', '5.99', 'ein besonders schönes, buntes T-Shirt für jede Gelegenheit, Einheitsgröße'),
(24, 'Fernseher', '399.00', 'riesiger Bildschirm, mit Videotext'),
(25, 'Radio', '15.55', 'Immer Musik in der Hosentasche, mit diesem Radio haben Ihre Ohren immer etwas zu tun!'),
(26, 'Armbanduhr', '99.99', 'formschöne Uhr für Damen in edlem Design'),
(27, 'Halskette', '345.00', 'aus Gold mit exquisitem Anhänger'),
(28, 'Müsliriegel', '2.50', 'gesund und schmeckt - eine seltene Kombination');

-- --------------------------------------------------------

--
-- Table structure for table `versand_bestellungen`
--

DROP TABLE IF EXISTS `versand_bestellungen`;
CREATE TABLE `versand_bestellungen` (
  `bestellnr` int(11) NOT NULL,
  `artikelnr` int(11) DEFAULT NULL,
  `kundennr` int(11) DEFAULT NULL,
  `menge` int(11) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT '',
  `bestelldatum` date NOT NULL,
  `lieferdatum` date NOT NULL,
  `geliefert` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `versand_bestellungen`
--

INSERT INTO `versand_bestellungen` (`bestellnr`, `artikelnr`, `kundennr`, `menge`, `status`, `bestelldatum`, `lieferdatum`, `geliefert`) VALUES
(1, 15, 19283746, 1, 'eingegangen', '2018-04-08', '2018-04-08', '2018-04-08'),
(2, 3, 19283746, 10, 'geliefert', '2018-04-08', '2018-04-08', '2018-04-08'),
(3, 24, 19283746, 1, 'geliefert', '2018-04-01', '2018-04-06', '2018-04-05'),
(4, 15, 17356490, 3, 'geliefert', '2018-04-01', '2018-04-14', '2018-04-09'),
(5, 3, 17356490, 1, 'storniert', '2018-04-08', '2018-04-08', '2018-04-08');

-- --------------------------------------------------------

--
-- Table structure for table `versand_kunden`
--

DROP TABLE IF EXISTS `versand_kunden`;
CREATE TABLE `versand_kunden` (
  `kundennr` int(11) NOT NULL,
  `anrede` varchar(5) DEFAULT NULL,
  `vorname` varchar(30) DEFAULT NULL,
  `nachname` varchar(50) DEFAULT NULL,
  `adresse` varchar(70) DEFAULT NULL,
  `postleitzahl` char(5) DEFAULT NULL,
  `ort` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `versand_kunden`
--

INSERT INTO `versand_kunden` (`kundennr`, `anrede`, `vorname`, `nachname`, `adresse`, `postleitzahl`, `ort`) VALUES
(12345678, 'Frau', 'Hermine', 'Müller', 'Hansastraße 17', '12347', 'Berlin'),
(16293756, 'Frau', 'Ilse', 'Bilse', 'Münchner Straße 222', '87654', 'München'),
(17356490, 'Herr', 'Hugo', 'Meier', 'Kieler Straße 3', '34256', 'Kiel'),
(17654321, 'Herr', 'Otto', 'Müller', 'Bonner Straße 5', '43526', 'Bonn'),
(19283746, 'Frau', 'Helga', 'Krause', 'Berliner Straße 10', '12345', 'Berlin'),
(19283747, 'Herr', 'Hubert', 'Schulz', 'Paulsenstraße 9', '34876', 'Kleinkleckersdorf'),
(19283748, 'Frau', 'Maria', 'Sauber', 'Am See 75', '08234', 'Hintertupfingen');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `versand_artikel`
--
ALTER TABLE `versand_artikel`
  ADD PRIMARY KEY (`artikelnr`);

--
-- Indexes for table `versand_bestellungen`
--
ALTER TABLE `versand_bestellungen`
  ADD PRIMARY KEY (`bestellnr`),
  ADD KEY `artikelnr` (`artikelnr`),
  ADD KEY `kundennr` (`kundennr`);

--
-- Indexes for table `versand_kunden`
--
ALTER TABLE `versand_kunden`
  ADD PRIMARY KEY (`kundennr`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `versand_artikel`
--
ALTER TABLE `versand_artikel`
  MODIFY `artikelnr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `versand_bestellungen`
--
ALTER TABLE `versand_bestellungen`
  MODIFY `bestellnr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `versand_kunden`
--
ALTER TABLE `versand_kunden`
  MODIFY `kundennr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19283749;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `versand_bestellungen`
--
ALTER TABLE `versand_bestellungen`
  ADD CONSTRAINT `versand_bestellungen_ibfk_1` FOREIGN KEY (`artikelnr`) REFERENCES `versand_artikel` (`artikelnr`),
  ADD CONSTRAINT `versand_bestellungen_ibfk_2` FOREIGN KEY (`kundennr`) REFERENCES `versand_kunden` (`kundennr`);
COMMIT;
