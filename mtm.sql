-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 17, 2022 at 02:00 AM
-- Server version: 5.7.33-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mtm`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id_course` int(11) NOT NULL,
  `course` varchar(255) NOT NULL,
  `id_mentor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id_course`, `course`, `id_mentor`) VALUES
(1, 'C++', 1),
(2, 'Python', 1),
(3, 'Javascript', 2),
(4, 'Golang', 3),
(5, 'PHP', 4),
(6, 'HTML', 5);

-- --------------------------------------------------------

--
-- Table structure for table `data_course`
--

CREATE TABLE `data_course` (
  `id_data` int(11) NOT NULL,
  `id_member` int(11) NOT NULL,
  `id_course` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_course`
--

INSERT INTO `data_course` (`id_data`, `id_member`, `id_course`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 2),
(7, 2, 3),
(8, 7, 6),
(9, 2, 4),
(10, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `mentor`
--

CREATE TABLE `mentor` (
  `id_mentor` int(11) NOT NULL,
  `mentor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mentor`
--

INSERT INTO `mentor` (`id_mentor`, `mentor`) VALUES
(1, 'Ahmad'),
(2, 'Budi'),
(3, 'Rahmad'),
(4, 'Dian'),
(5, 'Galuh');

-- --------------------------------------------------------

--
-- Table structure for table `user_course`
--

CREATE TABLE `user_course` (
  `id_member` int(11) NOT NULL,
  `member_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_course`
--

INSERT INTO `user_course` (`id_member`, `member_name`) VALUES
(1, 'Andi'),
(2, 'Maulana'),
(3, 'Yusuf'),
(4, 'Mukhlis'),
(5, 'Nova'),
(6, 'Santi'),
(7, 'Rifai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id_course`),
  ADD KEY `id_mentor` (`id_mentor`);

--
-- Indexes for table `data_course`
--
ALTER TABLE `data_course`
  ADD PRIMARY KEY (`id_data`),
  ADD KEY `id_member` (`id_member`),
  ADD KEY `id_course` (`id_course`);

--
-- Indexes for table `mentor`
--
ALTER TABLE `mentor`
  ADD PRIMARY KEY (`id_mentor`);

--
-- Indexes for table `user_course`
--
ALTER TABLE `user_course`
  ADD PRIMARY KEY (`id_member`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id_course` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `data_course`
--
ALTER TABLE `data_course`
  MODIFY `id_data` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `mentor`
--
ALTER TABLE `mentor`
  MODIFY `id_mentor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user_course`
--
ALTER TABLE `user_course`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`id_mentor`) REFERENCES `mentor` (`id_mentor`);

--
-- Constraints for table `data_course`
--
ALTER TABLE `data_course`
  ADD CONSTRAINT `data_course_ibfk_1` FOREIGN KEY (`id_member`) REFERENCES `user_course` (`id_member`),
  ADD CONSTRAINT `data_course_ibfk_2` FOREIGN KEY (`id_course`) REFERENCES `course` (`id_course`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
