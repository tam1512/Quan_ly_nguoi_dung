-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2023 at 07:18 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qlbanhang`
--
CREATE DATABASE IF NOT EXISTS `qlbanhang` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `qlbanhang`;

-- --------------------------------------------------------

--
-- Table structure for table `logintoken`
--

DROP TABLE IF EXISTS `logintoken`;
CREATE TABLE IF NOT EXISTS `logintoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` varchar(50) DEFAULT NULL,
  `ip_user` varchar(20) DEFAULT NULL,
  `createAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `logintoken`
--

INSERT INTO `logintoken` (`id`, `userId`, `token`, `ip_user`, `createAt`) VALUES
(45, 16, '47106a8e112fd4e83dcee27e41fc17aa54df5d2a', '::1', '2023-09-24 00:01:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `forgotToken` varchar(50) DEFAULT NULL,
  `activeToken` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `lastActivity` datetime DEFAULT NULL,
  `createAt` datetime DEFAULT NULL,
  `updateAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `fullname`, `phone`, `password`, `forgotToken`, `activeToken`, `status`, `lastActivity`, `createAt`, `updateAt`) VALUES
(16, 'tamtt1512@gmail.com', 'Tôn Thành Tâm', '0396371031', '$2y$10$VTssUyBAw9vCxv6xqngDt.nK0NeI6a599pTKqcx6D36buQD6pesuu', 'c037c4bd50385ec68b03c21ebeef3c3bb8cf08b7', NULL, 1, '2023-09-24 00:01:47', '2023-09-23 23:12:40', NULL),
(21, 'ett1512@gmail.com', 'Tôn Thành e', '0396371031', '$2y$10$qCtdDvXBk/jAZjARxeZrlOT5C34U6eRW7I05ZyvgCaYBik1fe98P6', NULL, NULL, 1, NULL, '2023-09-22 15:56:02', NULL),
(22, 'ftt1512@gmail.com', 'Tôn Thành f', '0396371032', '$2y$10$qCtdDvXBk/jAZjARxeZrlOT5C34U6eRW7I05ZyvgCaYBik1fe98P6', NULL, NULL, 1, NULL, '2023-09-22 15:56:02', NULL),
(23, 'gtt1512@gmail.com', 'Tôn Thành g', '0396371032', '$2y$10$qCtdDvXBk/jAZjARxeZrlOT5C34U6eRW7I05ZyvgCaYBik1fe98P6', NULL, NULL, 1, NULL, '2023-09-22 15:56:02', NULL),
(24, 'htt1512@gmail.com', 'Tôn Thành h', '0396371031', '$2y$10$qCtdDvXBk/jAZjARxeZrlOT5C34U6eRW7I05ZyvgCaYBik1fe98P6', NULL, NULL, 1, NULL, '2023-09-22 15:56:02', NULL),
(25, 'jtt1512@gmail.com', 'Tôn Thành j', '0396371032', '$2y$10$qCtdDvXBk/jAZjARxeZrlOT5C34U6eRW7I05ZyvgCaYBik1fe98P6', NULL, NULL, 1, NULL, '2023-09-22 15:56:02', NULL),
(26, 'itt1512@gmail.com', 'Tôn Thành i', '0396371032', '$2y$10$qCtdDvXBk/jAZjARxeZrlOT5C34U6eRW7I05ZyvgCaYBik1fe98P6', NULL, NULL, 1, NULL, '2023-09-22 15:56:02', NULL),
(27, 'ktt1512@gmail.com', 'Tôn Thành k', '0396371031', '$2y$10$qCtdDvXBk/jAZjARxeZrlOT5C34U6eRW7I05ZyvgCaYBik1fe98P6', NULL, NULL, 1, NULL, '2023-09-22 15:56:02', NULL),
(28, 'ltt1512@gmail.com', 'Tôn Thành l', '0396371032', '$2y$10$qCtdDvXBk/jAZjARxeZrlOT5C34U6eRW7I05ZyvgCaYBik1fe98P6', NULL, NULL, 0, NULL, '2023-09-22 15:56:02', NULL),
(29, 'qtt1512@gmail.com', 'Tôn Thành q', '0396371032', '$2y$10$qCtdDvXBk/jAZjARxeZrlOT5C34U6eRW7I05ZyvgCaYBik1fe98P6', NULL, NULL, 1, NULL, '2023-09-22 15:56:02', NULL),
(30, 'wtt1512@gmail.com', 'Tôn Thành w', '0396371031', '$2y$10$qCtdDvXBk/jAZjARxeZrlOT5C34U6eRW7I05ZyvgCaYBik1fe98P6', NULL, NULL, 1, NULL, '2023-09-22 15:56:02', NULL),
(31, 'rtt1512@gmail.com', 'Tôn Thành r', '0396371032', '$2y$10$qCtdDvXBk/jAZjARxeZrlOT5C34U6eRW7I05ZyvgCaYBik1fe98P6', NULL, NULL, 1, NULL, '2023-09-22 15:56:02', NULL),
(32, 'ttt1512@gmail.com', 'Tôn Thành t', '0396371032', '$2y$10$qCtdDvXBk/jAZjARxeZrlOT5C34U6eRW7I05ZyvgCaYBik1fe98P6', NULL, NULL, 1, NULL, '2023-09-22 15:56:02', NULL),
(33, 'ytt1512@gmail.com', 'Tôn Thành y', '0396371031', '$2y$10$qCtdDvXBk/jAZjARxeZrlOT5C34U6eRW7I05ZyvgCaYBik1fe98P6', NULL, NULL, 1, NULL, '2023-09-22 15:56:02', NULL),
(34, 'utt1512@gmail.com', 'Tôn Thành u', '0396371032', '$2y$10$qCtdDvXBk/jAZjARxeZrlOT5C34U6eRW7I05ZyvgCaYBik1fe98P6', NULL, NULL, 1, NULL, '2023-09-22 15:56:02', NULL),
(35, 'itt1512@gmail.com', 'Tôn Thành i', '0396371032', '$2y$10$qCtdDvXBk/jAZjARxeZrlOT5C34U6eRW7I05ZyvgCaYBik1fe98P6', NULL, NULL, 1, NULL, '2023-09-22 15:56:02', NULL),
(36, 'ott1512@gmail.com', 'Tôn Thành o', '0396371031', '$2y$10$qCtdDvXBk/jAZjARxeZrlOT5C34U6eRW7I05ZyvgCaYBik1fe98P6', NULL, NULL, 1, NULL, '2023-09-22 15:56:02', NULL),
(37, 'ptt1512@gmail.com', 'Tôn Thành p', '0396371032', '$2y$10$qCtdDvXBk/jAZjARxeZrlOT5C34U6eRW7I05ZyvgCaYBik1fe98P6', NULL, NULL, 1, NULL, '2023-09-22 15:56:02', NULL),
(38, 'stt1512@gmail.com', 'Tôn Thành s', '0396371032', '$2y$10$qCtdDvXBk/jAZjARxeZrlOT5C34U6eRW7I05ZyvgCaYBik1fe98P6', NULL, NULL, 1, NULL, '2023-09-22 15:56:02', NULL),
(39, 'ftt1512@gmail.com', 'Tôn Thành f', '0396371031', '$2y$10$qCtdDvXBk/jAZjARxeZrlOT5C34U6eRW7I05ZyvgCaYBik1fe98P6', NULL, NULL, 1, NULL, '2023-09-22 15:56:02', NULL),
(40, 'ztt1512@gmail.com', 'Tôn Thành z', '0396371032', '$2y$10$qCtdDvXBk/jAZjARxeZrlOT5C34U6eRW7I05ZyvgCaYBik1fe98P6', NULL, NULL, 1, NULL, '2023-09-22 15:56:02', NULL),
(41, 'tamtt15121@gmail.com', 'Tôn Thành Tâm', '0396371031', '$2y$10$GAgVSniYCrApzvcF7Szxw.jxgHuaHXWWWoj6pbhNfte4YSnXJV6/q', NULL, NULL, 1, NULL, '2023-09-23 01:06:40', NULL),
(42, 'tamtt15s12@gmail.com', 'Tôn Thành Tâm', '0396371031', '$2y$10$sUviH8tCs1/cc.dl/L0kgevTx4zO7BzNHXv271JY.QQ9aUZLv.s8O', NULL, NULL, 1, NULL, '2023-09-23 01:08:17', NULL),
(43, 'tamtt15s1s2@gmail.com', 'Tôn Thành Tâm', '0396371031', '$2y$10$wKVsIzVpbh3SuoNpbzPlZ.DuC8Ji34No5hb3JZb8wz9Ik9UNk2fYG', NULL, NULL, 0, NULL, '2023-09-23 01:11:15', NULL),
(44, 'tamtt15s1ss2@gmail.com', 'Tôn Thành Tâm', '0396371031', '$2y$10$MOEuSAix98TIjdS8Ioqx2uusr17U0ZnCW.0UbkJAaah9jYQ35tO7u', NULL, NULL, 0, NULL, '2023-09-23 01:12:40', NULL),
(45, 'tamtt15s1sss2@gmail.com', 'Tôn Thành Tâm', '0396371031', '$2y$10$Su3qo6Ug2Uj4nlu8DCw9OugoEYMZbf5lLbmH5AldsY6.p8SSoK1H2', NULL, NULL, 0, NULL, '2023-09-23 01:13:23', NULL),
(46, 'tamtt1s2@gmail.com', 'Tôn Thành Tâm', '0396371031', '$2y$10$SR439mu8VXyMoldoGBM1lOoCHtmARgZD2pVNdHSh/kJOggv.x5Lb6', NULL, NULL, 0, NULL, '2023-09-23 01:14:28', NULL),
(47, 'tamtt1ss2@gmail.com', 'Tôn Thành Tâm', '0396371031', '$2y$10$zzL.o.i0JR8N.1mLuG.76.hJG2JzkV.MQqjB0s8A13XdAuRyDRNJy', NULL, NULL, 0, NULL, '2023-09-23 01:15:21', NULL),
(48, 'tamtt1512s@gmail.com', 'Tôn Thành Tâm', '0396371031', '$2y$10$0xNwMudti9NIosKYsoYNeuyThpGKBrrh041YCPWAhk4ihyctI2ZuK', NULL, NULL, 0, NULL, '2023-09-23 01:16:55', NULL),
(49, 'tamtt1512ss@gmail.com', 'Tôn Thành Tâm', '0396371031', '$2y$10$KlJFcnZomWKznwML2huAtOgszwMOyltEp8qtDkcI5FxF1xJlTX6Ey', NULL, NULL, 0, NULL, '2023-09-23 01:19:10', NULL),
(50, 'tamtt1512sss@gmail.com', 'Tôn Thành Tâm', '0396371031', '$2y$10$Cw.c/vjv0tBetmFfoKq9jeJYcq2fjLW/MyPryWZvySPMcDKUl1G5O', NULL, NULL, 0, NULL, '2023-09-23 01:19:14', NULL),
(51, 'tamtt151112@gmail.com', 'Tôn Thành Tâm', '0396371031', '$2y$10$1E9blFCc8GiXErwCZ71SaecScGdIeDdcTQVaV7wwBVpqBpjzFrRaq', NULL, NULL, 0, NULL, '2023-09-23 01:20:12', NULL),
(52, 'tamtt15212@gmail.com', 'Tôn Thành Tâm', '0396371031', '$2y$10$InhmhVsOLh63QNvBCcZOmuWQ9dtLrFcpNfGzaWFMcPbeus.dro.92', NULL, NULL, 0, NULL, '2023-09-23 01:23:12', NULL),
(53, 'tamtt152d12@gmail.com', 'Tôn Thành Tâm', '0396371031', '$2y$10$k7r/af5WiLzjib2syTvsbeg4TG9qfr6xjpW0RIhZOhD4g0pudzW9.', NULL, NULL, 0, NULL, '2023-09-23 01:24:04', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `logintoken`
--
ALTER TABLE `logintoken`
  ADD CONSTRAINT `logintoken_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
