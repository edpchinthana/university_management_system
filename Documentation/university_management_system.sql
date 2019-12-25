-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2019 at 12:09 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_code` varchar(10) NOT NULL,
  `course_name` varchar(30) NOT NULL,
  `lecturer` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_code`, `course_name`, `lecturer`) VALUES
('SENG11232', 'Fundamentals of Computing', 'lec001'),
('SENG22222', 'Object Oriented Programming', 'lec002');

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

CREATE TABLE `lecturer` (
  `id` varchar(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecturer`
--

INSERT INTO `lecturer` (`id`, `name`, `telephone`, `username`, `password`) VALUES
('lec001', 'Dr. Nalin Warnajith', '0711111111', 'nwarnajith', '1234'),
('lec002', 'Dr. Lankeshwara Munasinghe', '0711111111', 'lmunasinghe', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `course_code` varchar(10) NOT NULL,
  `student_id` varchar(10) NOT NULL,
  `result` int(5) NOT NULL,
  `grade` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`course_code`, `student_id`, `result`, `grade`) VALUES
('SENG11232', 'stu001', 0, ''),
('SENG11232', 'stu002', 0, ''),
('SENG22222', 'stu001', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` varchar(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `telephone`, `username`, `password`) VALUES
('stu001', 'Pasindu Chinthana', '0714264346', 'pasindu', '1234'),
('stu002', 'Sunanda Karunajeewa', '0711234567', 'sunanda', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_code`),
  ADD KEY `lecturer` (`lecturer`);

--
-- Indexes for table `lecturer`
--
ALTER TABLE `lecturer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`course_code`,`student_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`lecturer`) REFERENCES `lecturer` (`id`);

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`),
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
