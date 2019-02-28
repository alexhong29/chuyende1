-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2019 at 11:59 AM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test1`
--
CREATE DATABASE IF NOT EXISTS `test1` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `test1`;

-- --------------------------------------------------------

--
-- Table structure for table `airways`
--

DROP TABLE IF EXISTS `airways`;
CREATE TABLE IF NOT EXISTS `airways` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airways_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `airways_id` (`id`),
  KEY `airways_id_2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `airways`
--

INSERT INTO `airways` (`id`, `airways_name`) VALUES
(1, 'Quatar Airlines'),
(2, 'Vietnam Airlines'),
(3, 'JetStar');

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
CREATE TABLE IF NOT EXISTS `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `card_number` int(11) NOT NULL,
  `card_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ccv_code` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `shortname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `cityname`, `shortname`) VALUES
(1, 'Hồ Chí Minh', 'SGN'),
(2, 'Hà Nội', 'HAN'),
(3, 'Đà Nẵng', 'DN'),
(4, 'Huế', 'HU');

-- --------------------------------------------------------

--
-- Table structure for table `cus_list`
--

DROP TABLE IF EXISTS `cus_list`;
CREATE TABLE IF NOT EXISTS `cus_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flights_booking`
--

DROP TABLE IF EXISTS `flights_booking`;
CREATE TABLE IF NOT EXISTS `flights_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `flist_id` int(11) NOT NULL,
  `fclass_id` int(11) NOT NULL,
  `flight_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total_per` int(11) NOT NULL,
  `ticket_buy` datetime NOT NULL,
  `total_price` double NOT NULL,
  `card_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `flight_id` (`flist_id`),
  KEY `flights_booking_ibfk_1` (`user_id`),
  KEY `card_id` (`card_id`),
  KEY `fclass_id` (`fclass_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flight_class`
--

DROP TABLE IF EXISTS `flight_class`;
CREATE TABLE IF NOT EXISTS `flight_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fclass_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flight_class`
--

INSERT INTO `flight_class` (`id`, `fclass_name`) VALUES
(1, 'Economy'),
(2, 'Business'),
(3, 'Premium Economy');

-- --------------------------------------------------------

--
-- Table structure for table `flight_list`
--

DROP TABLE IF EXISTS `flight_list`;
CREATE TABLE IF NOT EXISTS `flight_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airways_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `place_from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time_from` time NOT NULL,
  `place_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time_to` time NOT NULL,
  `duration` text COLLATE utf8_unicode_ci NOT NULL,
  `transit` int(11) NOT NULL,
  `total_sit` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `airways_id` (`airways_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flight_list`
--

INSERT INTO `flight_list` (`id`, `airways_id`, `city_id`, `place_from`, `time_from`, `place_to`, `time_to`, `duration`, `transit`, `total_sit`) VALUES
(1, 1, 0, 'Jakarta (CGK)', '18:45:00', 'Abu Dhabi (AUH)\r\n', '02:55:00', '11h 10m', 1, 0),
(2, 1, 0, 'Hanoi, Vietnam (HAN)', '22:50:00', 'Calgary, Alberta, Canada (YYC)', '10:50:00', '36h 00m', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(13) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `active` int(11) NOT NULL,
  `attempt` int(11) NOT NULL,
  `last_access` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `password`, `phone`, `remember_token`, `created_at`, `updated_at`, `active`, `attempt`, `last_access`) VALUES
(5, 'nhozstar0024@gmail.com', 'a', '$2y$10$N3zpx2CU9JSVfdd5bQT9Ke3wNtziMfJ6bDVpgCMRgmbrrE60gMpZu', 909449412, '6x4Uhjtp8NcsqjcERLj6Frwt13CoY5SWPQUrlupbbCgSTlKuCoYFwpIU3ooF', '2019-02-27 17:46:42', '2019-02-27 17:46:42', 0, 0, '0000-00-00 00:00:00'),
(6, 'asd@gmail.com', 'b', '$2y$10$N3zpx2CU9JSVfdd5bQT9Ke3wNtziMfJ6bDVpgCMRgmbrrE60gMpZu', 909449412, NULL, '2019-02-27 17:46:57', '2019-02-27 17:46:57', 0, 0, '0000-00-00 00:00:00'),
(7, '0909449412@gmail.com', 'cc', '$2y$10$PYo7HPzpK172p51feC3taejU6bpWFT4cWrtJvyd7HbQKRJwXfocha', 909449412, NULL, '2019-02-28 03:55:42', '2019-02-28 03:55:42', 0, 0, '0000-00-00 00:00:00'),
(8, 'langoctanphong@gmail.com', 'd', '$2y$10$N3zpx2CU9JSVfdd5bQT9Ke3wNtziMfJ6bDVpgCMRgmbrrE60gMpZu', 909449412, NULL, '2019-02-28 03:56:43', '2019-02-28 03:56:43', 0, 0, '0000-00-00 00:00:00');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cus_list`
--
ALTER TABLE `cus_list`
  ADD CONSTRAINT `cus_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `flights_booking`
--
ALTER TABLE `flights_booking`
  ADD CONSTRAINT `flights_booking_ibfk_1` FOREIGN KEY (`flist_id`) REFERENCES `flight_list` (`id`),
  ADD CONSTRAINT `flights_booking_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `flights_booking_ibfk_3` FOREIGN KEY (`card_id`) REFERENCES `card` (`id`),
  ADD CONSTRAINT `flights_booking_ibfk_4` FOREIGN KEY (`fclass_id`) REFERENCES `flight_class` (`id`);

--
-- Constraints for table `flight_list`
--
ALTER TABLE `flight_list`
  ADD CONSTRAINT `flight_list_ibfk_1` FOREIGN KEY (`airways_id`) REFERENCES `airways` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
