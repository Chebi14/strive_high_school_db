-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2024 at 12:51 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `strive_high_school`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `admin_id` varchar(6) NOT NULL,
  `learner_id` varchar(6) NOT NULL,
  `initials` varchar(5) NOT NULL,
  `admin_surname` varchar(20) NOT NULL,
  `admin_email` varchar(30) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`admin_id`, `learner_id`, `initials`, `admin_surname`, `admin_email`, `password`) VALUES
('1', '1', 'C', 'Khomo', 'chebikhomo@gmail.com', 'iCt3715@');

-- --------------------------------------------------------

--
-- Table structure for table `afternoon_drop_off_numbers`
--

CREATE TABLE `afternoon_drop_off_numbers` (
  `drop_off_number` varchar(6) NOT NULL,
  `bus_route_id` varchar(6) NOT NULL,
  `drop_off_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `afternoon_drop_off_time`
--

CREATE TABLE `afternoon_drop_off_time` (
  `bus_route_id` varchar(6) NOT NULL,
  `drop_off_time` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `application_status`
--

CREATE TABLE `application_status` (
  `status_id` varchar(6) NOT NULL,
  `learner_id` varchar(6) NOT NULL,
  `successful` varchar(20) NOT NULL,
  `waiting_list` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='application status';

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `bus_route_id` varchar(6) NOT NULL,
  `learner_id` varchar(6) NOT NULL,
  `pick_up_number` varchar(6) NOT NULL,
  `drop_off_number` varchar(6) NOT NULL,
  `bus_route_name` varchar(20) NOT NULL,
  `bus_number` varchar(3) NOT NULL,
  `bus_limit` int(3) NOT NULL,
  `pick_up_time` time(6) NOT NULL,
  `pick_up_name` varchar(100) NOT NULL,
  `drop_off_time` time(6) NOT NULL,
  `drop_off_name` varchar(100) NOT NULL,
  `application_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bus information';

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`bus_route_id`, `learner_id`, `pick_up_number`, `drop_off_number`, `bus_route_name`, `bus_number`, `bus_limit`, `pick_up_time`, `pick_up_name`, `drop_off_time`, `drop_off_name`, `application_status`) VALUES
('1', '1', '1A', '1A', 'Rooihuiskraal', '1', 35, '06:22:00.000000', 'Corner of Panorama and Marabou Road', '14:30:00.000000', 'Corner of Panorama and Marabou Road', 'Accepted');

-- --------------------------------------------------------

--
-- Table structure for table `learner`
--

CREATE TABLE `learner` (
  `learner_id` varchar(6) NOT NULL,
  `parent_id` varchar(6) NOT NULL,
  `learner_name` varchar(200) NOT NULL,
  `learner_surname` varchar(200) NOT NULL,
  `learner_cellphone` int(10) NOT NULL,
  `learner_grade` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Learner information';

--
-- Dumping data for table `learner`
--

INSERT INTO `learner` (`learner_id`, `parent_id`, `learner_name`, `learner_surname`, `learner_cellphone`, `learner_grade`) VALUES
('1', '1', 'Carel', 'Smit', 833780177, 9);

-- --------------------------------------------------------

--
-- Table structure for table `morning_pickup_number`
--

CREATE TABLE `morning_pickup_number` (
  `pick_up_number` varchar(6) NOT NULL,
  `bus_route_id` varchar(6) NOT NULL,
  `pick_up_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Morning pickups';

-- --------------------------------------------------------

--
-- Table structure for table `morning_pickup_times`
--

CREATE TABLE `morning_pickup_times` (
  `bus_route_id` varchar(6) NOT NULL,
  `pick_up_time` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bus pickup times';

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `parent_id` varchar(6) NOT NULL,
  `parent_name` varchar(20) NOT NULL,
  `parent_surname` varchar(20) NOT NULL,
  `parent_email` varchar(50) NOT NULL,
  `parent_cellphone` int(10) NOT NULL,
  `password` varchar(15) NOT NULL,
  `learner_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Parent information';

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`parent_id`, `parent_name`, `parent_surname`, `parent_email`, `parent_cellphone`, `password`, `learner_id`) VALUES
('1', 'Johan', 'Smit', 'johan.smit@gmail', 833780166, 'JohanSmit123@', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password`
--

CREATE TABLE `password` (
  `parent_id` varchar(6) NOT NULL,
  `password` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Pasword reference table';

-- --------------------------------------------------------

--
-- Table structure for table `waiting_list`
--

CREATE TABLE `waiting_list` (
  `waiting_id` varchar(6) NOT NULL,
  `learner_id` varchar(6) NOT NULL,
  `learner_name` varchar(20) NOT NULL,
  `learner_surname` varchar(20) NOT NULL,
  `learner_cellphone` int(10) NOT NULL,
  `learner_grade` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='waiting list information';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `afternoon_drop_off_numbers`
--
ALTER TABLE `afternoon_drop_off_numbers`
  ADD PRIMARY KEY (`drop_off_number`);

--
-- Indexes for table `afternoon_drop_off_time`
--
ALTER TABLE `afternoon_drop_off_time`
  ADD PRIMARY KEY (`bus_route_id`);

--
-- Indexes for table `application_status`
--
ALTER TABLE `application_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`bus_route_id`);

--
-- Indexes for table `learner`
--
ALTER TABLE `learner`
  ADD PRIMARY KEY (`learner_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `morning_pickup_number`
--
ALTER TABLE `morning_pickup_number`
  ADD PRIMARY KEY (`pick_up_number`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`parent_id`);

--
-- Indexes for table `password`
--
ALTER TABLE `password`
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `waiting_list`
--
ALTER TABLE `waiting_list`
  ADD PRIMARY KEY (`waiting_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `afternoon_drop_off_time`
--
ALTER TABLE `afternoon_drop_off_time`
  ADD CONSTRAINT `afternoon_drop_off_time_ibfk_1` FOREIGN KEY (`bus_route_id`) REFERENCES `bus` (`bus_route_id`);

--
-- Constraints for table `learner`
--
ALTER TABLE `learner`
  ADD CONSTRAINT `learner_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`parent_id`);

--
-- Constraints for table `password`
--
ALTER TABLE `password`
  ADD CONSTRAINT `password_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`parent_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
