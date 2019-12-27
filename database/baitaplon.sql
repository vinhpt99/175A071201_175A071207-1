-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2019 at 06:01 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baitaplon`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_giaovien`
--

CREATE TABLE `tb_giaovien` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sodt` varchar(11) DEFAULT NULL,
  `tuoi` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `quanly` tinyint(1) DEFAULT NULL,
  `idQuantri` int(11) DEFAULT NULL,
  `maGV` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_giaovien_monhoc`
--

CREATE TABLE `tb_giaovien_monhoc` (
  `idgiaovien` int(11) NOT NULL,
  `idmonhoc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_lophocphan`
--

CREATE TABLE `tb_lophocphan` (
  `id` int(11) NOT NULL,
  `lophoc` varchar(100) DEFAULT NULL,
  `thoigian` varchar(200) DEFAULT NULL,
  `diadiem` varchar(100) DEFAULT NULL,
  `giangvien` varchar(100) DEFAULT NULL,
  `monhoc` varchar(100) DEFAULT NULL,
  `hocky` varchar(100) DEFAULT NULL,
  `idQuanly` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_monhoc`
--

CREATE TABLE `tb_monhoc` (
  `id` int(11) NOT NULL,
  `Mamon` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sotinchi` int(11) DEFAULT NULL,
  `idNganhhoc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_nganhhoc`
--

CREATE TABLE `tb_nganhhoc` (
  `id` int(11) NOT NULL,
  `MaNganh` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `idQuanly` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_quanly`
--

CREATE TABLE `tb_quanly` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `idQuantri` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_quantrivien`
--

CREATE TABLE `tb_quantrivien` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_giaovien`
--
ALTER TABLE `tb_giaovien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_giaovien_ibfk_1` (`idQuantri`);

--
-- Indexes for table `tb_giaovien_monhoc`
--
ALTER TABLE `tb_giaovien_monhoc`
  ADD PRIMARY KEY (`idgiaovien`,`idmonhoc`),
  ADD KEY `idmonhoc` (`idmonhoc`);

--
-- Indexes for table `tb_lophocphan`
--
ALTER TABLE `tb_lophocphan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idQuanly` (`idQuanly`);

--
-- Indexes for table `tb_monhoc`
--
ALTER TABLE `tb_monhoc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idNganhhoc` (`idNganhhoc`);

--
-- Indexes for table `tb_nganhhoc`
--
ALTER TABLE `tb_nganhhoc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_nganhhoc_ibfk_1` (`idQuanly`);

--
-- Indexes for table `tb_quanly`
--
ALTER TABLE `tb_quanly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idQuantri` (`idQuantri`);

--
-- Indexes for table `tb_quantrivien`
--
ALTER TABLE `tb_quantrivien`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_giaovien`
--
ALTER TABLE `tb_giaovien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_lophocphan`
--
ALTER TABLE `tb_lophocphan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_monhoc`
--
ALTER TABLE `tb_monhoc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_nganhhoc`
--
ALTER TABLE `tb_nganhhoc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_quanly`
--
ALTER TABLE `tb_quanly`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_quantrivien`
--
ALTER TABLE `tb_quantrivien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_giaovien`
--
ALTER TABLE `tb_giaovien`
  ADD CONSTRAINT `tb_giaovien_ibfk_1` FOREIGN KEY (`idQuantri`) REFERENCES `tb_quantrivien` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_giaovien_monhoc`
--
ALTER TABLE `tb_giaovien_monhoc`
  ADD CONSTRAINT `tb_giaovien_monhoc_ibfk_1` FOREIGN KEY (`idgiaovien`) REFERENCES `tb_giaovien` (`id`),
  ADD CONSTRAINT `tb_giaovien_monhoc_ibfk_2` FOREIGN KEY (`idmonhoc`) REFERENCES `tb_monhoc` (`id`);

--
-- Constraints for table `tb_lophocphan`
--
ALTER TABLE `tb_lophocphan`
  ADD CONSTRAINT `tb_lophocphan_ibfk_1` FOREIGN KEY (`idQuanly`) REFERENCES `tb_quanly` (`id`);

--
-- Constraints for table `tb_monhoc`
--
ALTER TABLE `tb_monhoc`
  ADD CONSTRAINT `tb_monhoc_ibfk_1` FOREIGN KEY (`idNganhhoc`) REFERENCES `tb_nganhhoc` (`id`);

--
-- Constraints for table `tb_nganhhoc`
--
ALTER TABLE `tb_nganhhoc`
  ADD CONSTRAINT `tb_nganhhoc_ibfk_1` FOREIGN KEY (`idQuanly`) REFERENCES `tb_quanly` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_quanly`
--
ALTER TABLE `tb_quanly`
  ADD CONSTRAINT `tb_quanly_ibfk_1` FOREIGN KEY (`idQuantri`) REFERENCES `tb_quantrivien` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
