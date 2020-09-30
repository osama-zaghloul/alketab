-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2020 at 12:07 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `starsupp_hscdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `image`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$aaocWNIEp6wHA5tsQbsZ9O7pF4P5jtNJTx0g0ImJyDT80b9MWWMp.', '625.jpg', '2019-12-25 18:32:13', '2019-12-25 09:23:07');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `arcategory` varchar(200) NOT NULL,
  `encategory` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `parent` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `arcategory`, `encategory`, `image`, `parent`) VALUES
(1, 'سرر ومراتب', 'Beds and mattresses', '8615.jpeg', 0),
(2, 'بياضات', 'Linens', '9113.jpeg', 0),
(3, 'مستلزمات غرف وحمام', 'Rooms accessories', '8625.jpeg', 0),
(4, 'مستلزمات ضيافه', 'Hospitality accessories', '23.jpg', 0),
(5, 'اوراق', 'papers', '1082.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `phone`, `email`, `message`, `created_at`) VALUES
(1, 'محمد أحمد', '01098877452', 'mohamedahmed@gmail.com', 'hello ...', '2019-12-23 14:40:46'),
(5, 'mohamed25', '021548758', 'mohamed125@gmail.com', 'hello guys.', '2019-12-23 23:48:05'),
(6, 'mohamed25', '021548758', 'mohamed125@gmail.com', 'hello guys.', '2019-12-23 23:48:35');

-- --------------------------------------------------------

--
-- Table structure for table `favorite_items`
--

CREATE TABLE `favorite_items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `favorite_items`
--

INSERT INTO `favorite_items` (`id`, `user_id`, `item_id`) VALUES
(1, 19, 31),
(3, 19, 17),
(6, 19, 29);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `code` varchar(200) DEFAULT NULL,
  `artitle` varchar(200) NOT NULL,
  `entitle` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `discountprice` float DEFAULT NULL,
  `offer` tinyint(4) NOT NULL DEFAULT 0,
  `ardesc` longtext NOT NULL,
  `endesc` longtext NOT NULL,
  `whatsapp` varchar(200) NOT NULL,
  `suspensed` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `category_id`, `code`, `artitle`, `entitle`, `price`, `discountprice`, `offer`, `ardesc`, `endesc`, `whatsapp`, `suspensed`, `created_at`) VALUES
(7, 1, '457289', 'مراتب فاخرة مقاس مفرد 120*200', 'Luxury mattresses,  Single size 120 * 200', 2048, NULL, 0, '<p dir=\"RTL\">مراتب فاخرة ارتفاع 25سم</p>\r\n\r\n<p dir=\"RTL\">مقاس مفرد 120*200</p>\r\n\r\n<p dir=\"RTL\">كود 010100</p>\r\n\r\n<p dir=\"RTL\">السعر 2048 ريال</p>', '<pre>\r\nLuxury mattresses, height 25 cm\r\nSingle size 120 * 200\r\nCode 010100\r\nPrice 2048 SAR\r\n\r\n</pre>', '+966565390244', 0, '2020-01-04 11:20:10'),
(8, 2, NULL, 'كورنيش سريرأبيض مارفيلوس 260 غرزة – مقاس مفرد / 120*200-3سم', 'Cornice bed white Marvelous 260 stitches - Single size / 120 * 200-3 cm', 106, NULL, 0, '<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">كورنيش سريرأبيض مارفيلوس 260 غرزة &ndash; 3سم&nbsp; </span></span></p>\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">50% بوليستر 50% قطن</span></span></p>\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">مقاس مفرد / 120*200-3سم </span></span></p>\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">كود/ 007008</span></span></p>\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">السعر/ 106</span></span></p>', '<pre>\r\nCornice bed white Marvelous 260 stitches - 3 cm\r\n50% polyester, 50% cotton\r\nSingle size / 120 * 200-3 cm\r\nCode / 007008\r\nPrice / 106\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>', '+966565390244', 0, '2020-01-04 11:39:53'),
(9, 1, NULL, 'مراتب فاخرة  مقاس مزوج 200*200', 'Luxury mattresses Married size 200 * 200', 3232, NULL, 0, '<p style=\"text-align:right\">مراتب فاخرة ارتفاع 25سم</p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">مقاس مزوج 200*200</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">كود 010102</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">السعر 3232 ريال</span></span></p>', '<pre>\r\nLuxury mattresses, height 25 cm\r\n\r\nMarried size 200 * 200\r\n\r\nCode 010102\r\n\r\nPrice 3232 SAR</pre>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n		</tr>\r\n	</tbody>\r\n</table>', '+966565390244', 0, '2020-01-04 15:52:26'),
(10, 1, NULL, 'ديفان بوكس مقاس 100*200', 'Divan Box Size 100 * 200', 600, 400, 1, '<p style=\"text-align:right\">ديفان بوكس مقاس 100*200</p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">مقاس 100*200</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">كود 010104</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">السعر 600 ريال</span></span></span></p>', '<p>Divan Box Size 100 * 200</p>\r\n\r\n<pre>\r\nSize 100 * 200\r\nCode 010104\r\nPrice 600 SAR</pre>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n		</tr>\r\n	</tbody>\r\n</table>', '+966565390244', 0, '2020-01-04 16:00:34'),
(11, 1, NULL, 'ديفان بوكس  مقاس 120*200', 'Divan Box 120 * 200', 640, NULL, 0, '<p style=\"text-align:right\">ديفان بوكس &nbsp;مقاس 120*200</p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">كود 010109</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">السعر 640 ريال</span></span></span></p>', '<pre>\r\nDivan Box 120 * 200\r\n\r\nCode 010109\r\n\r\nPrice 640 SAR</pre>', '+966565390244', 0, '2020-01-04 16:08:39'),
(12, 2, NULL, 'كورنيش سريرأبيض مارفيلوس 260 غرزة – مقاس مزوج 200*200 – 3سم', 'White Marvelous Bed Corniche 260 Stitches - Mixed Size 200 * 200 - 3 cm', 133, NULL, 0, '<p style=\"text-align:right\">كورنيش سريرأبيض مارفيلوس 260 غرزة &ndash; مقاس مزوج 200*200 &ndash; 3سم</p>\r\n\r\n<p style=\"text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">50% بوليستر 50% قطن</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">مقاس مزوج</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">200*200 &ndash; 3سم</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">كود/ 007010</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">السعر/ 133 ريال</span></span></p>', '<pre>\r\nWhite Marvelous Bed Corniche 260 Stitches  Mixed Size 200 * 200  3 cm\r\n\r\n50% polyester, 50% cotton\r\n\r\nMarried size\r\n\r\n200 * 200 - 3 cm\r\n\r\nCode / 007010\r\n\r\nPrice / 133 SAR</pre>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n		</tr>\r\n	</tbody>\r\n</table>', '+966565390244', 0, '2020-01-04 16:28:47'),
(13, 2, NULL, 'كورنيش سرير ذهبي مفرد', 'Cornice golden single bed', 106, NULL, 0, '<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">كورنيش سرير ذهبي </span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">100% بوليستر </span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">مقاس مفرد</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">200*120</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">كود/ 007107</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">السعر 106 ريال</span></span></p>', '<pre>\r\nCornish golden bed\r\n100% polyester\r\nSingle size\r\n200 * 120\r\nCode / 007107\r\nPrice 106 SAR</pre>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n		</tr>\r\n	</tbody>\r\n</table>', '966565390244', 0, '2020-01-04 17:34:26'),
(14, 2, NULL, 'كورنيش سرير ذهبي مزوج', 'Cornish golden married bed', 126, NULL, 0, '<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">كورنيش سرير ذهبي </span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">100% بوليستر </span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">مقاس مزوج</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">200*200</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">كود 007109</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-size:11.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">السعر / 126 ريال</span></span></p>', '<pre>\r\nCornish golden bed\r\n\r\n100% polyester\r\nMarried size\r\n\r\n200 * 200\r\n\r\nCode 007109\r\n\r\nPrice / 126 SAR</pre>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n		</tr>\r\n	</tbody>\r\n</table>', '966565390244', 0, '2020-01-04 17:41:19'),
(15, 2, NULL, 'حلية سرير مزوج', 'Married Bed Sheet', 160, NULL, 0, '<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">حلية سرير مزوج ماجيك ذهبي</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">2 كيس ركانه </span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">مقاس 250*50</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">كود 008048</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">السعر 160 ريال</span></span></p>', '<pre>\r\nMarried Bed Charm - Gold Magic\r\n2 corner bags\r\nSize 250 * 50\r\nCode 008048\r\nPrice 160 SAR</pre>', '+966565390244', 0, '2020-01-04 17:47:21'),
(16, 2, NULL, 'حلية سرير مفرد', 'Single bed charm', 99, NULL, 0, '<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">حلية سرير مفرد ماجيك ذهبي</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">2 كيس ركانه </span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">مقاس مفرد</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">180*50 +1 كيس ركانه</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">كود 008049</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-size:11.0pt\">السعر/ 99 ريال</span></p>', '<pre>\r\nGold Magic Single Bed Charm\r\n\r\n2 corner bags\r\nSingle size\r\n\r\n180 * 50 +1 corner bag\r\n\r\nCode 008049\r\n\r\nPrice / 99 SAR</pre>', '+966565390244', 0, '2020-01-04 17:51:05'),
(17, 2, NULL, 'حلية سرير مزوج مقاس 250*50', 'Married Bed Sheet Size 250 * 50', 160, NULL, 0, '<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">حلية سرير ماجيك ازرق مزوج</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">مقاس 250*50+ 2كيس ركانه</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">كود 008056</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">السعر/ 160 ريال</span></span></p>', '<pre>\r\nMarried Blue Magic Bedlinen\r\n\r\nSize 250 * 50 + 2 corner bags\r\n\r\nCode 008056\r\n\r\nPrice / 160 SAR</pre>', '+966565390244', 0, '2020-01-04 18:03:58'),
(18, 2, NULL, 'حلية سرير مفرد مقاس 180*50', 'Single Bed Sheet 180 * 50', 99, NULL, 0, '<p dir=\"RTL\">حلية سرير ماجيك ازرق مفرد</p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">180*50+1 كيس ركانه</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">كود 008057</span></span></span></p>\r\n\r\n<p dir=\"RTL\"><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-size:11.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">السعر 99 ريال</span></span></p>', '<pre>\r\nBlue Magic Single Bed Charm\r\n\r\n180 * 50 + 1 corner bag\r\n\r\nCode 008057\r\n\r\nPrice 99 SAR</pre>', '966565390244', 0, '2020-01-04 18:11:50'),
(19, 2, NULL, 'حلية سرير لوفر مفرد رصاصي', 'Gray Single Louvre Bedspread', 99, NULL, 0, '<p style=\"text-align:right\">حلية سرير لوفر مفرد رصاصي</p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">مقاس 180*50 +كيس ركانه</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">كود 008055</span></span></span></p>\r\n\r\n<p style=\"text-align:right\"><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-size:11.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">السعر 99 ريال</span></span></p>', '<pre>\r\nGray Single Louvre Bedspread\r\n\r\nSize 180 * 50 + corner bag\r\n\r\nCode 008055\r\n\r\nPrice 99 SAR</pre>', '966565390244', 0, '2020-01-04 18:28:33'),
(20, 2, NULL, 'حلية سرير لوفر مزوج رصاصي', 'Gray Maroon Louvre Bed Sheet', 160, NULL, 0, '<p style=\"text-align:right\">حلية سرير لوفر مزوج رصاصي</p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">مقاس مزوج</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">250*50+ 2 كيس ركانه</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">كود 008054</span></span></span></p>\r\n\r\n<p style=\"text-align:right\"><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-size:11.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">السعر / 160 ريال</span></span></p>', '<pre>\r\nGray Maroon Louvre Bed Sheet\r\n\r\nMarried size\r\n\r\n250 * 50 + 2 corner bags\r\n\r\nCode 008054\r\n\r\nPrice / 160 SAR</pre>', '966565390244', 0, '2020-01-04 18:30:56'),
(21, 2, NULL, 'توبر لباد مقاس مفرد', 'Felt Topper, Single Size', 272, NULL, 0, '<p style=\"text-align:right\">توبر لباد مقاس مفرد</p>\r\n\r\n<p style=\"text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">200*120</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">كود 011003</span></span></p>\r\n\r\n<p style=\"text-align:right\"><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-size:11.0pt\">السعر/ 272 ريال</span></p>', '<pre>\r\nFelt Topper, Single Size\r\n\r\n200 * 120\r\n\r\nCode 011003\r\n\r\nPrice / 272 SAR</pre>', '966565390244', 0, '2020-01-04 18:35:47'),
(22, 2, '0000', 'توبر لباد مقاس مزوج', 'Topper Felt Size', 426, NULL, 0, '<p style=\"text-align:right\">توبر لباد مقاس مزوج</p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">200*200</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">كود 011005</span></span></p>\r\n\r\n<p style=\"text-align:right\"><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-size:11.0pt\">السعر 426 ريال</span></p>', '<pre>\r\nTopper Felt Size\r\n\r\n200 * 200\r\n\r\nCode 011005\r\n\r\nPrice 426 SAR</pre>', '+966565390244', 0, '2020-01-04 18:39:06'),
(23, 2, NULL, 'حشوة لحااف مزوج مقلم مارفيلوس', 'Marvelous striped duvet filling', 194, NULL, 0, '<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">حشوة لحااف مزوج مقلم مارفيلوس</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">مقاس </span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">250*235</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">كود / 006005</span></span></span></p>\r\n\r\n<p style=\"text-align:right\"><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-size:11.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">السعر / 194 ريال</span></span></p>', '<pre>\r\nMarvelous striped duvet filling\r\nsize\r\n250 * 235\r\nCode / 006005\r\nPrice / 194 SAR</pre>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n		</tr>\r\n	</tbody>\r\n</table>', '966565390244', 0, '2020-01-04 18:42:51'),
(24, 2, NULL, 'حشوة لحاف مفرد مقلم مارفيلوس', 'Marvelous striped single duvet filling', 158, NULL, 0, '<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">حشوة لحاف مفرد مقلم مارفيلوس</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">مقاس 160*235</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">كود/ 006004</span></span></span></p>\r\n\r\n<p style=\"text-align:right\"><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-size:11.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">السعر/ 158 ريال</span></span></p>', '<pre>\r\nMarvelous striped single duvet filling\r\nSize 160 * 235\r\nCode / 006004\r\nPrice / 158 SAR</pre>', '966565390244', 0, '2020-01-04 18:45:42'),
(25, 2, NULL, 'منشفة حمام مارفيلوس', 'Marvelous bath towel', 111, NULL, 0, '<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">منشفة حمام مارفيلوس</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">الوزن/ 620 جرام</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">القياس/ 140*70</span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">السعر/ 111</span></span></p>\r\n\r\n<p style=\"text-align:right\"><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-size:11.0pt\">كود 013012</span></p>', '<pre>\r\nMarvelous bath towel\r\n\r\nWeight / 620 g\r\n\r\nSize / 140 * 70\r\n\r\nPrice / 111\r\n\r\nCode 013012</pre>', '966565390244', 0, '2020-01-04 18:51:03'),
(26, 2, NULL, 'منشفة مسبح مارفيلوس', 'Marvelous pool towel', 111, NULL, 0, '<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">منشفة مسبح مارفيلوس</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">الوزن / 220 جرام</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">القياس / 170*90</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">كود 013008</span></span></span></p>\r\n\r\n<p style=\"text-align:right\"><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-size:11.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">السعر</span></span></p>', '<pre>\r\nMarvelous pool towel\r\nWeight / 220 g\r\nSize / 170 * 90\r\nCode 013008\r\nprice</pre>', '+966565390244', 0, '2020-01-04 18:57:59'),
(27, 2, NULL, 'منشفة وجه فاخره كلفر قطن عالي الجودة', 'A luxurious face towel of high-quality cotton culver', 7, NULL, 0, '<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">منشفة وجه فاخره كلفر قطن عالي الجودة</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">مقاس 33*33</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">الوزن 70 جرام</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">كود / 013064</span></span></span></p>\r\n\r\n<p style=\"text-align:right\"><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-size:11.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">السعر/ 7 ريال</span></span></p>', '<pre>\r\nA luxurious face towel of high-quality cotton culver\r\nSize 33 * 33\r\nWeight 70 g\r\nCode / 013064\r\nPrice / 7 SAR</pre>', '+966565390244', 0, '2020-01-04 19:04:19'),
(28, 2, NULL, 'واقي مرتبة مزوج ولباد ضد الماء 100%', '100% waterproof mattress and felt pad protector', 144, NULL, 0, '<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">واقي مرتبة ولباد ضد الماء 100%</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">مقاس مزوج 200*200</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">كود 009001</span></span></span></p>\r\n\r\n<p style=\"text-align:right\"><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-size:11.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">السعر 144 ريال</span></span></p>', '<pre>\r\n100% waterproof mattress and felt pad\r\nMarried size 200 * 200\r\nCode 009001\r\nPrice 144 SAR</pre>', '+966565390244', 1, '2020-01-04 19:08:26'),
(29, 2, NULL, 'واقي مرتبة مفرد ولباد ضد الماء 100%', '100% waterproof mattress and felt pad', 86, NULL, 0, '<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">واقي مرتبة ولباد ضد الماء 100%</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">مقاس مفرد</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">مقاس 200*120</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\">كود 009003</p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\">السعر 86 ريال</p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\">&nbsp;</p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\">&nbsp;</p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\">&nbsp;</p>\r\n\r\n<div style=\"border-bottom:solid windowtext 1.0pt; padding:0in 0in 1.0pt 0in\">\r\n<p dir=\"RTL\" style=\"margin-left:0in; margin-right:0in; text-align:right\">&nbsp;</p>\r\n</div>', '<pre>\r\n100% waterproof mattress and felt pad\r\n\r\nSingle size\r\n\r\nSize 200 * 120\r\n\r\nCode 009003\r\n\r\nPrice 86 SAR</pre>', '+966565390244', 0, '2020-01-04 19:13:30'),
(30, 2, NULL, 'مكونات العرض (مزوج)', 'Display components (mixed)', 1320, 4, 1, '<ol>\r\n	<li dir=\"RTL\" style=\"text-align:right\"><span style=\"font-size:22px\"><span style=\"font-family:Calibri,sans-serif\">كورنيش </span></span></li>\r\n	<li dir=\"RTL\" style=\"text-align:right\"><span style=\"font-size:22px\"><span style=\"font-family:Calibri,sans-serif\">شرشف مطاط </span></span></li>\r\n	<li dir=\"RTL\" style=\"text-align:right\"><span style=\"font-size:22px\"><span style=\"font-family:Calibri,sans-serif\">حشوة لحاف </span></span></li>\r\n	<li dir=\"RTL\" style=\"text-align:right\"><span style=\"font-size:22px\"><span style=\"font-family:Calibri,sans-serif\">كيس لحاف مارفيلوس</span></span></li>\r\n	<li dir=\"RTL\" style=\"text-align:right\"><span style=\"font-size:22px\"><span style=\"font-family:Calibri,sans-serif\">4 مخده ميكرو فيبر</span></span></li>\r\n	<li dir=\"RTL\" style=\"text-align:right\"><span style=\"font-size:22px\"><span style=\"font-family:Calibri,sans-serif\">4 كيس مخده</span></span></li>\r\n	<li dir=\"RTL\" style=\"text-align:right\"><span style=\"font-size:22px\"><span style=\"font-family:Calibri,sans-serif\">شرشف سادة</span></span></li>\r\n	<li dir=\"RTL\" style=\"text-align:right\"><span style=\"font-size:22px\"><span style=\"font-family:Calibri,sans-serif\">حلية سرير </span></span></li>\r\n</ol>\r\n\r\n<p style=\"text-align:right\"><span style=\"font-size:22px\"><span dir=\"RTL\" lang=\"AR-SA\">السعر 1320 ريال</span></span></p>', '<pre>\r\n<span style=\"font-size:20px\">1- Corniche\r\n2- A fitted sheet\r\n3- Quilt filling\r\n4- Marvelous duvet bag\r\n5- 4 headrest micro fiber\r\n6- 4 pillow cases, his head\r\n7- A fitted sheet\r\n8- Bed Sheet\r\nPrice 1320 riyals</span></pre>', '+966565390244', 0, '2020-01-04 19:54:23'),
(31, 2, NULL, 'مكونات العرض (مفرد)', 'Display components (single)', 910, 0, 1, '<ol>\r\n<li dir=\"RTL\" style=\"text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">كورنيش </span></span></span></li>\r\n	<li dir=\"RTL\" style=\"text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">شرشف مطاط </span></span></span></li>\r\n	<li dir=\"RTL\" style=\"text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">حشوة لحاف </span></span></span></li>\r\n	<li dir=\"RTL\" style=\"text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">كيس لحاف مارفيلوس</span></span></span></li>\r\n	<li dir=\"RTL\" style=\"text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">2 مخده ميكرو فيبر</span></span></span></li>\r\n	<li dir=\"RTL\" style=\"text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">2 كيس مخده</span></span></span></li>\r\n	<li dir=\"RTL\" style=\"text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">شرشف سادة</span></span></span></li>\r\n	<li dir=\"RTL\" style=\"text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">حلية سرير </span></span></span></li>\r\n</ol>\r\n<p style=\"text-align:right\"><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-size:11.0pt\">السعر / 910 ريال</span></p>', '<pre>\r\n1- Corniche\r\n2- A fitted sheet\r\n3- Quilt filling\r\n4- Marvelous duvet bag\r\n5- 2 headrest micro fiber\r\n6- 2 pillow cases of the headrest\r\n7- A fitted sheet\r\n8- Bed Sheet\r\nPrice / 910 SAR</pre>', '+966565390244', 0, '2020-01-04 19:57:45'),
(34, 3, '66666', 'yyyy', 'ggggggg', 222, NULL, 0, '<p>tttttttt</p>', '<p>hhhhhhh</p>', '01098441697', 0, '2020-01-29 21:01:19'),
(35, 3, '66666', 'yyyy', 'ggggggg', 222, NULL, 0, '<p>tttttttt</p>', '<p>hhhhhhh</p>', '01098441697', 0, '2020-01-29 21:01:42');

-- --------------------------------------------------------

--
-- Table structure for table `item_images`
--

CREATE TABLE `item_images` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_images`
--

INSERT INTO `item_images` (`id`, `item_id`, `image`) VALUES
(12, 7, '117.png'),
(13, 8, '441.png'),
(14, 9, '351.png'),
(15, 10, '618.png'),
(16, 11, '208.png'),
(17, 12, '986.png'),
(18, 13, '712.png'),
(19, 14, '664.png'),
(20, 15, '831.png'),
(21, 16, '80.png'),
(22, 17, '519.png'),
(23, 18, '963.png'),
(24, 19, '565.png'),
(25, 20, '299.png'),
(26, 21, '449.png'),
(27, 22, '732.png'),
(28, 23, '130.png'),
(29, 24, '286.png'),
(30, 25, '267.png'),
(31, 26, '280.png'),
(32, 27, '174.png'),
(33, 28, '631.png'),
(34, 29, '334.png'),
(35, 30, '259.jpg'),
(36, 31, '416.jpg'),
(41, 35, '285.png');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `firebase_token` text DEFAULT NULL,
  `forgetcode` varchar(200) DEFAULT NULL,
  `suspensed` tinyint(4) NOT NULL DEFAULT 0,
  `user_hash` text CHARACTER SET utf8 DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `name`, `phone`, `address`, `password`, `firebase_token`, `forgetcode`, `suspensed`, `user_hash`, `remember_token`) VALUES
(1, 'محمد عبد اللطيف احمد', '01090110423', 'السعودية مدينة الرياض حى الريان', '$2y$10$4G3gEiUPQze3eaPj.mP9SOZQfLV2SwB0LYoBLF9TUHn4MJ6s6IJSS', NULL, NULL, 0, NULL, NULL),
(2, 'على محمد', '01198722470', 'السعودية مدينة الرياض حى الريان', '$2y$10$/BjQhEYkZRj9QNVdkh3Nr.R3kunyL40rXegL1jNltPtfaR65e/w9q', NULL, NULL, 0, NULL, NULL),
(5, 'helal.  😂', 'السعودية مدينة الرياض حى الريان', 'السعودية مدينة الرياض حى الريان', '$2y$10$3KC.2MYp54hw8d3vM9W/BO8R6aUUUOJiEU19R5iYtXLNoyXObi/aW', '0', '092467', 0, NULL, NULL),
(6, 'test', '123456789', 'السعودية مدينة الرياض حى الريان', '$2y$10$qG5D1LBK/4aWAQ/7hFAGT.MNRu9uVDpk6i7v0fRtWno8wCJcZjk3G', 'f7W5wZkjE3M:APA91bFzMW9WOD6qeETznAUWAS0q-XyxCxQ1wAPp7yZDj9gMFAdywc_LwpSmq_QrZJ-A-aWT2fKMd-PFh6uS0Dikp1N83-kzz49Xcb8BXtGeQY3hRVydZubh28MV8Gj9n0tq--lICaEq', '761289', 0, NULL, NULL),
(7, 'احمد سمير', '12345678902', 'السعودية مدينة الرياض حى الريان', '$2y$10$uEZOXX8A.oqHaNfURwBkfeahAbdZsr9F5b6z1Odc23bKFVSjD7rTq', '0', '362749', 0, NULL, NULL),
(8, 'Ahmed azggzab', 'ffffffffff', '1234567', '$2y$10$st1p3NfIOTg3IWK6D9VBW.uHm3Oh3kxyPpIvZKKeUwC/0J3wNoIua', '12312', NULL, 0, NULL, NULL),
(9, 'fahd salah', 'cairo', '123456', '$2y$10$e1jYeB3NnNQ7WBnsLav9fed68AIYfrB7eNri8KZLdt9WUiIMwMEnS', '12312', NULL, 0, NULL, NULL),
(10, 'yasser', 'السعودية الرياض', '123456s', '$2y$10$7ztx.oYBqBa3EVg77R8g5uh2bDJ1iIf5xTnktejAthg/v09NjTG2C', 'ejcmEXas8Gg:APA91bFauIUJTSe-_RrKKBVrOrUP-8PTTwZloVMaTHnQ_7h-sQXeDzAjGIGl6OQWTRqlPwTzM7Fb9Bj7wyAIkV0E1pBUfEx4XKvcfr7fcZuhuDj-KopUmrFq-y1-hG_8McI6rYOgB_W3', NULL, 0, NULL, NULL),
(11, 'ttttt', 'fffff', 'tttttt', '$2y$10$/Cl/DeDSFkJFl4u7Y6emnemq0gyC/xIVpRr/6nVFx1efklQr85eH2', NULL, NULL, 0, NULL, NULL),
(12, 'علي', 'جده', '123456789', '$2y$10$GfPdY1vvYgXuTyW.mLflIum7QF1lDFP7E9kOJ9adEDedBYC9/5cwm', 'eFuyO5jYcqE:APA91bHyVjUVyG1DGFMUyd5zMqowRmwbCy3eqzEE-NfCnBD4-hCW_CQB2rLX82emSaWVLlynJcPlOd_aRD42di45PJ2qvbRrzNFuxBLzJVgUEedE75fTNozMjYFgef9ZSK-65QVEa2wH', NULL, 0, NULL, NULL),
(13, 'testf', 'damas', '123456s', '$2y$10$YUdl8JVPHj.jFWqR8w8g4e/U6aNFL8Ka7.G.GngV3vU/oqVsBmjVm', 'cyR7OfdMMhs:APA91bE2eIB-ACs9OO-6EgNcN6GCvBGpQaxasjOE9ZqH5zk6JJWR-csgBmIKazc4poBnsX-Ji1PHdlulCmhzPPTJlUYeFj2wl2ceFLihmGy3ODNRnZCb2f_9HALRMyuYmFXgQjI4ui_c', NULL, 0, NULL, NULL),
(14, 'ttt', '1234567890', '1234567', '$2y$10$kZ9ArC3v0FuzciWYn0fIvesFp64UyNOGNwDvbIszTQFSOmd1G3ymS', NULL, NULL, 0, NULL, NULL),
(15, 'uuu', '123123123', 'fffff', '$2y$10$VX6jOBZIZdofLC66XCpreO40xgpNt1I0AooI3/Hj9ts0/JI7pfjOe', NULL, NULL, 0, NULL, NULL),
(16, 'yaso', '05123456', 'السعودية', '$2y$10$c/zYQH9WwRXRaWee2BiebOleUVcw/T.hWy9/NQaY2dzGr2/nRX13m', 'dl3CiQznKbc:APA91bHVNU0W97v8a333ZISHpTme_fv5Or0AgkJcpKpaYudl7LsdM-2mpxtH_cWpNx2j03eY2Gz-0p93HcqxaC02zAQf5FPycMGiR0xtRYE1GTDi0e29g442udWjg8kxcT4vKqu-ghYt', NULL, 0, NULL, NULL),
(19, 'mahmoud', '0581120564', 'Al hassa', '$2y$10$4ko9X8ve0SpxgrcxFgRRhOsI37zH2PF1bF5ndawTFdeQ8o/TkUlm.', 'cWgib64d3AE:APA91bF3vdmbDACznt4AOwkG0-BiWV1OuNhpIwiNOFXSb6WqiPzvSzHpUGFwBDkpHcRQj-UCD1a_KNlZ-G5Qgn3R0zJncU0ws6PnkipzFf56HdBJiiu-IH8sJFpX6kGHbNDkY-3ZsJFt', NULL, 0, NULL, NULL),
(20, 'johndoe', '60122022594', 'google', '$2y$10$B4ktECSqsdkUMBRS0kRgBexwTKdvMFZiD6OaSFUGYLdvbKbEij3mC', 'dbCxg2P2JpQ:APA91bEXiM1vkb3adLboG8m9dp7iXIQCAEzevh-rVdA5J9xxKtBdqjA_f2IJLR9t2G-yPDCb1LOyY-DQd2roUpky2HGCiupaRi8LYetJRXYPDp0Wj5EKW3GQn2nYsRe2K5FpNzLDVgLl', NULL, 0, NULL, NULL),
(21, 'نىهى', '5699', 'نىهى', '$2y$10$HoZpMIduMYIwGotebfPxROIqLNhS.4urRKxNGmRVxeW6Mz5JZu5o2', 'cJYav_rJRZo:APA91bGL_7_kEbSNfsfKpILAljKFQL1cw54hbDpJ6-L2YouolZtFw1IjTNbVHOjpAHRPa5IUASK8gHFHVfI1nzHJIePpPUp--EsJWZOwGG_peCRxYBH4dTwK4Mlr1NjbHGdgJKEa_qB0', NULL, 0, NULL, NULL),
(22, 'azzabaa', '321321321', 'ttttt', '$2y$10$BOdw16SY3PQ0DtlTSepf8evo5tDpCxIz0qMd4jwkwfLMgsr/FiNNq', 'f-OMDzUD7Gg:APA91bFRfLnLQzbYdi1BGYf0VNu5bjZjkoCCh8cZitl1bgL1EMiWB2TV9e49vsiKhxMoE5iacrcvYN5_D9-w3uvxriVkU9VinDybeNZUuUYef68R6qr8pRCxRXjbMraKqt67xutDcpcW', NULL, 0, NULL, NULL),
(23, 'aser', '4444', 'rrrr-eee-ttt', '$2y$10$/lYBVqmQeclub6XXGN16DuVAz/wZL0NJ/QgT2Y2LIWFwBLG1ZIf5S', 'f-OMDzUD7Gg:APA91bFRfLnLQzbYdi1BGYf0VNu5bjZjkoCCh8cZitl1bgL1EMiWB2TV9e49vsiKhxMoE5iacrcvYN5_D9-w3uvxriVkU9VinDybeNZUuUYef68R6qr8pRCxRXjbMraKqt67xutDcpcW', NULL, 0, NULL, NULL),
(26, 'أحمد مصطفى', '0546941378', 'السعوديه-الرياض-المنفوحه', '$2y$10$dn.HRs2BrDTxjKC1SMRtIu7BtZSgjx1ngjLK4jg3KP9uOY7s1RH3y', 'cTW3xx_glX4:APA91bEQQtRGxigocUjsycHStwNJg6zHzCTTH9ODIYITK0zioqElkJ6NYuUf4xO1wFLebxOMnIG1uRMMzScpNmpEykX06yW7HSWE7d7_u4Bziqz_VwL9wUBLVe3DBpVVxSVIwurZQ7Gu', NULL, 0, NULL, NULL),
(27, 'على عبده عوض', '0553701569', 'السعوديه-الاحساء-المبرز', '$2y$10$6LE7cBwc/AUfqc7nU.5QW.ax5e.9AJdd07JDarzspEAuQWT52LRqe', 'fOfWkg5zvUs:APA91bHAx2cn4V4h3hyAZ_eh0CQ4h2HCJoWLAOJFz7edqGHao9-vxsbmXcDOtFmQb6ozRSFIckqYHC9VzN9VAbrS3Alg8EOxF2CaUFe0NCGROp5bvbKLYbiHigsmlMuvM0_i9p0NBzuv', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `notification` varchar(200) COLLATE utf8_estonian_ci NOT NULL,
  `readed` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `notification`, `readed`, `created_at`) VALUES
(1, 1, 'تم تسجيل حسابك بنجاح', 1, '2019-12-23 21:45:51'),
(2, 2, 'تم تسجيل حسابك بنجاح', 1, '2019-12-23 22:16:40'),
(3, 5, 'تم تسجيل حسابك بنجاح', 1, '2019-12-23 22:17:24'),
(4, 6, 'تم تسجيل حسابك بنجاح', 1, '2019-12-26 19:27:43'),
(5, 7, 'تم تسجيل حسابك بنجاح', 0, '2019-12-26 20:03:13'),
(6, 8, 'تم تسجيل حسابك بنجاح', 0, '2019-12-26 20:36:45'),
(7, 9, 'تم تسجيل حسابك بنجاح', 0, '2019-12-30 02:36:03'),
(8, 10, 'تم تسجيل حسابك بنجاح', 0, '2019-12-30 21:47:43'),
(9, 11, 'تم تسجيل حسابك بنجاح', 0, '2019-12-31 08:11:03'),
(10, 12, 'تم تسجيل حسابك بنجاح', 1, '2019-12-31 08:27:07'),
(11, 13, 'تم تسجيل حسابك بنجاح', 0, '2019-12-31 10:34:29'),
(12, 14, 'تم تسجيل حسابك بنجاح', 0, '2019-12-31 18:32:43'),
(13, 15, 'تم تسجيل حسابك بنجاح', 1, '2019-12-31 18:33:48'),
(14, 16, 'تم تسجيل حسابك بنجاح', 1, '2019-12-31 21:36:54'),
(15, 17, 'تم تسجيل حسابك بنجاح', 1, '2020-01-01 06:38:37'),
(16, 18, 'تم تسجيل حسابك بنجاح', 1, '2020-01-01 10:29:56'),
(17, 19, 'تم تسجيل حسابك بنجاح', 1, '2020-01-01 20:41:34'),
(18, 20, 'تم تسجيل حسابك بنجاح', 0, '2020-01-02 04:32:51'),
(19, 21, 'تم تسجيل حسابك بنجاح', 0, '2020-01-06 19:35:48'),
(20, 22, 'تم تسجيل حسابك بنجاح', 1, '2020-01-06 20:54:09'),
(21, 23, 'تم تسجيل حسابك بنجاح', 0, '2020-01-06 22:10:12'),
(22, 19, 'تم إنشاء طلب جديد', 1, '2020-01-07 22:45:18'),
(23, 19, 'تم إنشاء طلب جديد', 1, '2020-01-07 22:45:24'),
(24, 19, 'تم إنشاء طلب جديد', 1, '2020-01-07 23:11:29'),
(25, 19, 'تم إنشاء طلب جديد', 1, '2020-01-07 23:20:48'),
(26, 19, 'تم إنشاء طلب جديد', 1, '2020-01-07 23:26:08'),
(27, 19, 'تم إنشاء طلب جديد', 1, '2020-01-07 23:33:48'),
(28, 16, 'تم إنشاء طلب جديد', 0, '2020-01-08 02:14:03'),
(29, 24, 'تم تسجيل حسابك بنجاح', 1, '2020-01-08 14:46:49'),
(30, 6, 'تم إنشاء طلب جديد', 1, '2020-01-08 15:02:13'),
(31, 6, 'تم إنشاء طلب جديد', 1, '2020-01-08 15:02:37'),
(32, 19, 'تم إنشاء طلب جديد', 1, '2020-01-08 15:15:10'),
(33, 25, 'تم تسجيل حسابك بنجاح', 1, '2020-01-08 21:29:32'),
(34, 25, 'تم إنشاء طلب جديد', 0, '2020-01-08 21:40:49'),
(35, 25, 'تم إنشاء طلب جديد', 0, '2020-01-08 21:41:03'),
(36, 26, 'تم تسجيل حسابك بنجاح', 0, '2020-01-09 16:17:58'),
(37, 16, 'تم إنشاء طلب جديد', 0, '2020-01-10 00:11:38'),
(38, 27, 'تم تسجيل حسابك بنجاح', 1, '2020-01-10 12:21:10'),
(39, 27, 'تم إنشاء طلب جديد', 0, '2020-01-10 12:24:07'),
(40, 19, 'تم إنشاء طلب جديد', 0, '2020-01-10 13:49:35'),
(41, 27, 'تم تفعيل الفاتورة بنجاح والطلب ف الطريق اليك', 0, '2020-01-29 18:01:47');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_number` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` float NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `paid` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `total`, `status`, `paid`, `created_at`) VALUES
(1, '07012020680', 16, 1299, 0, 0, '2020-01-07 13:35:47'),
(2, '07012020270', 18, 13062, 0, 0, '2020-01-07 21:49:00'),
(3, '07012020419', 19, 12270, 0, 0, '2020-01-07 22:45:18'),
(4, '07012020378', 19, 12270, 0, 0, '2020-01-07 22:45:24'),
(5, '0701202024', 19, 4678, 0, 0, '2020-01-07 23:11:29'),
(6, '07012020248', 19, 5920, 0, 0, '2020-01-07 23:20:48'),
(7, '0701202053', 19, 1320, 0, 0, '2020-01-07 23:26:08'),
(8, '07012020946', 19, 144, 0, 0, '2020-01-07 23:33:48'),
(9, '08012020135', 16, 2048, 0, 0, '2020-01-08 02:14:03'),
(10, '08012020564', 6, 8190, 0, 0, '2020-01-08 15:02:13'),
(11, '08012020820', 6, 4550, 0, 0, '2020-01-08 15:02:37'),
(12, '08012020980', 19, 8143, 0, 0, '2020-01-08 15:15:10'),
(13, '08012020835', 25, 2048, 0, 0, '2020-01-08 21:40:49'),
(14, '08012020228', 25, 2048, 0, 0, '2020-01-08 21:41:03'),
(15, '10012020588', 16, 1320, 0, 0, '2020-01-10 00:11:38'),
(16, '10012020676', 27, 160, 0, 1, '2020-01-10 12:24:07'),
(17, '1001202031', 19, 910, 0, 0, '2020-01-10 13:49:35');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `item_id`, `qty`, `price`) VALUES
(1, 1, 10, 2, 600),
(2, 1, 18, 1, 99),
(3, 2, 7, 4, 2048),
(4, 2, 30, 3, 1320),
(5, 2, 31, 1, 910),
(6, 3, 9, 3, 3232),
(7, 3, 13, 2, 106),
(8, 3, 15, 2, 160),
(9, 3, 25, 2, 111),
(10, 3, 31, 2, 910),
(11, 4, 9, 3, 3232),
(12, 4, 13, 2, 106),
(13, 4, 15, 2, 160),
(14, 4, 25, 2, 111),
(15, 4, 31, 2, 910),
(16, 5, 9, 1, 3232),
(17, 5, 13, 1, 106),
(18, 5, 21, 1, 272),
(19, 5, 24, 1, 158),
(20, 5, 31, 1, 910),
(21, 6, 7, 1, 2048),
(22, 6, 9, 1, 3232),
(23, 6, 11, 1, 640),
(24, 7, 30, 1, 1320),
(25, 8, 28, 1, 144),
(26, 9, 7, 1, 2048),
(27, 10, 31, 9, 910),
(28, 11, 31, 5, 910),
(29, 12, 7, 2, 2048),
(30, 12, 18, 3, 99),
(31, 12, 21, 3, 272),
(32, 12, 23, 3, 194),
(33, 12, 24, 1, 158),
(34, 12, 28, 2, 144),
(35, 12, 29, 1, 86),
(36, 12, 31, 2, 910),
(37, 13, 7, 1, 2048),
(38, 14, 7, 1, 2048),
(39, 15, 30, 1, 1320),
(40, 16, 20, 1, 160),
(41, 17, 31, 1, 910);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`id`, `user_id`, `item_id`, `rate`, `created_date`, `created_time`) VALUES
(1, 6, 11, 4, '2020-01-08', '15:03:58'),
(2, 6, 10, 5, '2020-01-08', '15:05:17');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `arprivacy` longtext NOT NULL,
  `enprivacy` longtext DEFAULT NULL,
  `arabout` longtext NOT NULL,
  `enabout` longtext DEFAULT NULL,
  `arconditions` longtext DEFAULT NULL,
  `enconditions` longtext DEFAULT NULL,
  `logo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `arprivacy`, `enprivacy`, `arabout`, `enabout`, `arconditions`, `enconditions`, `logo`) VALUES
(1, '<p dir=\"RTL\" style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:20px\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">يحترم تطبيق </span><span dir=\"LTR\">5 star</span><span style=\"font-family:&quot;Arial&quot;,sans-serif\"> خصوصيتك ويقدر قلقك بشأن طريقة التعامل مع المعلومات الشخصية الخاصة بك ومشاركتها.</span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:20px\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">نحن نقدر ثقتك بنا ونعمل دائماً على حماية خصوصية البيانات الخاصة بك (الافراد&ndash;الشركات) مع استخدام التشفير التام لحماية البيانات المرسلة&nbsp; لذا نوضح في سياسة الخصوصية هذه المعلومات التي نقوم بجمعها وفيما تستخدم , لذا يجب العلم انه بموجب هذا الاتفاق فأنت توافق على احتفاظنا بمعلومات التسجيل الخاصة بك ولا تمانع في استخدام هذه البيانات بغرض تحسين الخدمة وتسيير المعاملات التي قد تتطلب الافصاح المقنن عن المعلومات الخاصة بك لأطراف ثالثة قد تقوم بمعالجة هذه المعلومات بالنيابة عنا ,لذا نتعهد بعدم الافصاح عن أي بيانات لأي اطراف ثالثة الا بغرض تسهيل المعاملات الخاصة بك عند الشراء والمعالجة.</span></span></span></p>\r\n\r\n<p dir=\"rtl\" style=\"text-align:justify\"><span style=\"font-size:20px\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">عندما تقوم بالاستفسار او طلب معلومات حول منتج ما او خدمة محددة او في حالة قيامك بإعطاء معلومات اضافية مستخدما أي من وسائل الاتصال معنا سواء كانت الكترونية او غير الكترونية فأننا سنستخدم بريدك الالكتروني لرد على استفساراتك وكما انه من الممكن حفظ بريدك ورسالتك واجابتنا عليها لأغراض مراقبة الجودة كما اننا قد نقوم بذألك للغايات القانونية والرقابية.</span></span></span></p>', '<p><span style=\"color:null\"><span style=\"font-size:20px\"><strong>5 Star respects your privacy and appreciates your concern about the way we handle and share your personal information.</strong></span></span></p>\r\n\r\n<p><span style=\"color:null\"><span style=\"font-size:20px\"><strong>We value your confidence in us and we are always working to protect the privacy of your data (individuals - companies) with the use of full encryption to protect the data sent so we clarify in this privacy policy this information that we collect and what you use, so it should be noted that according to this agreement you agree to keep our registration information You do not mind to use this data for the purpose of improving the service and conducting transactions that may require codified disclosure of your information to third parties that may process this information on our behalf, so we pledge not to disclose any data to any third parties except for the purpose of facilitating the transaction Your data when purchasing and processing.</strong></span></span></p>\r\n\r\n<p><span style=\"color:null\"><span style=\"font-size:20px\"><strong>When you inquire or request information about a specific product or service, or if you give additional information using any of the means of communication with us, whether electronic or non-electronic, we will use your email to respond to your inquiries, and it is also possible to save your mail and your message and our response to it for quality control purposes We may do this for legal and regulatory purposes.</strong></span></span></p>', '<p dir=\"RTL\" style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">تقدم شركتنا حلولا تكتمل معها اجواء الرفاهية في ادق تفاصيلها مع اكسسوارات وكماليات والتجهيزات الخاصة للأجنحة الفندقية لتجربه رائعة يستشعرها عملائنا </span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">,من اجل ذلك وضعنا خدماتنا فى هذا التطبيق لإبراز ديزاين معين قد يبحث البعض عنه فى مسكنه.</span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0cm; margin-right:0cm; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">لذا نود ان نزودكم ببعض اللمسات الفندقية التي من شأنها ان تجعلكم أكثر ارتباطا بمسكنكم لو حاولتم تنفيذها باحترافيه عالية لنشارككم بالتجديد...</span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0cm; margin-right:0cm; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">*نحن لا ننظر الى أعمالنا بمنظورها المادى فقط بل ننظر لها كقيمة مضافة ذات بعد إنساني وتثقيفي، ونعد عملاؤنا بمنتجات ذات جودة عالية خمس نجوم لنضمن لكم الراحة والمتعة .......</span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0cm; margin-right:0cm; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">* &nbsp;اكتسبنا خبراتنا في إدارة المشاريع اللازمة والمتخصصة في مجال التصميم الداخلي الفندقى بإشراف خبيرة المستلزمات الفندقيه والتصميم الداخلى م/نعمات التميمي الرائده فى عالم الديكور لأكثر من 18 عاما </span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0cm; margin-right:0cm; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">*&quot;رؤيتنا&quot;</span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0cm; margin-right:0cm; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">نحتاج الى رؤية قوية</span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0cm; margin-right:0cm; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">&nbsp;هذه الرؤية الواضحة هي بالضبط ما نستند عليها هنا في التطبيق، نحن نصمم بشغف مع استيعاب كامل للديزاين الفندقي خلال السنوات القادمة فإننا نعمل على خلق مفهوم جديد للديزاين الذى نحترم فيه المهنه وثقافتنا رسم الحاضر والمستقبل الى المجتمع </span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0cm; margin-right:0cm; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">*اتصل بنا </span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">*مدير المبيعات/</span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0cm; margin-right:0cm; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">*مصممة الديكور/ م. نعمات التميمى جوال رقم /0565390244</span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0cm; margin-right:0cm; text-align:right\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">*المدير العام /0559811011</span></span></span></span></p>', '<p><span style=\"color:#000000\"><span style=\"font-size:16px\"><strong>Our company offers solutions that complete the atmosphere of luxury in its finest detail, with accessories, accessories and special equipment for hotel suites, for a great experience that our customers can sense.</strong></span></span></p>\r\n\r\n<p><span style=\"color:#000000\"><span style=\"font-size:16px\"><strong>To this end, we have put our services in this application to highlight a certain design that some people may search for in their home.</strong></span></span></p>\r\n\r\n<p><span style=\"color:#000000\"><span style=\"font-size:16px\"><strong>So we would like to provide you with some hotel touches that would make you more connected to your residence if you tried to implement it professionally so we can share with you the renewal ...</strong></span></span></p>\r\n\r\n<p><span style=\"color:#000000\"><span style=\"font-size:16px\"><strong>* We do not only look at our business with its materialistic perspective, but also consider it as an added value with a human and educational dimension, and we promise our customers with high-quality products of five stars to ensure you comfort and pleasure .......</strong></span></span></p>\r\n\r\n<p><span style=\"color:#000000\"><span style=\"font-size:16px\"><strong>* We gained our expertise in managing the necessary and specialized projects in the field of hotel interior design under the supervision of an expert in hotel supplies and interior design m / Naamat Al-Tamimi, a pioneer in the world of decoration for more than 18 years</strong></span></span></p>\r\n\r\n<p><span style=\"color:#000000\"><span style=\"font-size:16px\"><strong>&quot;Our vision&quot;</strong></span></span></p>\r\n\r\n<p><span style=\"color:#000000\"><span style=\"font-size:16px\"><strong>We need a strong vision</strong></span></span></p>\r\n\r\n<p><span style=\"color:#000000\"><span style=\"font-size:16px\"><strong>This clear vision is exactly what we rely on here in the application, we design with passion and complete assimilation of the hotel design during the coming years we are working to create a new concept for the design in which we respect the profession and our culture to draw the present and the future into society</strong></span></span></p>\r\n\r\n<p><span style=\"color:#000000\"><span style=\"font-size:16px\"><strong>*call us</strong></span></span></p>\r\n\r\n<p><span style=\"color:#000000\"><span style=\"font-size:16px\"><strong>*Sales manager/</strong></span></span></p>\r\n\r\n<p><span style=\"color:#000000\"><span style=\"font-size:16px\"><strong>* Designed decoration / m. Neamat Al-Tamimi, Mobile No. 0565390244</strong></span></span></p>\r\n\r\n<p><span style=\"color:#000000\"><span style=\"font-size:16px\"><strong>* General Manager / 0559811011</strong></span></span></p>\r\n\r\n<p>&nbsp;</p>', '<p dir=\"RTL\" style=\"margin-left:0cm; margin-right:0cm; text-align:right\"><span style=\"font-size:20px\"><span style=\"background-color:white\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><strong><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"color:#4e4e4e\">مرحبًا بك في تطبيق&nbsp;</span></span></strong><strong><span dir=\"LTR\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"color:#4e4e4e\">Five star supplie</span></span></span></strong><strong><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"color:#4e4e4e\">. </span></span></strong></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-left:0cm; margin-right:0cm; text-align:right\"><span style=\"font-size:20px\"><span style=\"background-color:white\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><strong><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"color:#4e4e4e\">يتم توفير هذا التطبيق فقط لمساعدة العملاء في جميع معلومات مستلزمات الغرف الفندقية، وتحديد مدى توفر السلع والخدمات المتعلقة بالمستلزمات الفندقية.</span></span></strong></span></span></span></p>', '<p><span style=\"font-size:20px\">Welcome to the Five Star Supplie app.</span></p>\r\n\r\n<p><span style=\"font-size:20px\">This application is provided only to assist customers in all hotel room information information, and to determine the availability of goods and services related to hotel supplies.</span></p>', '6970.png');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `artitle` varchar(200) NOT NULL,
  `entitle` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `image` varchar(200) NOT NULL,
  `top` tinyint(4) NOT NULL DEFAULT 1,
  `suspensed` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `artitle`, `entitle`, `url`, `image`, `top`, `suspensed`) VALUES
(21, 'سليدر سفليييي', 'Down Slider', 'https://eltamiuz.com/', '7223.jpeg', 0, 0),
(22, 'سليدر علوى', 'Upper Slider', 'https://eltamiuz.com/', '2338.jpg', 1, 0),
(23, 'سليدر علوى', 'Upper Slider', 'https://eltamiuz.com/', '76.jpg', 1, 0),
(24, 'سليدر علوى', 'Upper Slider', 'https://eltamiuz.com/', '6061.jpg', 1, 0),
(25, 'سليدر علوى', 'Upper Slider', 'https://eltamiuz.com/', '8389.jpg', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` int(11) NOT NULL,
  `bill_number` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorite_items`
--
ALTER TABLE `favorite_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_images`
--
ALTER TABLE `item_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `favorite_items`
--
ALTER TABLE `favorite_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `item_images`
--
ALTER TABLE `item_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
