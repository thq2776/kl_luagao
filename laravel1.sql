-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220810.35f421a69b
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2023 at 10:01 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel1`
--

-- --------------------------------------------------------

--
-- Table structure for table `baocaogiamsatlaubong`
--

CREATE TABLE `baocaogiamsatlaubong` (
  `baocaogiamsatlaubong_id` int(11) NOT NULL,
  `masolo_id` int(11) NOT NULL,
  `masolotam` varchar(10) NOT NULL,
  `masologaotrang` varchar(10) NOT NULL,
  `masolootammai` varchar(10) NOT NULL,
  `nbq5` varchar(12) NOT NULL,
  `kl5` varchar(12) NOT NULL,
  `nbq1` varchar(12) NOT NULL,
  `kl1` varchar(12) NOT NULL,
  `nbq2` varchar(12) NOT NULL,
  `kl2` varchar(12) NOT NULL,
  `nbq3` varchar(12) NOT NULL,
  `kl3` varchar(12) NOT NULL,
  `nbq4` varchar(12) NOT NULL,
  `kl4` varchar(12) NOT NULL,
  `cam` varchar(10) NOT NULL,
  `tgkiemtra` varchar(20) NOT NULL,
  `doam` int(11) NOT NULL,
  `tam` int(11) NOT NULL,
  `hatphan` int(11) NOT NULL,
  `hathu` int(11) NOT NULL,
  `hatvang` int(11) NOT NULL,
  `hatxanhnon` int(11) NOT NULL,
  `hatdo` int(11) NOT NULL,
  `tapchat` int(11) NOT NULL,
  `hatnep` int(11) NOT NULL,
  `thoc` int(11) NOT NULL,
  `hatlanloai` int(10) NOT NULL,
  `nguoivanhanh` varchar(50) NOT NULL,
  `mucxattrang` varchar(10) NOT NULL,
  `mucdanhbong` varchar(10) NOT NULL,
  `dothuan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `baocaogiamsatlaubong`
--

INSERT INTO `baocaogiamsatlaubong` (`baocaogiamsatlaubong_id`, `masolo_id`, `masolotam`, `masologaotrang`, `masolootammai`, `nbq5`, `kl5`, `nbq1`, `kl1`, `nbq2`, `kl2`, `nbq3`, `kl3`, `nbq4`, `kl4`, `cam`, `tgkiemtra`, `doam`, `tam`, `hatphan`, `hathu`, `hatvang`, `hatxanhnon`, `hatdo`, `tapchat`, `hatnep`, `thoc`, `hatlanloai`, `nguoivanhanh`, `mucxattrang`, `mucdanhbong`, `dothuan`) VALUES
(3, 1, 'JM0521', 'MGT0503', 'TMT3001', 'GB', '7737', 'T17', '77337', 'T40', '54316', 'T34', '11605', 'GB', '464', 'MCA3001', '20h', 29, 4, 1, 1, 2, 0, 1, 3, 3, 3, 2, '3', '32', '34', 97),
(4, 1, 'JM0521', 'MGT0503', 'TMT3001', 'GB', '7737', 'T17', '77337', 'T40', '54316', 'T34', '11605', 'GB', '464', 'MCA3001', '20h', 29, 4, 1, 1, 2, 0, 1, 3, 3, 3, 2, '3', '32', '34', 97),
(5, 1, 'JM0521', 'MGT0503', 'TMT3001', 'GB', '7737', 'T17', '77337', 'T40', '54316', 'T34', '11605', 'GB', '464', 'MCA3001', '20h', 29, 4, 1, 1, 2, 0, 1, 3, 3, 3, 2, '3', '32', '34', 97),
(6, 1, 'JM0521', 'MGT0503', 'TMT3001', 'GB', '7737', 'T17', '77337', 'T40', '54316', 'T34', '11605', 'GB', '464', 'MCA3001', '20h', 29, 4, 1, 1, 2, 0, 1, 3, 3, 3, 2, '3', '32', '34', 97);

-- --------------------------------------------------------

--
-- Table structure for table `baocaogiamsatnhaplo`
--

CREATE TABLE `baocaogiamsatnhaplo` (
  `baocaogiamsatnhaplo_id` int(11) NOT NULL,
  `masolo_id` int(11) NOT NULL,
  `ngay` datetime NOT NULL,
  `thoidiemkiemtra` varchar(10) NOT NULL,
  `phantramtamnl` varchar(10) NOT NULL,
  `khoiluongnl` int(20) NOT NULL,
  `noibaoquannl` varchar(20) NOT NULL,
  `masolotp` varchar(20) NOT NULL,
  `phantramtamtp` varchar(10) NOT NULL,
  `khoiluongtp` int(20) NOT NULL,
  `noibaoquantp` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `baocaogiamsatnhaplo`
--

INSERT INTO `baocaogiamsatnhaplo` (`baocaogiamsatnhaplo_id`, `masolo_id`, `ngay`, `thoidiemkiemtra`, `phantramtamnl`, `khoiluongnl`, `noibaoquannl`, `masolotp`, `phantramtamtp`, `khoiluongtp`, `noibaoquantp`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-05-21 05:46:47', '1h40', '20', 222, 'kho', 'JM112', '10', 40000, 'kho', '2023-05-21 03:47:10', '2023-05-21 10:47:10'),
(2, 61, '2023-05-21 05:48:40', '2h30', '20', 5000, 'Kho ', 'ST321', '6', 4500, 'kho', '2023-05-21 03:49:00', '2023-05-21 11:13:23'),
(14, 1, '2023-05-21 00:00:00', '1h40', '5', 7000, 'T1', 'JM221', '3', 6500, 'kho', '2023-05-21 06:36:48', '2023-05-21 13:36:48'),
(15, 1, '2023-05-21 05:46:47', '1h40', '20', 7000, 'kho', 'JM111', '10', 6000, 'S3', '2023-05-21 03:47:10', '2023-05-21 10:47:10'),
(16, 61, '2023-05-21 05:48:40', '2h30', '20', 5000, 'Kho ', 'ST132', '6', 4500, 'kho', '2023-05-21 03:49:00', '2023-05-21 11:13:23'),
(17, 1, '2023-05-21 00:00:00', '1h40', '5', 7000, 'T1', 'JM221', '3', 6500, 'kho', '2023-05-21 06:36:48', '2023-05-21 13:36:48');

-- --------------------------------------------------------

--
-- Table structure for table `baocaogiamsatsaylua`
--

CREATE TABLE `baocaogiamsatsaylua` (
  `baocaogiamsatsaylua_id` int(11) NOT NULL,
  `masolo_id` int(11) NOT NULL,
  `ngay` datetime NOT NULL,
  `khoiluong` int(10) NOT NULL DEFAULT 0,
  `losaylua` varchar(20) NOT NULL,
  `doambandau` varchar(2) NOT NULL,
  `dodaymelua` varchar(20) NOT NULL,
  `noibaoquansaukhisay` varchar(10) NOT NULL,
  `thoigianbatdau` datetime NOT NULL DEFAULT current_timestamp(),
  `thoigianketthuc` datetime NOT NULL DEFAULT current_timestamp(),
  `khoiluongluakho` varchar(20) NOT NULL,
  `masolosaukhisay` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `baocaogiamsatsaylua`
--

INSERT INTO `baocaogiamsatsaylua` (`baocaogiamsatsaylua_id`, `masolo_id`, `ngay`, `khoiluong`, `losaylua`, `doambandau`, `dodaymelua`, `noibaoquansaukhisay`, `thoigianbatdau`, `thoigianketthuc`, `khoiluongluakho`, `masolosaukhisay`, `created_at`, `updated_at`) VALUES
(80, 71, '2023-05-20 23:57:34', 2000, 'S2', '33', '7', 'Kho', '2023-05-22 09:38:08', '2023-05-22 09:38:08', '1800', '1111', '2023-05-21 19:38:08', '2023-05-22 02:38:08'),
(81, 62, '2023-05-13 00:00:00', 2000, 'T1', '33', '7', 'Kho', '2023-05-22 09:38:29', '2023-05-22 09:38:29', '1800', '1111', '2023-05-21 19:38:29', '2023-05-22 02:38:29'),
(82, 62, '2023-05-13 00:00:00', 2000, 'T2', '33', '7', 'Kho', '2023-05-22 09:39:31', '2023-05-22 09:39:31', '1800', '1111', '2023-05-21 19:39:31', '2023-05-22 02:39:31'),
(83, 62, '2023-05-18 00:00:00', 2000, 'T1', '33', '7', 'Kho', '2023-05-22 09:40:08', '2023-05-22 09:40:08', '1800', '1111', '2023-05-21 19:40:08', '2023-05-22 02:40:08'),
(84, 1, '2023-05-18 00:00:00', 2000, 'S3', '33', '7', 'Kho', '2023-05-22 09:40:33', '2023-05-22 09:40:33', '1800', '1111', '2023-05-21 19:40:33', '2023-05-22 02:40:33'),
(85, 62, '2023-04-19 00:00:00', 2000, 'S3', '33', '7', 'Kho', '2023-05-22 09:41:07', '2023-05-22 09:41:07', '1800', '1111', '2023-05-21 19:41:07', '2023-05-22 02:41:07'),
(86, 71, '2023-05-20 23:57:34', 1235, 'S2', '33', '7', 'Kho', '2023-05-22 09:47:27', '2023-05-22 09:47:27', '1222', '1111', '2023-05-21 19:47:27', '2023-05-22 02:47:27');

-- --------------------------------------------------------

--
-- Table structure for table `baocaogiamsattachda`
--

CREATE TABLE `baocaogiamsattachda` (
  `baocaogiamsattachda_id` int(11) NOT NULL,
  `masolo_id` int(11) NOT NULL,
  `chitietgiamsatlaubongtachda_id` int(11) NOT NULL,
  `ngay` date NOT NULL,
  `hopdong` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bcgiamsattiepnhannguyenlieu`
--

CREATE TABLE `bcgiamsattiepnhannguyenlieu` (
  `bcgiamsattiepnhannguyenlieu_id` int(11) NOT NULL,
  `khachhang_id` int(11) NOT NULL,
  `loaisanpham_id` int(11) NOT NULL,
  `masolo_id` int(11) NOT NULL,
  `ngay` datetime NOT NULL,
  `diachi` varchar(255) NOT NULL,
  `khoiluong` int(10) NOT NULL,
  `kiemtraphuongtien` varchar(20) NOT NULL,
  `hosotrongtrot` varchar(10) NOT NULL,
  `hosocamket` varchar(10) NOT NULL,
  `chungnhan` varchar(10) NOT NULL,
  `doam` int(10) NOT NULL DEFAULT 0,
  `tam` int(10) NOT NULL DEFAULT 0,
  `tapchat` int(10) NOT NULL DEFAULT 0,
  `hatnguyen` int(10) NOT NULL DEFAULT 0,
  `hathu` int(10) NOT NULL DEFAULT 0,
  `hatvang` int(10) NOT NULL DEFAULT 0,
  `hatbacphan` int(10) NOT NULL DEFAULT 0,
  `ketluan` varchar(50) NOT NULL DEFAULT ' ',
  `thoigiantiepnhan` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bcgiamsattiepnhannguyenlieu`
--

INSERT INTO `bcgiamsattiepnhannguyenlieu` (`bcgiamsattiepnhannguyenlieu_id`, `khachhang_id`, `loaisanpham_id`, `masolo_id`, `ngay`, `diachi`, `khoiluong`, `kiemtraphuongtien`, `hosotrongtrot`, `hosocamket`, `chungnhan`, `doam`, `tam`, `tapchat`, `hatnguyen`, `hathu`, `hatvang`, `hatbacphan`, `ketluan`, `thoigiantiepnhan`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 62, '2023-05-27 00:00:00', 'An Giangg', 12346, 'Đạt', 'Có', 'Có', 'Có', 1, 1, 1, 1, 1, 1, 12, 'Đạt yêu cầu', '16h_18h', '2023-05-20 21:49:19', '2023-05-22 08:42:14'),
(24, 3, 1, 1, '2023-05-27 00:00:00', 'An Giangg', 99999, 'Đạt', 'Có', 'Có', 'Có', 1, 1, 1, 1, 1, 1, 12, 'Đạt yêu cầu', '16h_18h', '2023-05-20 21:49:19', '2023-05-21 18:43:47'),
(27, 3, 1, 71, '2023-05-27 00:00:00', 'An Giangg', 12345, 'Đạt', 'Có', 'Có', 'Có', 1, 1, 1, 1, 1, 1, 12, 'Đạt yêu cầu', '16h_18h', '2023-05-21 09:50:35', '2023-05-21 22:00:16'),
(28, 15, 1, 83, '2023-05-17 00:00:00', 'An Giang', 12346, 'Đạt', 'Có', 'Có', 'Có', 1, 1, 1, 1, 1, 1, 12, 'Đạt yêu cầu', '16h_18h', '2023-05-21 19:53:45', '2023-05-22 08:46:57'),
(29, 15, 560, 82, '2023-05-03 00:00:00', 'An Giangg', 12346, 'Đạt', 'Có', 'Có', 'Có', 1, 1, 1, 1, 1, 1, 12, 'Đạt yêu cầu', '16h_18h', '2023-05-21 19:54:41', '2023-05-22 02:54:41'),
(30, 19, 1, 81, '2023-05-03 00:00:00', 'An Giangg', 12346, 'Đạt', 'Có', 'Có', 'Có', 1, 1, 1, 1, 1, 1, 12, 'Đạt yêu cầu', '16h_18h', '2023-05-21 19:55:14', '2023-05-22 02:55:14');

-- --------------------------------------------------------

--
-- Table structure for table `chitietgiamsatbocvotachhat`
--

CREATE TABLE `chitietgiamsatbocvotachhat` (
  `chitietgiamsatbocvotachhat_id` int(11) NOT NULL,
  `masolo_id` int(11) NOT NULL,
  `ngay` datetime NOT NULL,
  `thoidiemkiemtra` varchar(10) NOT NULL,
  `apsuat` varchar(20) NOT NULL,
  `masologaoxo` varchar(10) NOT NULL,
  `khoiluonggaoxo` varchar(20) NOT NULL,
  `phantramhatbocvo` varchar(20) NOT NULL,
  `phantramgao` varchar(10) NOT NULL,
  `phantramtam` varchar(10) NOT NULL,
  `sangtapchat` varchar(10) NOT NULL,
  `gangbatthocphanly` varchar(10) NOT NULL,
  `khoiluongtrau` varchar(20) NOT NULL,
  `nguoivanhanh` varchar(50) NOT NULL,
  `noibaoquan` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chitietgiamsatbocvotachhat`
--

INSERT INTO `chitietgiamsatbocvotachhat` (`chitietgiamsatbocvotachhat_id`, `masolo_id`, `ngay`, `thoidiemkiemtra`, `apsuat`, `masologaoxo`, `khoiluonggaoxo`, `phantramhatbocvo`, `phantramgao`, `phantramtam`, `sangtapchat`, `gangbatthocphanly`, `khoiluongtrau`, `nguoivanhanh`, `noibaoquan`, `created_at`, `updated_at`) VALUES
(1, 71, '2023-05-22 00:57:33', '1h40', '22', 'JM2222ssnl', '200', '22', '34', '3', '32', '11', '22', 'Đạt', 'Kho', '2023-05-21 22:59:37', '2023-05-22 05:59:37');

-- --------------------------------------------------------

--
-- Table structure for table `chitietgiamsatlaubongtachda`
--

CREATE TABLE `chitietgiamsatlaubongtachda` (
  `chitietgiamsatlaubongtachda_id` int(11) NOT NULL,
  `masolo_id` int(11) NOT NULL,
  `tgkiemtra` varchar(20) NOT NULL,
  `doam` int(11) NOT NULL,
  `tam` int(11) NOT NULL,
  `hatphan` int(11) NOT NULL,
  `hathu` int(11) NOT NULL,
  `hatvang` int(11) NOT NULL,
  `hatxanhnon` int(11) NOT NULL,
  `hatdo` int(11) NOT NULL,
  `tapchat` int(11) NOT NULL,
  `hatnep` int(11) NOT NULL,
  `thoc` int(11) NOT NULL,
  `hatlanloai` int(10) NOT NULL,
  `nguoivanhanh` varchar(50) NOT NULL,
  `tapchatkhac` varchar(10) NOT NULL,
  `catda` varchar(10) NOT NULL,
  `xaccontrung` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chitietgiamsatlaubongtachda`
--

INSERT INTO `chitietgiamsatlaubongtachda` (`chitietgiamsatlaubongtachda_id`, `masolo_id`, `tgkiemtra`, `doam`, `tam`, `hatphan`, `hathu`, `hatvang`, `hatxanhnon`, `hatdo`, `tapchat`, `hatnep`, `thoc`, `hatlanloai`, `nguoivanhanh`, `tapchatkhac`, `catda`, `xaccontrung`) VALUES
(1, 71, '20h', 14, 4, 1, 1, 2, 0, 1, 0, 3, 3, 2, 'Đạt', 'K', 'K', 'K');

-- --------------------------------------------------------

--
-- Table structure for table `chitietgiamsatsaylua`
--

CREATE TABLE `chitietgiamsatsaylua` (
  `chitietgiamsatsaylua_id` int(11) NOT NULL,
  `thoidiemkiemtra` varchar(50) NOT NULL,
  `nhietdo` varchar(10) NOT NULL,
  `doammau1` varchar(10) NOT NULL,
  `doammau2` varchar(10) NOT NULL,
  `doammau3` varchar(10) NOT NULL,
  `doammau4` varchar(10) NOT NULL,
  `doammau5` varchar(10) NOT NULL,
  `doammau6` varchar(10) NOT NULL,
  `doammau7` varchar(10) NOT NULL,
  `doammau8` varchar(10) NOT NULL,
  `thongsovanhanh` varchar(10) NOT NULL,
  `tinhtranglosay` varchar(10) NOT NULL,
  `nguoivanhanh` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chitietgiamsatsaylua`
--

INSERT INTO `chitietgiamsatsaylua` (`chitietgiamsatsaylua_id`, `thoidiemkiemtra`, `nhietdo`, `doammau1`, `doammau2`, `doammau3`, `doammau4`, `doammau5`, `doammau6`, `doammau7`, `doammau8`, `thongsovanhanh`, `tinhtranglosay`, `nguoivanhanh`, `created_at`, `updated_at`) VALUES
(1, '1h40', '33', '18', '18', '20', '32', '13', '12', '33', '22', 'Đ', 'Đ', 'Tài', '2023-04-16 16:13:26', '2023-04-16 23:13:26'),
(2, '1h60', '20', '30', '33', '33', '24', '35', '30', '25', '25', 'Đ', 'Đ', 'Đạt', '2023-04-16 16:14:05', '2023-04-16 23:14:05'),
(3, '1h40', '33', '18', '18', '20', '32', '13', '12', '33', '22', 'Đ', 'Đ', 'Tài', '2023-04-22 23:20:17', '2023-04-23 06:20:17');

-- --------------------------------------------------------

--
-- Table structure for table `chitieuchatluong`
--

CREATE TABLE `chitieuchatluong` (
  `chitieuchatluong_id` int(11) NOT NULL,
  `doam` float NOT NULL,
  `tam` float NOT NULL,
  `tapchat` float NOT NULL,
  `hatnguyen` float NOT NULL,
  `hathuhong` float NOT NULL,
  `hatvang` float NOT NULL,
  `hatbacphan` float NOT NULL,
  `hatdo` float NOT NULL,
  `hatxanhnon` float NOT NULL,
  `rannut` float NOT NULL,
  `thoclan` float NOT NULL,
  `hatlanloai` float NOT NULL,
  `mausac` varchar(20) NOT NULL,
  `muivi` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chitieuchatluong`
--

INSERT INTO `chitieuchatluong` (`chitieuchatluong_id`, `doam`, `tam`, `tapchat`, `hatnguyen`, `hathuhong`, `hatvang`, `hatbacphan`, `hatdo`, `hatxanhnon`, `rannut`, `thoclan`, `hatlanloai`, `mausac`, `muivi`, `created_at`, `updated_at`) VALUES
(1, 29, 0, 3, 0, 2.7, 0, 3, 0, 0, 0, 0, 0, 'BT', 'BT', '2023-04-16 15:51:54', '2023-04-16 22:51:54'),
(2, 29, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 'BT', 'BT', '2023-04-16 15:52:22', '2023-04-16 22:53:02');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `khachhang_id` int(11) NOT NULL,
  `ten` varchar(50) NOT NULL,
  `diachi` varchar(50) NOT NULL,
  `sdt` int(9) NOT NULL,
  `ghichu` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`khachhang_id`, `ten`, `diachi`, `sdt`, `ghichu`, `created_at`, `updated_at`) VALUES
(1, 'Trần Ngọc Thanhh', 'An Giang', 962774937, 'anh Thanh', '2023-05-17 02:57:25', '2023-05-17 09:01:20'),
(2, 'Nguyễn Văn Sin', 'Kiên Giang', 962774939, 'Anh Sin', '2023-05-17 02:57:25', '2023-05-18 19:03:44'),
(3, 'Nguyễn Văn Hồng', 'Đồng Tháp', 962774937, 'anh Hồng', '2023-05-16 22:59:09', '2023-05-16 22:59:09'),
(4, 'Trần Thi Bé Tư', 'Sóc Trăng', 962774937, 'chị BÉ tư', '2023-05-16 23:16:49', '2023-05-17 00:16:32'),
(5, 'Nguyễn Văn Tài', 'Vĩnh Long', 962774937, 'anh Tìa', '2023-05-16 23:16:49', '2023-05-17 00:16:32'),
(6, 'Trần Thi Hai', 'Sóc Trăng', 962774937, 'chị Hai', '2023-05-16 23:16:49', '2023-05-17 00:16:32'),
(15, 'Nguyễn Văn Tuấn', 'Bạc Liêu', 962774937, 'anh Tuấn', '2023-05-16 23:16:49', '2023-05-17 00:16:32'),
(16, 'Nguyễn Bé', 'An Giang', 962774937, 'Bé', '2023-05-16 23:16:49', '2023-05-17 00:16:32'),
(17, 'Nguyễn Tư', 'Sóc Trăng', 962774937, 'Anh tư', '2023-05-16 23:16:49', '2023-05-17 00:16:32'),
(18, 'Trần Thi Ba', 'Sóc Trăng', 962774937, 'chị Hai', '2023-05-16 23:16:49', '2023-05-17 00:16:32'),
(19, 'Nguyễn Minh Tâm', 'Bạc Liêu', 962774937, 'anh Tâm', '2023-05-16 23:16:49', '2023-05-17 00:16:32');

-- --------------------------------------------------------

--
-- Table structure for table `kiemtranguongoclonguyenlieu`
--

CREATE TABLE `kiemtranguongoclonguyenlieu` (
  `kiemtranguongoclonguyenlieu_id` int(11) NOT NULL,
  `chitieuchatluong_id` int(11) NOT NULL,
  `masolo_id` int(20) NOT NULL,
  `hosotrongtrot` varchar(20) NOT NULL,
  `hosoxuatxu_camket` varchar(20) NOT NULL,
  `hosochungnhan_CoA` varchar(50) NOT NULL,
  `ketluan` text NOT NULL,
  `thoigiantiepnhan` varchar(50) NOT NULL,
  `noibaoquan` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ngay` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kiemtraphuongtien`
--

CREATE TABLE `kiemtraphuongtien` (
  `kiemtraphuongtien_id` int(11) NOT NULL,
  `batche` varchar(10) NOT NULL,
  `vesinh` varchar(10) NOT NULL,
  `baobi` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kiemtraphuongtien`
--

INSERT INTO `kiemtraphuongtien` (`kiemtraphuongtien_id`, `batche`, `vesinh`, `baobi`, `created_at`, `updated_at`) VALUES
(1, 'Đạt', 'đạt', 'Đạt', '2023-04-16 15:48:18', '2023-04-16 22:48:18'),
(2, 'Đạt', 'Đạt', 'Không', '2023-04-16 15:48:18', '2023-04-16 22:48:18');

-- --------------------------------------------------------

--
-- Table structure for table `kiemtraphuongtienvanchuyen`
--

CREATE TABLE `kiemtraphuongtienvanchuyen` (
  `kiemtraphuongtienvanchuyen_id` int(11) NOT NULL,
  `phuongtien_id` int(11) NOT NULL,
  `sanpham_id` datetime NOT NULL,
  `ngayxuathang` datetime NOT NULL,
  `loaisanpham` varchar(255) NOT NULL,
  `quycachdonggoi` int(50) NOT NULL,
  `noixuathang` varchar(50) NOT NULL,
  `sohopdong` varchar(20) NOT NULL,
  `soluong` varchar(20) NOT NULL,
  `thoigiankiemtra` date NOT NULL,
  `sophuongtien` varchar(20) NOT NULL,
  `soluongbao` varchar(20) NOT NULL,
  `soluongkg` varchar(20) NOT NULL,
  `dathoackhong` varchar(20) NOT NULL,
  `tgxuathangbd` datetime NOT NULL,
  `tgxuathangkt` datetime NOT NULL,
  `ghichu` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `loaisanpham_id` int(11) NOT NULL,
  `tenloai` varchar(20) NOT NULL,
  `mota` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `loaisanpham`
--

INSERT INTO `loaisanpham` (`loaisanpham_id`, `tenloai`, `mota`, `created_at`, `updated_at`) VALUES
(1, 'Lúa tươi', 'Mô tả', '2023-05-20 21:42:18', '2023-05-21 04:42:18'),
(2, 'Lúa khô', 'Mô tả', '2023-05-20 21:42:44', '2023-05-21 04:42:44'),
(4, 'Nếp', 'nếp', '2023-05-20 07:29:32', '2023-05-20 14:29:32'),
(5, 'Cám', 'Cám', '2023-05-20 21:42:18', '2023-05-21 04:42:18'),
(6, 'gạo xô', 'gạo xô', '2023-05-21 19:20:51', '2023-05-22 02:20:51'),
(555, 'lúa tiếp nhận', '....', '2023-05-19 17:02:30', '2023-05-20 00:02:30'),
(556, 'Sau nhập lô', 'sau khi nhập lô ', '2023-05-20 07:29:32', '2023-05-20 14:29:32'),
(557, 'lúa khô sau sấy ', 'sau khi sấy', '2023-05-20 21:42:18', '2023-05-21 04:42:18'),
(558, '504', '504', '2023-05-21 19:20:51', '2023-05-22 02:20:51'),
(559, 'Gạo thành phẩm', 'Gọa thanh phẩm', '2023-05-22 02:21:39', '2023-05-22 09:21:39'),
(560, 'Gạo nguyên liệu', 'Gạo nguyên liệu', '2023-05-22 02:22:01', '2023-05-22 09:22:01'),
(561, 'phế', 'phế', '2023-05-22 02:21:39', '2023-05-22 09:21:39'),
(565, 'Tấm', 'Tấm', '2023-05-22 03:27:53', '2023-05-22 10:27:53');

-- --------------------------------------------------------

--
-- Table structure for table `masolo`
--

CREATE TABLE `masolo` (
  `masolo_id` int(11) NOT NULL,
  `loaisanpham_id` int(11) NOT NULL,
  `trangthai` varchar(10) NOT NULL,
  `ten` varchar(20) NOT NULL,
  `masolo` varchar(50) NOT NULL,
  `khoiluong` int(11) NOT NULL,
  `khoiluongdadung` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `mota` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `masolo`
--

INSERT INTO `masolo` (`masolo_id`, `loaisanpham_id`, `trangthai`, `ten`, `masolo`, `khoiluong`, `khoiluongdadung`, `created_at`, `updated_at`, `mota`) VALUES
(1, 4, 'Hoạt động', 'Lô đã tiếp nhận', 'JM113', 300000, 0, '2023-05-20 21:44:05', '2023-05-22 02:46:33', 'Lô đã được tiếp nhận'),
(61, 6, 'Hoạt động', 'Lô đã tiếp nhận', 'ST112', 99996, 0, '2023-05-20 15:15:45', '2023-05-21 16:39:26', 'Lô đã được tiếp nhận'),
(62, 1, 'Hoạt động', 'Lô đã tiếp nhận', 'ST114', 50000, 0, '2023-05-20 21:44:05', '2023-05-21 22:01:01', 'Lô đã được tiếp nhận'),
(71, 1, 'Hoạt động', 'Lô đã tiếp nhận', 'ss', 12345, 0, '2023-05-21 06:34:31', '2023-05-21 16:50:35', 'Lô đã được tiếp nhận'),
(73, 555, 'Hoạt động', 'Lô lúa sấy', '1111ss', 1800, 0, '2023-05-21 19:38:08', '2023-05-22 02:38:08', 'Lô đã sấy'),
(80, 1, 'Hoạt động', 'Lô đã tiếp nhận', 'JM115', 312346, 0, '2023-05-20 21:44:05', '2023-05-22 02:53:45', 'Lô đã được tiếp nhận'),
(81, 1, 'Hoạt động', 'Lô đã tiếp nhận', 'ST116', 112345, 0, '2023-05-20 15:15:45', '2023-05-22 02:55:14', 'Lô đã được tiếp nhận'),
(82, 560, 'Hoạt động', 'Lô đã tiếp nhận', 'ST119', 62346, 0, '2023-05-20 21:44:05', '2023-05-22 02:54:41', 'Lô đã được tiếp nhận'),
(83, 1, 'Hoạt động', 'Lô đã tiếp nhận', 'DT231', 17000, 0, '2023-05-21 06:34:31', '2023-05-22 02:54:20', 'Lô đã được tiếp nhận');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(8, '2014_10_12_000000_create_users_table', 1),
(9, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(10, '2019_08_19_000000_create_failed_jobs_table', 1),
(11, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(12, '2023_04_13_134406_create_customers_table', 1),
(13, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(14, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(15, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(16, '2016_06_01_000004_create_oauth_clients_table', 2),
(17, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(18, '2023_04_16_173554_create_phieudieuphuongtiens_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '3991b72d98b114ce235b64595ccbb2bbae1478b4bfcb63ffb1156bbfae50d331', '[\"*\"]', NULL, NULL, '2023-04-16 11:37:51', '2023-04-16 11:37:51'),
(2, 'App\\Models\\User', 1, 'auth_token', 'f19af03e3d01ad4c3301bb9fec220fa83d64f96b9cee9093e46c43e1778ce581', '[\"*\"]', NULL, NULL, '2023-04-16 11:38:01', '2023-04-16 11:38:01'),
(3, 'App\\Models\\User', 1, 'auth_token', '897f6c41eec0ee7c07dd14671c652b5ef3930e49ea9302b86fd60f3e4d2f058c', '[\"*\"]', NULL, NULL, '2023-04-16 11:47:41', '2023-04-16 11:47:41'),
(4, 'App\\Models\\User', 1, 'auth_token', 'e339effa0ee5dfe6716f48ba60c0baa97f748277072a4f60771bbc44bb390de9', '[\"*\"]', NULL, NULL, '2023-04-16 12:41:42', '2023-04-16 12:41:42'),
(5, 'App\\Models\\User', 2, 'auth_token', '11a7fb164f422e6c010ee490687df087c902f8fd67039eb6820aebb700aa538d', '[\"*\"]', NULL, NULL, '2023-04-16 22:31:16', '2023-04-16 22:31:16'),
(6, 'App\\Models\\User', 2, 'auth_token', 'c1a02f7757b20170b63c01d1b1476a6f9fd5b44f3ee7e758072ad78c44fc8740', '[\"*\"]', NULL, NULL, '2023-04-16 22:44:23', '2023-04-16 22:44:23'),
(7, 'App\\Models\\User', 2, 'auth_token', '347ffcb9dd94ac9810638190206a6c3c9b8a0cfdc410a1f8cf98dab898c606f8', '[\"*\"]', NULL, NULL, '2023-04-16 22:58:03', '2023-04-16 22:58:03'),
(8, 'App\\Models\\User', 2, 'auth_token', 'c18915b93923a7f122e2e47cc34d03cc27f5914f18b930cb896f2f0b580b85f0', '[\"*\"]', NULL, NULL, '2023-04-21 09:44:49', '2023-04-21 09:44:49'),
(9, 'App\\Models\\User', 2, 'auth_token', '325cb39e94f55bf8bbec49d2ae93260a683648d1882e76586f37ec37c6d9edc1', '[\"*\"]', NULL, NULL, '2023-04-21 10:32:33', '2023-04-21 10:32:33'),
(10, 'App\\Models\\User', 2, 'auth_token', '8ea8e11fd6d68fea06774a8648d20cc77a688553fb295910f66e39c4871cbedc', '[\"*\"]', NULL, NULL, '2023-04-21 11:06:05', '2023-04-21 11:06:05'),
(11, 'App\\Models\\User', 2, 'auth_token', '86964df2c295c614f7c00459c8d41c8959c89e47b3149ae6453eab3c4cd6c03a', '[\"*\"]', NULL, NULL, '2023-04-21 11:10:58', '2023-04-21 11:10:58'),
(12, 'App\\Models\\User', 3, 'auth_token', '3adbfb054a77e76f50d7bcb31deea7fb02a532dc4cef5fe41f288a471477ecbb', '[\"*\"]', NULL, NULL, '2023-04-21 18:08:30', '2023-04-21 18:08:30'),
(13, 'App\\Models\\User', 4, 'auth_token', '3b698763a0dbffc4d70a43f80ad17bae0e336d5947a1cd9175d66cf8a2312c98', '[\"*\"]', NULL, NULL, '2023-04-21 19:10:00', '2023-04-21 19:10:00'),
(14, 'App\\Models\\User', 5, 'auth_token', '0f36720e1a7c447df7bdbb7e18f8ceb27c444ceab8d40b04b1ca62a169e8317e', '[\"*\"]', NULL, NULL, '2023-04-21 19:11:03', '2023-04-21 19:11:03'),
(15, 'App\\Models\\User', 6, 'auth_token', 'b968ac0b1a9a14d322221677e9604222ccb9931d7f4c511f729a1eab9694ef24', '[\"*\"]', NULL, NULL, '2023-04-21 19:14:13', '2023-04-21 19:14:13'),
(16, 'App\\Models\\User', 7, 'auth_token', 'd5d80e1cdd87a2950c71a92ca4c995e10d972e4d656167b7156975c6b595bf69', '[\"*\"]', NULL, NULL, '2023-04-21 19:15:11', '2023-04-21 19:15:11'),
(17, 'App\\Models\\User', 8, 'auth_token', 'bc90ec2167a52096dec8dae8860a728a50bbfe5f54c8bc4f649551f93c606235', '[\"*\"]', NULL, NULL, '2023-04-21 19:18:38', '2023-04-21 19:18:38'),
(18, 'App\\Models\\User', 9, 'auth_token', 'b6a5dee26fcf97727c1c11be5bb3ed0a183c88414919d2669abad4e10263b745', '[\"*\"]', NULL, NULL, '2023-04-21 19:20:46', '2023-04-21 19:20:46'),
(19, 'App\\Models\\User', 10, 'auth_token', 'e96dedbab0d3b093e7d80934d01cb3ef02859cf7409f1a5d2e33715d32964d56', '[\"*\"]', NULL, NULL, '2023-04-21 19:22:09', '2023-04-21 19:22:09'),
(20, 'App\\Models\\User', 11, 'auth_token', '354079cedad4272060af97678552b78b20c8bf619a1af2e1240a894b332e7049', '[\"*\"]', NULL, NULL, '2023-04-21 19:23:44', '2023-04-21 19:23:44'),
(21, 'App\\Models\\User', 11, 'auth_token', 'abba268ec5e5a020aab544de1256b35fe8824506ce12bd29dab17b6b258b0c02', '[\"*\"]', NULL, NULL, '2023-04-21 19:24:12', '2023-04-21 19:24:12'),
(22, 'App\\Models\\User', 11, 'auth_token', 'fbb01390599998f0ed9e709f340f0789da32771856fb15710a59c08325e80e49', '[\"*\"]', NULL, NULL, '2023-04-21 19:29:02', '2023-04-21 19:29:02'),
(23, 'App\\Models\\User', 11, 'auth_token', 'f81ca8ab56ccb6c6a5d381ffad0421e3d2cfc3214fe3d9bd3a8295cbe0217934', '[\"*\"]', NULL, NULL, '2023-04-21 19:31:44', '2023-04-21 19:31:44'),
(24, 'App\\Models\\User', 2, 'auth_token', '4812c9e348d60dbb2f5821ea552cee2f7a092409a3a3b3402219f5c4a2062f03', '[\"*\"]', NULL, NULL, '2023-04-21 22:39:39', '2023-04-21 22:39:39'),
(25, 'App\\Models\\User', 2, 'auth_token', 'e33f8bf1791c01ab3c1fec1d71f79adcf8ed866881bfe5ea04f904cf6a245bef', '[\"*\"]', NULL, NULL, '2023-04-21 23:26:54', '2023-04-21 23:26:54'),
(26, 'App\\Models\\User', 2, 'auth_token', '1d6046bac58b0ad60492c567019b85913dc0d8f1026dfa516f8eedcfbd57d636', '[\"*\"]', NULL, NULL, '2023-04-22 00:06:45', '2023-04-22 00:06:45'),
(27, 'App\\Models\\User', 11, 'auth_token', 'c53542160d5c69ed8c27365baff97c4014c52073574b61856308ca8378a78868', '[\"*\"]', NULL, NULL, '2023-04-22 00:58:30', '2023-04-22 00:58:30'),
(28, 'App\\Models\\User', 11, 'auth_token', '7ccdef68a272ab5c1ed0c1859c571bf5235a87660bf2fdcef5858ea13e5e0f69', '[\"*\"]', NULL, NULL, '2023-04-22 01:15:32', '2023-04-22 01:15:32'),
(29, 'App\\Models\\User', 11, 'auth_token', '3ea896e34ffa52dbc82af5404fa7957d9c6246af944179f7e768e317a1822e09', '[\"*\"]', NULL, NULL, '2023-04-22 01:25:13', '2023-04-22 01:25:13'),
(30, 'App\\Models\\User', 11, 'auth_token', 'f1892d100c3253c9d074c2a162ad03a509ce03bb025fdee38e246e43dbc1a7df', '[\"*\"]', NULL, NULL, '2023-04-22 01:29:09', '2023-04-22 01:29:09'),
(31, 'App\\Models\\User', 2, 'auth_token', '0d6e87396624f9a832d5dc1aafbb63b94697e252f938cf4649cecdb51cc2b27c', '[\"*\"]', NULL, NULL, '2023-04-22 01:57:12', '2023-04-22 01:57:12'),
(32, 'App\\Models\\User', 2, 'auth_token', '6e142f4652474659896c4445ae4041109638386875999342b60ebfcaa51fa22b', '[\"*\"]', NULL, NULL, '2023-04-22 02:22:06', '2023-04-22 02:22:06'),
(33, 'App\\Models\\User', 2, 'auth_token', '4ab796ef5cbbce39fa695265118a4258005e6659a13638dbac006340d32843a6', '[\"*\"]', NULL, NULL, '2023-04-22 02:22:06', '2023-04-22 02:22:06'),
(34, 'App\\Models\\User', 2, 'auth_token', '9904ee7e7ee8f7cf3d25d56129cedeb7a0fb9d7d64080748c4287ecd4c206f13', '[\"*\"]', NULL, NULL, '2023-04-22 05:12:00', '2023-04-22 05:12:00'),
(35, 'App\\Models\\User', 2, 'auth_token', '8a7bc114fe1a1f2628b68e81831cf6a8d5494dd53cd9315b014114a054cf7be3', '[\"*\"]', NULL, NULL, '2023-04-22 08:07:07', '2023-04-22 08:07:07'),
(36, 'App\\Models\\User', 2, 'auth_token', 'd8bb55ac8dd8f75aa09395d74929555d994b367979430a98f809cb045ff1139e', '[\"*\"]', NULL, NULL, '2023-04-22 09:07:36', '2023-04-22 09:07:36'),
(37, 'App\\Models\\User', 12, 'auth_token', 'bb08ce63b9820b72697d1c68361a9d536d4b613fdfef9ebfe708c0b7506c0643', '[\"*\"]', NULL, NULL, '2023-04-22 10:52:08', '2023-04-22 10:52:08'),
(38, 'App\\Models\\User', 2, 'auth_token', '002816f648d07237c32e226b549b0c93844d97f88c729db648099b66d9440a33', '[\"*\"]', NULL, NULL, '2023-04-22 10:52:22', '2023-04-22 10:52:22'),
(39, 'App\\Models\\User', 2, 'auth_token', 'a82a4c7c592032aba3746c5d888467cdb600b62f15fbaaa218b1aa6d0d321852', '[\"*\"]', NULL, NULL, '2023-04-22 11:37:04', '2023-04-22 11:37:04'),
(40, 'App\\Models\\User', 2, 'auth_token', 'd0b02d396bd0dc975ef1aaf2864cf4ec7167c931a3b0aa7d7dc34153763c2919', '[\"*\"]', NULL, NULL, '2023-04-22 11:37:05', '2023-04-22 11:37:05'),
(41, 'App\\Models\\User', 2, 'auth_token', '8c666f5afd285db386f111cda338c882abd07aefbd92f88e1fd69213422d828a', '[\"*\"]', NULL, NULL, '2023-04-22 18:46:03', '2023-04-22 18:46:03'),
(42, 'App\\Models\\User', 2, 'auth_token', 'b24033583a2908f15eb80cec761854f2973b3100a7457d4bc6584b288c3947ce', '[\"*\"]', NULL, NULL, '2023-04-23 00:30:01', '2023-04-23 00:30:01'),
(43, 'App\\Models\\User', 11, 'auth_token', '3fd073235036da5cf2503dacbd9e7ceff04817a98898961bd812154c1ace7793', '[\"*\"]', NULL, NULL, '2023-04-23 01:16:25', '2023-04-23 01:16:25'),
(44, 'App\\Models\\User', 11, 'auth_token', 'f099563e54d39aa74283967e286765ba4d3f55805b74abea852ebfc3aeaf967a', '[\"*\"]', NULL, NULL, '2023-04-23 01:35:56', '2023-04-23 01:35:56'),
(45, 'App\\Models\\User', 2, 'auth_token', 'e145e55976571c807402502884a59c7f6634d8c8fa2754daa9a8dae4ba42092d', '[\"*\"]', NULL, NULL, '2023-04-23 09:07:02', '2023-04-23 09:07:02'),
(46, 'App\\Models\\User', 2, 'auth_token', 'e604b1907a0ac75b46e21bc21ff4a59229ebe2a9c44380ce61b4c77654dd3102', '[\"*\"]', NULL, NULL, '2023-04-23 09:07:03', '2023-04-23 09:07:03'),
(47, 'App\\Models\\User', 2, 'auth_token', 'b78eb1a9ceb4a7c90430043e251d27d6dcea5ed5bf0977ff80e656d38193722a', '[\"*\"]', NULL, NULL, '2023-05-10 07:18:01', '2023-05-10 07:18:01'),
(48, 'App\\Models\\User', 2, 'auth_token', '48e978bd81bf37ef750d4762c2ff26458a48cdcce5385d9dce93708dea49b23e', '[\"*\"]', NULL, NULL, '2023-05-10 23:44:56', '2023-05-10 23:44:56'),
(49, 'App\\Models\\User', 2, 'auth_token', '129f0d64dc1c69de595536abe06e8b828ba70add3077944eea94ca7346a45160', '[\"*\"]', NULL, NULL, '2023-05-11 00:31:23', '2023-05-11 00:31:23'),
(50, 'App\\Models\\User', 2, 'auth_token', '17cffdab4b8ebbb696023bf4a3c5494e3ab3f7c9ce0fed83526a210959283c7c', '[\"*\"]', NULL, NULL, '2023-05-11 00:35:17', '2023-05-11 00:35:17'),
(51, 'App\\Models\\User', 2, 'auth_token', 'faab034e951c2d1efe2f9675c982fb203d400c5a1f6f99e52fe391334537cd91', '[\"*\"]', NULL, NULL, '2023-05-11 01:14:38', '2023-05-11 01:14:38'),
(52, 'App\\Models\\User', 2, 'auth_token', 'b3d81ec3e0dc50bc0716c1bee2ec6d507bcd8fb23a0857f232eecaff63494677', '[\"*\"]', NULL, NULL, '2023-05-11 01:19:12', '2023-05-11 01:19:12'),
(53, 'App\\Models\\User', 2, 'auth_token', 'fcf93a75e2a59e18dcf0e2ab2056272875c2c014d95d92bfd62c21ea1acc87f9', '[\"*\"]', NULL, NULL, '2023-05-11 01:29:35', '2023-05-11 01:29:35'),
(54, 'App\\Models\\User', 2, 'auth_token', '94a63d3820adaf9595e8c5205c05b416e20460c480e03dfebe294fab2f17f481', '[\"*\"]', NULL, NULL, '2023-05-11 01:39:23', '2023-05-11 01:39:23'),
(55, 'App\\Models\\User', 2, 'auth_token', 'e82aa9e0e333efa3ad2839d1d98ca616ffa602d1b3c9578e2435698511ef8da3', '[\"*\"]', NULL, NULL, '2023-05-11 01:49:34', '2023-05-11 01:49:34'),
(56, 'App\\Models\\User', 2, 'auth_token', 'b100d24a5b2075412f5717b99a587b69abd575c0c7b3d7d56a3276179d945436', '[\"*\"]', NULL, NULL, '2023-05-11 03:59:17', '2023-05-11 03:59:17'),
(57, 'App\\Models\\User', 2, 'auth_token', '7535336a1b52a044205a7fe0421da549f46bf447632ddfd83d9bb7b84f7def72', '[\"*\"]', NULL, NULL, '2023-05-11 04:08:59', '2023-05-11 04:08:59'),
(58, 'App\\Models\\User', 2, 'auth_token', '63b803e6826e53dbb3852a7c0b14a4a630905d430082671cfa3756bcd6c4d1e2', '[\"*\"]', NULL, NULL, '2023-05-11 07:13:36', '2023-05-11 07:13:36'),
(59, 'App\\Models\\User', 2, 'auth_token', 'a23a44959e58b32c9e83e0afc5b907ac614aa469d4981c1f208848af2a90b1b2', '[\"*\"]', NULL, NULL, '2023-05-11 09:36:03', '2023-05-11 09:36:03'),
(60, 'App\\Models\\User', 2, 'auth_token', '32182bc5b3f2fcbb9ab4112d93749278ca6c771cb51656e0dd9e033fa016d068', '[\"*\"]', NULL, NULL, '2023-05-11 09:42:34', '2023-05-11 09:42:34'),
(61, 'App\\Models\\User', 2, 'auth_token', '05ea9c26b19b0a3e2d02ba5d62aa89d258c420dc879244ddaf56329b4e3f7629', '[\"*\"]', NULL, NULL, '2023-05-11 09:46:01', '2023-05-11 09:46:01'),
(62, 'App\\Models\\User', 2, 'auth_token', '3b0acaa62d2f82a457700add9a18569fd3c236bc5873e49a59c1791700ac6aea', '[\"*\"]', NULL, NULL, '2023-05-11 09:51:22', '2023-05-11 09:51:22'),
(63, 'App\\Models\\User', 1, 'auth_token', '10971bff9d95c36f6c8adfeaea4e689f37f2b81a6e3e5d4ea1be3e12f6f03efb', '[\"*\"]', NULL, NULL, '2023-05-11 10:02:56', '2023-05-11 10:02:56'),
(65, 'App\\Models\\User', 1, 'auth_token', '018273e6cc3247ee214bb3063cafb5d0e5a35725832577c773a155da4c3e1a66', '[\"*\"]', NULL, NULL, '2023-05-11 12:38:09', '2023-05-11 12:38:09'),
(68, 'App\\Models\\User', 2, 'auth_token', 'b916f8ba3acab478459b5694139d7c535bef9dc4dd77999ffbb561171303887f', '[\"*\"]', NULL, NULL, '2023-05-11 14:24:16', '2023-05-11 14:24:16'),
(69, 'App\\Models\\User', 2, 'auth_token', '57b22a67541a48745a414ff5d41ae49232c166cdb9c5210c1dc354a29530a47b', '[\"*\"]', NULL, NULL, '2023-05-11 14:24:17', '2023-05-11 14:24:17'),
(70, 'App\\Models\\User', 2, 'auth_token', '655e4491a6541bb6285520c77697763f374c01ca691dec244ab05623e27af869', '[\"*\"]', NULL, NULL, '2023-05-11 14:24:17', '2023-05-11 14:24:17'),
(71, 'App\\Models\\User', 2, 'auth_token', '4af61fd7383dc35fbaad8e96976a596e4b85682f33c89dccdb17bb33bae30fc1', '[\"*\"]', NULL, NULL, '2023-05-11 14:24:17', '2023-05-11 14:24:17'),
(72, 'App\\Models\\User', 2, 'auth_token', '3fb6c75e14cf3102725f764701980e1173e14daf3b558c3e8e247abbce45eaba', '[\"*\"]', NULL, NULL, '2023-05-11 23:42:29', '2023-05-11 23:42:29'),
(73, 'App\\Models\\User', 2, 'auth_token', 'db44e2e17c9cd7925d66d43ee3a028a1477e4729fb377e756957fcbf8ff7f844', '[\"*\"]', NULL, NULL, '2023-05-13 09:05:22', '2023-05-13 09:05:22'),
(74, 'App\\Models\\User', 2, 'auth_token', 'a69a23b71b7f9c9800bf7cc431717266e3664465eefe8de6398aa598d2913a81', '[\"*\"]', NULL, NULL, '2023-05-22 01:36:13', '2023-05-22 01:36:13'),
(75, 'App\\Models\\User', 2, 'auth_token', 'd726c8a59dacc65ecfdc7cc8ba94e8bc1de79b132b0d472965d66b2347b9fe00', '[\"*\"]', NULL, NULL, '2023-05-22 02:43:42', '2023-05-22 02:43:42'),
(76, 'App\\Models\\User', 2, 'auth_token', '5984e228cd40b53682a6535fa6252bb98b5eb775a984489f8357fa056da5cd8f', '[\"*\"]', NULL, NULL, '2023-05-22 02:43:43', '2023-05-22 02:43:43'),
(77, 'App\\Models\\User', 2, 'auth_token', '0a88fe2b1d326ce28e64f70198d0c7c672823cf06e10916ea481ba80b0f508e2', '[\"*\"]', NULL, NULL, '2023-05-22 02:43:44', '2023-05-22 02:43:44'),
(78, 'App\\Models\\User', 2, 'auth_token', '127d9f7f5696465ea75e513e1c647b2a17bb9ab24e1dff1b34568150e5f51925', '[\"*\"]', NULL, NULL, '2023-05-22 02:43:44', '2023-05-22 02:43:44'),
(79, 'App\\Models\\User', 2, 'auth_token', '114f94b991b33709d84b48c44783469fe6a479fe7de2779f985fa82d9b330c96', '[\"*\"]', NULL, NULL, '2023-05-22 02:43:44', '2023-05-22 02:43:44'),
(80, 'App\\Models\\User', 2, 'auth_token', '84ffce50e44af102fdf600947e33db4f0554f68d35951f70f168437053d88298', '[\"*\"]', NULL, NULL, '2023-05-22 02:46:55', '2023-05-22 02:46:55');

-- --------------------------------------------------------

--
-- Table structure for table `phieudieuphuongtien`
--

CREATE TABLE `phieudieuphuongtien` (
  `phieudieuphuongtien_id` int(11) NOT NULL,
  `phuongtien_id` int(11) NOT NULL,
  `sanpham_id` int(11) NOT NULL,
  `masolo_id` int(11) NOT NULL,
  `khachhang_id` int(11) NOT NULL,
  `ngayxuatben` datetime NOT NULL,
  `diachivung` varchar(255) NOT NULL,
  `daidienphuongtien` varchar(50) NOT NULL,
  `soluong` varchar(50) NOT NULL,
  `tinhtrang` varchar(50) NOT NULL,
  `baoquan` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phieudieuphuongtien`
--

INSERT INTO `phieudieuphuongtien` (`phieudieuphuongtien_id`, `phuongtien_id`, `sanpham_id`, `masolo_id`, `khachhang_id`, `ngayxuatben`, `diachivung`, `daidienphuongtien`, `soluong`, `tinhtrang`, `baoquan`, `created_at`, `updated_at`) VALUES
(1, 5, 2, 1, 15, '2023-05-20 23:46:36', 'An Giang', 'Tiến', '30', 'tốt', 'tốt', '2023-05-20 21:47:31', '2023-05-21 21:59:38'),
(2, 5, 1, 1, 16, '2023-05-20 23:46:36', 'An Giang', 'Tài', '30000', 'tốt', 'tốt', '2023-05-20 21:47:31', '2023-05-21 21:59:38'),
(113, 8, 2, 1, 19, '2023-05-20 23:46:36', 'An Giang', 'Tiến', '30', 'tốt', 'tốt', '2023-05-20 21:47:31', '2023-05-21 21:59:38');

-- --------------------------------------------------------

--
-- Table structure for table `phuongtien`
--

CREATE TABLE `phuongtien` (
  `phuongtien_id` int(11) NOT NULL,
  `tenphuongtien` varchar(20) NOT NULL,
  `sophuongtien` varchar(20) NOT NULL,
  `tinhtrangvesinh` varchar(10) NOT NULL,
  `baoquansanpham` varchar(10) NOT NULL,
  `taitrong` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phuongtien`
--

INSERT INTO `phuongtien` (`phuongtien_id`, `tenphuongtien`, `sophuongtien`, `tinhtrangvesinh`, `baoquansanpham`, `taitrong`, `created_at`, `updated_at`) VALUES
(2, 'Xe Container', 'CL_7832.3', 'Đạt', 'Tốt', '200000', '2023-04-16 15:29:54', '2023-05-17 16:02:25'),
(3, 'Tàu', 'Ag_1236', 'Tốt', 'Tốt', '45000', '2023-04-16 15:29:54', '2023-04-16 22:29:54'),
(4, 'Xe Tải', 'XT_6798.3', 'Tốt', 'Đạt', '3000', '2023-04-18 21:37:01', '2023-04-19 04:37:01'),
(5, 'Ghe', 'LT_7293', 'Tốt', 'Đạt', '5000', '2023-04-22 09:01:02', '2023-04-22 16:01:02'),
(8, 'Sà Lan', 'KG_8923', 'Tốt', 'Đạt', '3000', '2023-04-22 23:19:26', '2023-04-23 06:19:26'),
(9, 'Xe Container', 'AG_1237', 'Tốt', 'Đạt', '30000', '2023-04-22 23:19:30', '2023-04-23 06:19:30'),
(10, 'Tàu', 'AG_8332', 'Tốt', 'Đạt', '30000', '2023-05-13 11:00:22', '2023-05-13 18:00:22'),
(12, 'ghe', 'AG_1237', 'Tốt', 'Đạt', '3000', '2023-05-13 11:01:48', '2023-05-13 18:01:48');

-- --------------------------------------------------------

--
-- Table structure for table `rakimloai`
--

CREATE TABLE `rakimloai` (
  `rakimloai_id` int(11) NOT NULL,
  `masolo_id` int(11) NOT NULL,
  `sanpham_id` int(11) NOT NULL,
  `noibaoquan` varchar(50) NOT NULL,
  `hopdong` varchar(10) NOT NULL,
  `tgkiemtra` datetime NOT NULL,
  `khoiluong` varchar(20) NOT NULL,
  `khoiluongcokimloai` varchar(20) NOT NULL,
  `mauthufe` varchar(20) NOT NULL,
  `mauthunfe` varchar(20) NOT NULL,
  `mauthuS316` varchar(20) NOT NULL,
  `nhanxet` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rakimloai`
--

INSERT INTO `rakimloai` (`rakimloai_id`, `masolo_id`, `sanpham_id`, `noibaoquan`, `hopdong`, `tgkiemtra`, `khoiluong`, `khoiluongcokimloai`, `mauthufe`, `mauthunfe`, `mauthuS316`, `nhanxet`, `created_at`, `updated_at`) VALUES
(1, 1, 39, 'Ghe', 'HD531_1', '2023-05-22 05:28:03', '30000', '0', 'Đạt', 'Đạt', 'Đạt', 'Không ', '2023-05-22 03:29:10', '2023-05-22 10:29:10');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `sanpham_id` int(11) NOT NULL,
  `loaisanpham_id` int(11) NOT NULL,
  `tensanpham` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`sanpham_id`, `loaisanpham_id`, `tensanpham`, `created_at`, `updated_at`) VALUES
(1, 1, 'js tươi', '2023-05-20 21:46:02', '2023-05-21 04:46:02'),
(2, 1, 'lúa jesmean', '2023-05-20 21:46:29', '2023-05-21 04:46:29'),
(37, 1, 'lúa khô ', '2023-05-22 02:22:30', '2023-05-22 09:22:30'),
(38, 560, 'lúa ướt', '2023-05-22 02:22:30', '2023-05-22 09:22:30'),
(39, 560, 'Gạo jemean', '2023-05-22 02:22:30', '2023-05-22 09:22:30'),
(40, 560, 'lúa ướt', '2023-05-22 02:22:30', '2023-05-22 09:22:30');

-- --------------------------------------------------------

--
-- Table structure for table `testapi`
--

CREATE TABLE `testapi` (
  `id` int(11) NOT NULL,
  `kieuInt` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `testapi`
--

INSERT INTO `testapi` (`id`, `kieuInt`, `created_at`, `updated_at`) VALUES
(1, 5, '2023-05-12 15:54:15', '2023-05-12 08:54:22'),
(2, 3, '2023-05-12 15:54:15', '2023-05-12 15:54:15');

-- --------------------------------------------------------

--
-- Table structure for table `tokhaixuatxu_camket`
--

CREATE TABLE `tokhaixuatxu_camket` (
  `tokhaixuatxucamket_id` int(11) NOT NULL,
  `phuongtien_id` int(11) NOT NULL,
  `loaisanpham_id` int(11) NOT NULL,
  `khachhang_id` int(11) NOT NULL,
  `soluong` varchar(20) NOT NULL,
  `vungnguyenlieu` varchar(255) NOT NULL,
  `chatluongnguyenlieu` varchar(20) NOT NULL,
  `ngay` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tokhaixuatxu_camket`
--

INSERT INTO `tokhaixuatxu_camket` (`tokhaixuatxucamket_id`, `phuongtien_id`, `loaisanpham_id`, `khachhang_id`, `soluong`, `vungnguyenlieu`, `chatluongnguyenlieu`, `ngay`, `created_at`, `updated_at`) VALUES
(1, 8, 1, 3, '30000', 'Đồng tháp', 'Đạt', '2023-05-22 04:18:24', '2023-05-22 02:19:40', '2023-05-22 09:19:40'),
(2, 8, 2, 15, '20000', 'Bạc Liêu', 'Đạt', '2023-05-22 04:18:24', '2023-05-22 02:19:40', '2023-05-22 09:19:40'),
(3, 8, 560, 19, '30000', 'Kiên Giang', 'Đạt', '2023-05-22 04:18:24', '2023-05-22 02:19:40', '2023-05-22 09:19:40'),
(4, 8, 1, 17, '30000', 'Kiên Giang', 'Đạt', '2023-05-22 04:18:24', '2023-05-22 02:19:40', '2023-05-22 09:19:40'),
(1013, 5, 2, 15, '30000', 'Đồng tháp', 'Đạt', '2023-05-22 04:18:24', '2023-05-22 02:19:40', '2023-05-22 09:19:40'),
(1014, 3, 4, 3, '30000', 'Kiên Giang', 'Đạt', '2023-05-22 04:18:24', '2023-05-22 02:19:40', '2023-05-22 09:19:40'),
(1015, 2, 1, 6, '30000', 'Kiên Giang', 'Đạt', '2023-05-22 04:18:24', '2023-05-22 02:19:40', '2023-05-22 09:19:40'),
(1016, 4, 2, 19, '30000', 'Đồng tháp', 'Đạt', '2023-05-22 04:18:24', '2023-05-22 02:19:40', '2023-05-22 09:19:40'),
(1017, 8, 1, 1, '30000', 'Đồng tháp', 'Đạt', '2023-05-22 00:00:00', '2023-05-22 01:37:04', '2023-05-22 08:37:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Văn Tèo', 'teonv@gmail.com', NULL, '$2y$10$lPDGRUGQBBoDiAVp3u7RMucu7QqlvJfjIv678Fzmt72a4C7H4lnAC', NULL, '2023-04-16 11:37:51', '2023-04-16 11:37:51'),
(2, 'Trần Ngọc Thanh', 'Thanh@gmail.com', NULL, '$2y$10$6GrMS4pQ.27CL48ESuvCOOy8UkAS5ZyUTCIQFSv32T2vlmhdwudSq', NULL, '2023-04-16 22:31:16', '2023-04-16 22:31:16'),
(3, 'Tran Ngoc Thanh', 'thanh1@gmail.com', NULL, '$2y$10$f/D4oHRNOI2la6P1/pm5LuxIxVyeodTPYuI0ZjTBDAhYQ3QGE13He', NULL, '2023-04-21 18:08:30', '2023-04-21 18:08:30'),
(4, 'thanh saa', 'sa@gmail.com', NULL, '$2y$10$Ks6qm53toUfzIgYzhBj5xeqQXZlsTFNVmcnYoNGaAKqcPJ3VTbhIW', NULL, '2023-04-21 19:10:00', '2023-04-21 19:10:00'),
(5, 'Tran Ngoc Thanh 2', 'thanh12@gmail.com', NULL, '$2y$10$9ynCZl5kV5kcvAHi0yLiMOOYc54Q0gY1u.0j8xskulp/wC09Sh6Ue', NULL, '2023-04-21 19:11:03', '2023-04-21 19:11:03'),
(6, 'thanh saa', 'ssa@gmail.com', NULL, '$2y$10$NqPDD69IXCaJDH5ZsNZqZuOo39lZyD0iNOMj9UG3wFOwS/oUdkNsi', NULL, '2023-04-21 19:14:13', '2023-04-21 19:14:13'),
(7, 'thanh saa', 'ssaa@gmail.com', NULL, '$2y$10$YPNhdTbnNzVAUVlVTrEGfuF7jWzrbn2GT6H.Z320lFUj2PkRGa//e', NULL, '2023-04-21 19:15:11', '2023-04-21 19:15:11'),
(8, 'abcd', 'abcd@gmail.com', NULL, '$2y$10$/dzSEScUTpAbszysuk3Sd.ejKb2OE2pla4a7lpsqK21vWtHw5DT42', NULL, '2023-04-21 19:18:38', '2023-04-21 19:18:38'),
(9, 'Tran Ngoc Thanh 2', 'thanh12@gmail.co', NULL, '$2y$10$q2N.ic8HoPf3Kb4gssy01uuKacfBHFkV0c1a9WhkXxJNLQW62h.za', NULL, '2023-04-21 19:20:46', '2023-04-21 19:20:46'),
(10, 'abcd', 'abcd@gmail.co', NULL, '$2y$10$h3/4K3aWoajmF7.hH.SQc.Scgbf9GjbLUpEONqp5fg22w9eZ8iR0m', NULL, '2023-04-21 19:22:09', '2023-04-21 19:22:09'),
(11, 'abcd', 'abcd@gmail.coll', NULL, '$2y$10$8myHaAQGI3xJkoj4E8I9YeLtYMwFu9U/1uBjIDDhxW5ctLfJz.G2a', NULL, '2023-04-21 19:23:44', '2023-04-21 19:23:44'),
(12, 'Thanh', 'abc@gmail.com', NULL, '$2y$10$m56rV4JsnEbylyN0B7NYQuamIY1KLu6E3EZFZcp7/ePeNrUSvA9Sq', NULL, '2023-04-22 10:52:08', '2023-04-22 10:52:08'),
(13, 'Tran Ngoc Thanh', 'thanh321@gmail.com', NULL, '$2y$10$M3VunnDqopocoTdv1tyCW.NNctGhtrDc8bpoRQdnriIpo.dMwLl7m', NULL, '2023-05-11 12:32:14', '2023-05-11 12:32:14');

-- --------------------------------------------------------

--
-- Table structure for table `vungsanpham`
--

CREATE TABLE `vungsanpham` (
  `vungsanpham_id` int(11) NOT NULL,
  `tenvung` varchar(255) NOT NULL,
  `mota` text NOT NULL,
  `diachivung` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vungsanpham`
--

INSERT INTO `vungsanpham` (`vungsanpham_id`, `tenvung`, `mota`, `diachivung`, `created_at`, `updated_at`) VALUES
(1, 'Kiên Giang', 'ở Kiên Giang', 'Kiên Giang', '2023-04-16 15:31:37', '2023-04-16 22:31:37'),
(2, 'An Giang', 'Ở An Giang', 'An Giang', '2023-04-16 15:31:37', '2023-04-16 22:31:37'),
(3, 'Đồng Tháp', 'ĐT', 'ĐT', '2023-04-16 15:32:09', '2023-04-16 22:32:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `baocaogiamsatlaubong`
--
ALTER TABLE `baocaogiamsatlaubong`
  ADD PRIMARY KEY (`baocaogiamsatlaubong_id`),
  ADD KEY `masolo_id` (`masolo_id`);

--
-- Indexes for table `baocaogiamsatnhaplo`
--
ALTER TABLE `baocaogiamsatnhaplo`
  ADD PRIMARY KEY (`baocaogiamsatnhaplo_id`),
  ADD KEY `masolo_id` (`masolo_id`);

--
-- Indexes for table `baocaogiamsatsaylua`
--
ALTER TABLE `baocaogiamsatsaylua`
  ADD PRIMARY KEY (`baocaogiamsatsaylua_id`),
  ADD KEY `masolo_id` (`masolo_id`);

--
-- Indexes for table `baocaogiamsattachda`
--
ALTER TABLE `baocaogiamsattachda`
  ADD PRIMARY KEY (`baocaogiamsattachda_id`),
  ADD KEY `chitietgiamsatlaubongtachda_id` (`chitietgiamsatlaubongtachda_id`),
  ADD KEY `masolo_id` (`masolo_id`);

--
-- Indexes for table `bcgiamsattiepnhannguyenlieu`
--
ALTER TABLE `bcgiamsattiepnhannguyenlieu`
  ADD PRIMARY KEY (`bcgiamsattiepnhannguyenlieu_id`),
  ADD KEY `customer_id` (`khachhang_id`),
  ADD KEY `loaisanpham_id` (`loaisanpham_id`),
  ADD KEY `masolo_id` (`masolo_id`);

--
-- Indexes for table `chitietgiamsatbocvotachhat`
--
ALTER TABLE `chitietgiamsatbocvotachhat`
  ADD PRIMARY KEY (`chitietgiamsatbocvotachhat_id`),
  ADD KEY `masolo_id` (`masolo_id`);

--
-- Indexes for table `chitietgiamsatlaubongtachda`
--
ALTER TABLE `chitietgiamsatlaubongtachda`
  ADD PRIMARY KEY (`chitietgiamsatlaubongtachda_id`),
  ADD KEY `masolo_id` (`masolo_id`);

--
-- Indexes for table `chitietgiamsatsaylua`
--
ALTER TABLE `chitietgiamsatsaylua`
  ADD PRIMARY KEY (`chitietgiamsatsaylua_id`);

--
-- Indexes for table `chitieuchatluong`
--
ALTER TABLE `chitieuchatluong`
  ADD PRIMARY KEY (`chitieuchatluong_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`khachhang_id`);

--
-- Indexes for table `kiemtranguongoclonguyenlieu`
--
ALTER TABLE `kiemtranguongoclonguyenlieu`
  ADD PRIMARY KEY (`kiemtranguongoclonguyenlieu_id`),
  ADD KEY `chitieuchatluong_id` (`chitieuchatluong_id`),
  ADD KEY `masolo_id` (`masolo_id`);

--
-- Indexes for table `kiemtraphuongtien`
--
ALTER TABLE `kiemtraphuongtien`
  ADD PRIMARY KEY (`kiemtraphuongtien_id`);

--
-- Indexes for table `kiemtraphuongtienvanchuyen`
--
ALTER TABLE `kiemtraphuongtienvanchuyen`
  ADD PRIMARY KEY (`kiemtraphuongtienvanchuyen_id`),
  ADD KEY `phuongtien_id` (`phuongtien_id`);

--
-- Indexes for table `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`loaisanpham_id`);

--
-- Indexes for table `masolo`
--
ALTER TABLE `masolo`
  ADD PRIMARY KEY (`masolo_id`),
  ADD KEY `loaisanpham_id` (`loaisanpham_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phieudieuphuongtien`
--
ALTER TABLE `phieudieuphuongtien`
  ADD PRIMARY KEY (`phieudieuphuongtien_id`),
  ADD KEY `phuongtien_id` (`phuongtien_id`),
  ADD KEY `sanpham_id` (`sanpham_id`),
  ADD KEY `masolo_id` (`masolo_id`),
  ADD KEY `khachhang_id` (`khachhang_id`);

--
-- Indexes for table `phuongtien`
--
ALTER TABLE `phuongtien`
  ADD PRIMARY KEY (`phuongtien_id`);

--
-- Indexes for table `rakimloai`
--
ALTER TABLE `rakimloai`
  ADD PRIMARY KEY (`rakimloai_id`),
  ADD KEY `sanpham_id` (`sanpham_id`),
  ADD KEY `masolo_id` (`masolo_id`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`sanpham_id`),
  ADD KEY `loaisanpham_id` (`loaisanpham_id`);

--
-- Indexes for table `testapi`
--
ALTER TABLE `testapi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokhaixuatxu_camket`
--
ALTER TABLE `tokhaixuatxu_camket`
  ADD PRIMARY KEY (`tokhaixuatxucamket_id`),
  ADD KEY `phuongtien_id` (`phuongtien_id`),
  ADD KEY `sanpham_id` (`loaisanpham_id`),
  ADD KEY `customer_id` (`khachhang_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vungsanpham`
--
ALTER TABLE `vungsanpham`
  ADD PRIMARY KEY (`vungsanpham_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `baocaogiamsatlaubong`
--
ALTER TABLE `baocaogiamsatlaubong`
  MODIFY `baocaogiamsatlaubong_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `baocaogiamsatnhaplo`
--
ALTER TABLE `baocaogiamsatnhaplo`
  MODIFY `baocaogiamsatnhaplo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `baocaogiamsatsaylua`
--
ALTER TABLE `baocaogiamsatsaylua`
  MODIFY `baocaogiamsatsaylua_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `baocaogiamsattachda`
--
ALTER TABLE `baocaogiamsattachda`
  MODIFY `baocaogiamsattachda_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bcgiamsattiepnhannguyenlieu`
--
ALTER TABLE `bcgiamsattiepnhannguyenlieu`
  MODIFY `bcgiamsattiepnhannguyenlieu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `chitietgiamsatbocvotachhat`
--
ALTER TABLE `chitietgiamsatbocvotachhat`
  MODIFY `chitietgiamsatbocvotachhat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chitietgiamsatlaubongtachda`
--
ALTER TABLE `chitietgiamsatlaubongtachda`
  MODIFY `chitietgiamsatlaubongtachda_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `chitietgiamsatsaylua`
--
ALTER TABLE `chitietgiamsatsaylua`
  MODIFY `chitietgiamsatsaylua_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `chitieuchatluong`
--
ALTER TABLE `chitieuchatluong`
  MODIFY `chitieuchatluong_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `khachhang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `kiemtranguongoclonguyenlieu`
--
ALTER TABLE `kiemtranguongoclonguyenlieu`
  MODIFY `kiemtranguongoclonguyenlieu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kiemtraphuongtien`
--
ALTER TABLE `kiemtraphuongtien`
  MODIFY `kiemtraphuongtien_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kiemtraphuongtienvanchuyen`
--
ALTER TABLE `kiemtraphuongtienvanchuyen`
  MODIFY `kiemtraphuongtienvanchuyen_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `loaisanpham_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=566;

--
-- AUTO_INCREMENT for table `masolo`
--
ALTER TABLE `masolo`
  MODIFY `masolo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `phieudieuphuongtien`
--
ALTER TABLE `phieudieuphuongtien`
  MODIFY `phieudieuphuongtien_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `phuongtien`
--
ALTER TABLE `phuongtien`
  MODIFY `phuongtien_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `sanpham_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `testapi`
--
ALTER TABLE `testapi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tokhaixuatxu_camket`
--
ALTER TABLE `tokhaixuatxu_camket`
  MODIFY `tokhaixuatxucamket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1019;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `vungsanpham`
--
ALTER TABLE `vungsanpham`
  MODIFY `vungsanpham_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `baocaogiamsatlaubong`
--
ALTER TABLE `baocaogiamsatlaubong`
  ADD CONSTRAINT `baocaogiamsatlaubong_ibfk_1` FOREIGN KEY (`masolo_id`) REFERENCES `masolo` (`masolo_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `baocaogiamsatnhaplo`
--
ALTER TABLE `baocaogiamsatnhaplo`
  ADD CONSTRAINT `baocaogiamsatnhaplo_ibfk_1` FOREIGN KEY (`masolo_id`) REFERENCES `masolo` (`masolo_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `baocaogiamsatsaylua`
--
ALTER TABLE `baocaogiamsatsaylua`
  ADD CONSTRAINT `baocaogiamsatsaylua_ibfk_1` FOREIGN KEY (`masolo_id`) REFERENCES `masolo` (`masolo_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bcgiamsattiepnhannguyenlieu`
--
ALTER TABLE `bcgiamsattiepnhannguyenlieu`
  ADD CONSTRAINT `bcgiamsattiepnhannguyenlieu_ibfk_2` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhang` (`khachhang_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bcgiamsattiepnhannguyenlieu_ibfk_3` FOREIGN KEY (`loaisanpham_id`) REFERENCES `loaisanpham` (`loaisanpham_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bcgiamsattiepnhannguyenlieu_ibfk_4` FOREIGN KEY (`masolo_id`) REFERENCES `masolo` (`masolo_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chitietgiamsatbocvotachhat`
--
ALTER TABLE `chitietgiamsatbocvotachhat`
  ADD CONSTRAINT `chitietgiamsatbocvotachhat_ibfk_1` FOREIGN KEY (`masolo_id`) REFERENCES `masolo` (`masolo_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chitietgiamsatlaubongtachda`
--
ALTER TABLE `chitietgiamsatlaubongtachda`
  ADD CONSTRAINT `chitietgiamsatlaubongtachda_ibfk_1` FOREIGN KEY (`masolo_id`) REFERENCES `masolo` (`masolo_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kiemtranguongoclonguyenlieu`
--
ALTER TABLE `kiemtranguongoclonguyenlieu`
  ADD CONSTRAINT `kiemtranguongoclonguyenlieu_ibfk_1` FOREIGN KEY (`chitieuchatluong_id`) REFERENCES `chitieuchatluong` (`chitieuchatluong_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kiemtraphuongtienvanchuyen`
--
ALTER TABLE `kiemtraphuongtienvanchuyen`
  ADD CONSTRAINT `kiemtraphuongtienvanchuyen_ibfk_1` FOREIGN KEY (`phuongtien_id`) REFERENCES `phuongtien` (`phuongtien_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `masolo`
--
ALTER TABLE `masolo`
  ADD CONSTRAINT `masolo_ibfk_1` FOREIGN KEY (`loaisanpham_id`) REFERENCES `loaisanpham` (`loaisanpham_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `phieudieuphuongtien`
--
ALTER TABLE `phieudieuphuongtien`
  ADD CONSTRAINT `phieudieuphuongtien_ibfk_2` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`sanpham_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phieudieuphuongtien_ibfk_3` FOREIGN KEY (`masolo_id`) REFERENCES `masolo` (`masolo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phieudieuphuongtien_ibfk_4` FOREIGN KEY (`phuongtien_id`) REFERENCES `phuongtien` (`phuongtien_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phieudieuphuongtien_ibfk_5` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhang` (`khachhang_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rakimloai`
--
ALTER TABLE `rakimloai`
  ADD CONSTRAINT `rakimloai_ibfk_1` FOREIGN KEY (`masolo_id`) REFERENCES `masolo` (`masolo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rakimloai_ibfk_2` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`sanpham_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`loaisanpham_id`) REFERENCES `loaisanpham` (`loaisanpham_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tokhaixuatxu_camket`
--
ALTER TABLE `tokhaixuatxu_camket`
  ADD CONSTRAINT `tokhaixuatxu_camket_ibfk_1` FOREIGN KEY (`phuongtien_id`) REFERENCES `phuongtien` (`phuongtien_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tokhaixuatxu_camket_ibfk_4` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhang` (`khachhang_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tokhaixuatxu_camket_ibfk_5` FOREIGN KEY (`loaisanpham_id`) REFERENCES `loaisanpham` (`loaisanpham_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
