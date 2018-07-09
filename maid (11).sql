-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 06, 2018 at 02:22 PM
-- Server version: 5.7.22-0ubuntu0.16.04.1
-- PHP Version: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `maid`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `profile` text,
  `address` text,
  `about_me` text,
  `location` text,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `forget_token` varchar(255) DEFAULT NULL,
  `email` text NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `mobile`, `profile`, `address`, `about_me`, `location`, `password`, `remember_token`, `forget_token`, `email`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', '8881438096', '1530534525_sign_inisign_up.jpg', 'noida', 'MAID', 'fluper', '$2y$10$7/erWJzbESZS/R/hbpK98.xRax9AkPAZe5Cvxfl2Y.HgDJG.dsXlG', 'yvNSwoVbU2OZCLe6uQsToI9ztNvkFgmT2xyT6FAJeD2GE9Ot3Cxtg9uS2Hyb', '', 'gauravmrvh1@gmail.com', 1, '2018-05-08 12:35:57', '2018-07-02 12:28:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) NOT NULL,
  `district_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `country_id`, `state_id`, `district_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Turkey state1 district1 city1', 181, 1, 1, '2018-06-29 09:21:57', '2018-06-29 13:26:35', NULL),
(2, 'Turkey state1 district1 city2', 181, 1, 1, '2018-06-29 09:24:33', '2018-06-29 13:26:37', NULL),
(4, 'Turkey state1 district2 city1', 181, 1, 6, '2018-06-29 09:28:31', '2018-06-29 09:28:31', NULL),
(5, 'Turkey state1 district2 city2', 181, 1, 6, '2018-06-29 09:29:00', '2018-06-29 09:29:00', NULL),
(6, 'Turkey state1 district1 city3', 181, 1, 1, '2018-06-29 09:29:20', '2018-06-29 13:26:40', NULL),
(7, 'Turkey state1 district1 city4', 181, 1, 1, '2018-06-29 09:29:26', '2018-06-29 13:26:45', NULL),
(8, 'Turkey state1 district2 city3', 181, 1, 6, '2018-06-29 09:29:36', '2018-06-29 09:29:36', NULL),
(9, 'Turkey state1 district2 city4', 181, 1, 6, '2018-06-29 09:29:42', '2018-06-29 09:29:42', NULL),
(10, 'India state1 district1city1', 87, 5, 13, '2018-06-29 14:14:42', '2018-06-29 14:14:42', NULL),
(11, 'India state1 district1city2', 87, 5, 13, '2018-06-29 14:14:48', '2018-06-29 14:14:48', NULL),
(12, 'India state1 district1city3', 87, 5, 13, '2018-06-29 14:14:56', '2018-06-29 14:14:56', NULL),
(13, 'India state2 District1 City1', 87, 6, 16, '2018-06-29 14:17:05', '2018-06-29 14:17:05', NULL),
(14, 'India state2 District1 City2', 87, 6, 16, '2018-06-29 14:17:13', '2018-06-29 14:17:13', NULL),
(15, 'India state2 District1 City3', 87, 6, 16, '2018-06-29 14:17:19', '2018-06-29 14:17:19', NULL),
(16, 'India state2 District2 city1', 87, 6, 17, '2018-06-29 14:17:38', '2018-06-29 14:17:38', NULL),
(17, 'India state2 District2 city2', 87, 6, 17, '2018-06-29 14:17:44', '2018-06-29 14:17:44', NULL),
(18, 'India state2 District2 city3', 87, 6, 17, '2018-06-29 14:17:49', '2018-06-29 14:17:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dial_code` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `dial_code`, `code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Afghanistan', '+93', 'AF', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(2, 'Albania', '+355', 'AL', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(3, 'Algeria', '+213', 'DZ', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(4, 'AmericanSamoa', '+1 684', 'AS', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(5, 'Andorra', '+376', 'AD', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(6, 'Angola', '+244', 'AO', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(7, 'Anguilla', '+1 264', 'AI', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(8, 'Antigua and Barbuda', '+1268', 'AG', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(9, 'Argentina', '+54', 'AR', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(10, 'Armenia', '+374', 'AM', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(11, 'Aruba', '+297', 'AW', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(12, 'Australia', '+61', 'AU', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(13, 'Austria', '+43', 'AT', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(14, 'Azerbaijan', '+994', 'AZ', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(15, 'Bahamas', '+1 242', 'BS', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(16, 'Bahrain', '+973', 'BH', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(17, 'Bangladesh', '+880', 'BD', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(18, 'Barbados', '+1 246', 'BB', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(19, 'Belarus', '+375', 'BY', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(20, 'Belgium', '+32', 'BE', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(21, 'Belize', '+501', 'BZ', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(22, 'Benin', '+229', 'BJ', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(23, 'Bermuda', '+1 441', 'BM', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(24, 'Bhutan', '+975', 'BT', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(25, 'Bosnia and Herzegovina', '+387', 'BA', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(26, 'Botswana', '+267', 'BW', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(27, 'Brazil', '+55', 'BR', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(28, 'British Indian Ocean Territory', '+246', 'IO', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(29, 'Bulgaria', '+359', 'BG', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(30, 'Burkina Faso', '+226', 'BF', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(31, 'Burundi', '+257', 'BI', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(32, 'Cambodia', '+855', 'KH', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(33, 'Cameroon', '+237', 'CM', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(34, 'Canada', '+1', 'CA', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(35, 'Cape Verde', '+238', 'CV', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(36, 'Cayman Islands', '+ 345', 'KY', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(37, 'Central African Republic', '+236', 'CF', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(38, 'Chad', '+235', 'TD', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(39, 'Chile', '+56', 'CL', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(40, 'China', '+86', 'CN', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(41, 'Christmas Island', '+61', 'CX', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(42, 'Colombia', '+57', 'CO', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(43, 'Comoros', '+269', 'KM', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(44, 'Congo', '+242', 'CG', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(45, 'Cook Islands', '+682', 'CK', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(46, 'Costa Rica', '+506', 'CR', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(47, 'Croatia', '+385', 'HR', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(48, 'Cuba', '+53', 'CU', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(49, 'Cyprus', '+537', 'CY', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(50, 'Czech Republic', '+420', 'CZ', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(51, 'Denmark', '+45', 'DK', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(52, 'Djibouti', '+253', 'DJ', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(53, 'Dominica', '+1 767', 'DM', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(54, 'Dominican Republic', '+1 849', 'DO', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(55, 'Ecuador', '+593', 'EC', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(56, 'Egypt', '+20', 'EG', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(57, 'El Salvador', '+503', 'SV', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(58, 'Equatorial Guinea', '+240', 'GQ', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(59, 'Eritrea', '+291', 'ER', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(60, 'Estonia', '+372', 'EE', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(61, 'Ethiopia', '+251', 'ET', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(62, 'Faroe Islands', '+298', 'FO', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(63, 'Fiji', '+679', 'FJ', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(64, 'Finland', '+358', 'FI', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(65, 'France', '+33', 'FR', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(66, 'French Guiana', '+594', 'GF', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(67, 'French Polynesia', '+689', 'PF', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(68, 'Gabon', '+241', 'GA', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(69, 'Gambia', '+220', 'GM', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(70, 'Georgia', '+995', 'GE', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(71, 'Germany', '+49', 'DE', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(72, 'Ghana', '+233', 'GH', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(73, 'Gibraltar', '+350', 'GI', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(74, 'Greece', '+30', 'GR', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(75, 'Greenland', '+299', 'GL', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(76, 'Grenada', '+1 473', 'GD', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(77, 'Guadeloupe', '+590', 'GP', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(78, 'Guam', '+1 671', 'GU', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(79, 'Guatemala', '+502', 'GT', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(80, 'Guinea', '+224', 'GN', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(81, 'Guinea-Bissau', '+245', 'GW', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(82, 'Guyana', '+595', 'GY', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(83, 'Haiti', '+509', 'HT', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(84, 'Honduras', '+504', 'HN', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(85, 'Hungary', '+36', 'HU', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(86, 'Iceland', '+354', 'IS', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(87, 'India', '+91', 'IN', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(88, 'Indonesia', '+62', 'ID', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(89, 'Iraq', '+964', 'IQ', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(90, 'Ireland', '+353', 'IE', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(91, 'Israel', '+972', 'IL', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(92, 'Italy', '+39', 'IT', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(93, 'Jamaica', '+1 876', 'JM', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(94, 'Japan', '+81', 'JP', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(95, 'Jordan', '+962', 'JO', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(96, 'Kazakhstan', '+7 7', 'KZ', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(97, 'Kenya', '+254', 'KE', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(98, 'Kiribati', '+686', 'KI', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(99, 'Kuwait', '+965', 'KW', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(100, 'Kyrgyzstan', '+996', 'KG', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(101, 'Latvia', '+371', 'LV', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(102, 'Lebanon', '+961', 'LB', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(103, 'Lesotho', '+266', 'LS', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(104, 'Liberia', '+231', 'LR', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(105, 'Liechtenstein', '+423', 'LI', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(106, 'Lithuania', '+370', 'LT', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(107, 'Luxembourg', '+352', 'LU', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(108, 'Madagascar', '+261', 'MG', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(109, 'Malawi', '+265', 'MW', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(110, 'Malaysia', '+60', 'MY', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(111, 'Maldives', '+960', 'MV', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(112, 'Mali', '+223', 'ML', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(113, 'Malta', '+356', 'MT', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(114, 'Marshall Islands', '+692', 'MH', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(115, 'Martinique', '+596', 'MQ', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(116, 'Mauritania', '+222', 'MR', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(117, 'Mauritius', '+230', 'MU', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(118, 'Mayotte', '+262', 'YT', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(119, 'Mexico', '+52', 'MX', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(120, 'Monaco', '+377', 'MC', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(121, 'Mongolia', '+976', 'MN', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(122, 'Montenegro', '+382', 'ME', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(123, 'Montserrat', '+1664', 'MS', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(124, 'Morocco', '+212', 'MA', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(125, 'Myanmar', '+95', 'MM', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(126, 'Namibia', '+264', 'NA', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(127, 'Nauru', '+674', 'NR', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(128, 'Nepal', '+977', 'NP', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(129, 'Netherlands', '+31', 'NL', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(130, 'Netherlands Antilles', '+599', 'AN', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(131, 'New Caledonia', '+687', 'NC', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(132, 'New Zealand', '+64', 'NZ', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(133, 'Nicaragua', '+505', 'NI', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(134, 'Niger', '+227', 'NE', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(135, 'Nigeria', '+234', 'NG', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(136, 'Niue', '+683', 'NU', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(137, 'Norfolk Island', '+672', 'NF', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(138, 'Northern Mariana Islands', '+1 670', 'MP', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(139, 'Norway', '+47', 'NO', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(140, 'Oman', '+968', 'OM', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(141, 'Pakistan', '+92', 'PK', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(142, 'Palau', '+680', 'PW', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(143, 'Panama', '+507', 'PA', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(144, 'Papua New Guinea', '+675', 'PG', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(145, 'Paraguay', '+595', 'PY', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(146, 'Peru', '+51', 'PE', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(147, 'Philippines', '+63', 'PH', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(148, 'Poland', '+48', 'PL', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(149, 'Portugal', '+351', 'PT', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(150, 'Puerto Rico', '+1 939', 'PR', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(151, 'Qatar', '+974', 'QA', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(152, 'Romania', '+40', 'RO', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(153, 'Rwanda', '+250', 'RW', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(154, 'Samoa', '+685', 'WS', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(155, 'San Marino', '+378', 'SM', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(156, 'Saudi Arabia', '+966', 'SA', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(157, 'Senegal', '+221', 'SN', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(158, 'Serbia', '+381', 'RS', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(159, 'Seychelles', '+248', 'SC', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(160, 'Sierra Leone', '+232', 'SL', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(161, 'Singapore', '+65', 'SG', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(162, 'Slovakia', '+421', 'SK', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(163, 'Slovenia', '+386', 'SI', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(164, 'Solomon Islands', '+677', 'SB', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(165, 'South Africa', '+27', 'ZA', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(166, 'South Georgia and the South Sandwich Islands', '+500', 'GS', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(167, 'Spain', '+34', 'ES', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(168, 'Sri Lanka', '+94', 'LK', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(169, 'Sudan', '+249', 'SD', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(170, 'Suriname', '+597', 'SR', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(171, 'Swaziland', '+268', 'SZ', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(172, 'Sweden', '+46', 'SE', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(173, 'Switzerland', '+41', 'CH', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(174, 'Tajikistan', '+992', 'TJ', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(175, 'Thailand', '+66', 'TH', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(176, 'Togo', '+228', 'TG', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(177, 'Tokelau', '+690', 'TK', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(178, 'Tonga', '+676', 'TO', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(179, 'Trinidad and Tobago', '+1 868', 'TT', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(180, 'Tunisia', '+216', 'TN', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(181, 'Turkey', '+90', 'TR', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(182, 'Turkmenistan', '+993', 'TM', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(183, 'Turks and Caicos Islands', '+1 649', 'TC', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(184, 'Tuvalu', '+688', 'TV', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(185, 'Uganda', '+256', 'UG', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(186, 'Ukraine', '+380', 'UA', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(187, 'United Arab Emirates', '+971', 'AE', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(188, 'United Kingdom', '+44', 'GB', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(189, 'United States', '+1', 'US', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(190, 'Uruguay', '+598', 'UY', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(191, 'Uzbekistan', '+998', 'UZ', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(192, 'Vanuatu', '+678', 'VU', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(193, 'Wallis and Futuna', '+681', 'WF', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(194, 'Yemen', '+967', 'YE', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(195, 'Zambia', '+260', 'ZM', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(196, 'Zimbabwe', '+263', 'ZW', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(197, 'Åland Islands', '+358', 'AX', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(198, 'Bolivia, Plurinational State of', '+591', 'BO', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(199, 'Brunei Darussalam', '+673', 'BN', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(200, 'Cocos (Keeling) Islands', '+61', 'CC', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(201, 'Congo, The Democratic Republic Of', '+243', 'CD', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(202, 'Cote d\'Ivoire', '+225', 'CI', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(203, 'Falkland Islands (Malvinas)', '+500', 'FK', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(204, 'Guernsey', '+44', 'GG', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(205, 'Holy See (Vatican City State)', '+379', 'VA', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(206, 'Hong Kong', '+852', 'HK', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(207, 'Iran, Islamic Republic of', '+98', 'IR', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(208, 'Isle of Man', '+44', 'IM', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(209, 'Jersey', '+44', 'JE', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(210, 'Korea, Democratic People\'s Republic of', '+850', 'KP', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(211, 'Korea, Republic of', '+82', 'KR', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(212, 'Lao People\'s Democratic Republic', '+856', 'LA', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(213, 'Libyan Arab Jamahiriya', '+218', 'LY', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(214, 'Macao', '+853', 'MO', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(215, 'Macedonia, The Former Yugoslav Republic of', '+389', 'MK', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(216, 'Micronesia, Federated States of', '+691', 'FM', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(217, 'Moldova, Republic of', '+373', 'MD', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(218, 'Mozambique', '+258', 'MZ', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(219, 'Palestinian Territory, Occupied', '+970', 'PS', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(220, 'Pitcairn', '+872', 'PN', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(221, 'Réunion', '+262', 'RE', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(222, 'Russia', '+7', 'RU', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(223, 'Saint Barthélemy', '+590', 'BL', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(224, 'Saint Helena, Ascension and Tristan Da Cunha', '+290', 'SH', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(225, 'Saint Kitts and Nevis', '+1 869', 'KN', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(226, 'Saint Lucia', '+1 758', 'LC', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(227, 'Saint Martin', '+590', 'MF', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(228, 'Saint Pierre and Miquelon', '+508', 'PM', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(229, 'Saint Vincent and the Grenadines', '+1 784', 'VC', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(230, 'Sao Tome and Principe', '+239', 'ST', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(231, 'Somalia', '+252', 'SO', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(232, 'Svalbard and Jan Mayen', '+47', 'SJ', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(233, 'Syrian Arab Republic', '+963', 'SY', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(234, 'Taiwan, Province of China', '+886', 'TW', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(235, 'Tanzania, United Republic of', '+255', 'TZ', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(236, 'Timor-Leste', '+670', 'TL', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(237, 'Venezuela, Bolivarian Republic of', '+58', 'VE', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(238, 'Viet Nam', '+84', 'VN', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(239, 'Virgin Islands, British', '+1 284', 'VG', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL),
(240, 'Virgin Islands, U.S.', '+1 340', 'VI', '2018-01-16 09:05:31', '2018-01-16 09:05:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(25) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `name`, `symbol`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Dollar', '$', '2018-06-12 06:10:51', '2018-06-12 06:10:51', NULL),
(2, 'Euro', '€', '2018-06-12 06:10:51', '2018-06-12 06:10:51', NULL),
(3, 'Turkish lira', '₺', '2018-06-12 06:10:51', '2018-06-12 06:15:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `id` bigint(20) NOT NULL,
  `name` text NOT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`id`, `name`, `country_id`, `state_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Turkey state1 district1', 181, 1, '2018-06-29 09:16:57', '2018-06-29 09:32:20', NULL),
(2, 'Turkey state2 district1', 181, 2, '2018-06-29 09:17:13', '2018-06-29 09:17:32', NULL),
(3, 'Turkey state2 district2', 181, 2, '2018-06-29 09:18:03', '2018-06-29 09:18:03', NULL),
(4, 'Turkey state2 district3', 181, 2, '2018-06-29 09:18:14', '2018-06-29 09:18:14', NULL),
(5, 'Turkey state2 district4', 181, 2, '2018-06-29 09:18:26', '2018-06-29 09:18:26', NULL),
(6, 'Turkey state1 district2', 181, 1, '2018-06-29 09:18:41', '2018-06-29 09:18:41', NULL),
(7, 'Turkey state1 district3', 181, 1, '2018-06-29 09:18:47', '2018-06-29 09:18:47', NULL),
(8, 'Turkey state1 district4', 181, 1, '2018-06-29 09:18:54', '2018-06-29 09:18:54', NULL),
(9, 'Turkey state3 district1', 181, 3, '2018-06-29 09:19:21', '2018-06-29 09:19:21', NULL),
(10, 'Turkey state3 district2', 181, 3, '2018-06-29 09:19:36', '2018-06-29 09:19:36', NULL),
(11, 'Turkey state3 district3', 181, 3, '2018-06-29 09:19:43', '2018-06-29 09:19:43', NULL),
(12, 'Turkey state3 district4', 181, 3, '2018-06-29 09:19:52', '2018-06-29 09:19:52', NULL),
(13, 'India state1 district1', 87, 5, '2018-06-29 09:34:51', '2018-06-29 09:34:51', NULL),
(14, 'India state1 district2', 87, 5, '2018-06-29 09:34:59', '2018-06-29 09:34:59', NULL),
(16, 'India state2 District1', 87, 6, '2018-06-29 14:16:23', '2018-06-29 14:16:23', NULL),
(17, 'India state2 District2', 87, 6, '2018-06-29 14:16:30', '2018-06-29 14:16:30', NULL),
(18, 'India state2 District3', 87, 6, '2018-06-29 14:16:38', '2018-06-29 14:16:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `educations`
--

CREATE TABLE `educations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `educations`
--

INSERT INTO `educations` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'education1', '2018-05-23 10:21:42', '2018-05-23 10:21:42', NULL),
(2, 'education2', '2018-05-23 10:21:42', '2018-05-23 10:21:42', NULL),
(3, 'education3', '2018-05-23 10:21:42', '2018-05-23 10:21:42', NULL),
(4, 'education4', '2018-07-02 05:50:21', '2018-07-02 05:50:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_choices`
--

CREATE TABLE `job_choices` (
  `id` bigint(20) NOT NULL,
  `name` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_choices`
--

INSERT INTO `job_choices` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'baby care', '2018-05-24 05:45:04', '2018-05-24 06:33:23', NULL),
(2, 'child care', '2018-05-24 05:45:04', '2018-05-24 06:33:36', NULL),
(3, 'elderly care', '2018-05-24 05:45:04', '2018-05-24 06:33:43', NULL),
(4, 'patient care', '2018-05-24 05:45:04', '2018-05-24 06:33:43', NULL),
(5, 'cleaning', '2018-05-24 05:45:04', '2018-05-24 06:33:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_listing_title`
--

CREATE TABLE `job_listing_title` (
  `id` bigint(20) NOT NULL,
  `name` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_listing_title`
--

INSERT INTO `job_listing_title` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'i want maid', '2018-06-14 09:13:07', '2018-06-14 09:13:07', NULL),
(2, 'need patient care', '2018-06-14 09:13:25', '2018-06-14 09:13:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_posts`
--

CREATE TABLE `job_posts` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `job_listing_title_id` bigint(20) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  `district_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `working_style_id` bigint(20) DEFAULT NULL,
  `expected_min_fees` bigint(20) DEFAULT NULL,
  `expected_max_fees` bigint(20) DEFAULT NULL,
  `job_choice_id` bigint(20) DEFAULT NULL,
  `live_with_family` text,
  `travel` text,
  `description` text,
  `marital_status` text,
  `kid_status` text,
  `hijab` varchar(255) DEFAULT NULL,
  `nationality` bigint(20) DEFAULT NULL,
  `driving_licence` text,
  `smoking` text,
  `alcohol` text,
  `min_age` varchar(255) DEFAULT NULL,
  `max_age` varchar(255) DEFAULT NULL,
  `status_by_admin` int(11) NOT NULL DEFAULT '0' COMMENT '0 (Passive) 1 (Active)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_posts`
--

INSERT INTO `job_posts` (`id`, `user_id`, `job_listing_title_id`, `country_id`, `state_id`, `district_id`, `city_id`, `working_style_id`, `expected_min_fees`, `expected_max_fees`, `job_choice_id`, `live_with_family`, `travel`, `description`, `marital_status`, `kid_status`, `hijab`, `nationality`, `driving_licence`, `smoking`, `alcohol`, `min_age`, `max_age`, `status_by_admin`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 10, 1, 181, 1, 1, 4, 1, 132, 2132, 1, 'No', 'No', '.l,kjhgfd', 'Divorced', 'Yes,lives separately', 'Optional', 1, 'No', 'I use sometimes', 'I use', '18', '23', 0, '2018-06-29 13:26:15', '2018-07-04 12:55:18', NULL),
(2, 10, 2, 181, 1, 1, 1, 1, 45, 456, 1, 'No', 'No Matter', 'Jhgfdsa', 'Living Separately', 'Yes,lives separately', 'Optional', 1, 'Yes,I am not driving', 'I use', 'I use sometimes', '16', '20', 1, '2018-07-04 12:49:06', '2018-07-04 12:49:06', NULL),
(3, 10, 2, 181, 1, 6, 4, 2, 44, 456, 1, 'No', 'No Matter', 'Hgfds', 'Living Separately', 'Yes,lives separately', 'Optional', 1, 'Yes,I am not driving', 'I use sometimes', 'I use', '16', '19', 1, '2018-07-04 12:53:30', '2018-07-04 12:53:30', NULL),
(4, 10, 1, 181, 1, 6, 1, 1, 54, 456, 1, 'No', 'No Matter', 'Ytref', 'Married', 'Yes,lives with me', 'Optional', 1, 'No', 'I use', 'I use sometimes', '16', '21', 0, '2018-07-04 13:07:05', '2018-07-04 13:07:05', NULL),
(5, 10, 1, 181, 1, 6, 5, 2, 78, 567, 2, 'No', 'No Matter', 'Jfhfjfjh', 'Divorced', 'Yes,lives separately', 'Optional', 1, 'No', 'I use sometimes', 'I use sometimes', '16', '18', 0, '2018-07-04 13:10:02', '2018-07-04 13:10:02', NULL),
(6, 8, 2, 87, 5, 13, 10, 1, 2000, 5000, 1, 'No', 'No matter', 'I love babies', 'Living Separately', 'No', 'No', 1, 'Yes, I am Driving', 'I am not use', 'I use sometimes', '19yrs', '33yrs', 0, '2018-07-04 13:10:11', '2018-07-04 13:10:11', NULL),
(7, 44, 1, 87, 5, 13, 12, 3, 200, 500, 2, 'Yes', 'Yes', 'bbhu', 'Single', 'No', 'Yes', 4, 'Yes, I am Driving', 'I am not use', 'I am not use', '19yrs', '32yrs', 0, '2018-07-05 07:29:11', '2018-07-05 07:29:11', NULL),
(8, 44, 2, 181, 1, 8, 5, 2, 200, 600, 3, 'Yes', 'Yes', 'yctctc', 'Single', 'No', 'Yes', 3, 'Yes, I am Driving', 'I am not use', 'I am not use', '24yrs', '31yrs', 0, '2018-07-05 07:30:28', '2018-07-05 07:30:28', NULL),
(9, 8, 1, 87, 6, 17, 14, 2, 200, 500, 2, 'No', 'Yes', 'zbvxvdv f', 'Single', 'No', 'Yes', 1, 'Yes, I am Driving', 'I am not use', 'I am not use', '19yrs', '35yrs', 0, '2018-07-06 12:53:05', '2018-07-06 12:53:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_post_education`
--

CREATE TABLE `job_post_education` (
  `id` int(11) NOT NULL,
  `education_id` int(11) NOT NULL,
  `job_post_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_post_education`
--

INSERT INTO `job_post_education` (`id`, `education_id`, `job_post_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2018-06-29 13:26:15', NULL),
(2, 1, 1, '2018-06-29 13:26:15', NULL),
(3, 3, 2, '2018-07-04 12:49:06', NULL),
(4, 2, 2, '2018-07-04 12:49:06', NULL),
(5, 3, 3, '2018-07-04 12:53:30', NULL),
(6, 2, 3, '2018-07-04 12:53:30', NULL),
(7, 3, 4, '2018-07-04 13:07:05', NULL),
(8, 2, 4, '2018-07-04 13:07:05', NULL),
(9, 2, 5, '2018-07-04 13:10:02', NULL),
(10, 2, 6, '2018-07-04 13:10:11', NULL),
(11, 4, 7, '2018-07-05 07:29:11', NULL),
(12, 3, 7, '2018-07-05 07:29:11', NULL),
(13, 2, 7, '2018-07-05 07:29:11', NULL),
(14, 3, 8, '2018-07-05 07:30:28', NULL),
(15, 2, 9, '2018-07-06 12:53:05', NULL),
(16, 3, 9, '2018-07-06 12:53:05', NULL),
(17, 4, 9, '2018-07-06 12:53:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_post_known_languages`
--

CREATE TABLE `job_post_known_languages` (
  `id` int(11) NOT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  `job_post_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_post_known_languages`
--

INSERT INTO `job_post_known_languages` (`id`, `language_id`, `job_post_id`, `created_at`, `updated_at`) VALUES
(122, 3, 1, '2018-06-29 13:26:15', '2018-06-29 13:26:15'),
(123, 2, 1, '2018-06-29 13:26:15', '2018-06-29 13:26:15'),
(124, 4, 2, '2018-07-04 12:49:06', '2018-07-04 12:49:06'),
(125, 3, 2, '2018-07-04 12:49:06', '2018-07-04 12:49:06'),
(126, 4, 3, '2018-07-04 12:53:30', '2018-07-04 12:53:30'),
(127, 3, 3, '2018-07-04 12:53:30', '2018-07-04 12:53:30'),
(128, 2, 4, '2018-07-04 13:07:05', '2018-07-04 13:07:05'),
(129, 1, 4, '2018-07-04 13:07:05', '2018-07-04 13:07:05'),
(130, 3, 5, '2018-07-04 13:10:02', '2018-07-04 13:10:02'),
(131, 2, 5, '2018-07-04 13:10:02', '2018-07-04 13:10:02'),
(132, 4, 6, '2018-07-04 13:10:11', '2018-07-04 13:10:11'),
(133, 2, 6, '2018-07-04 13:10:11', '2018-07-04 13:10:11'),
(134, 3, 6, '2018-07-04 13:10:11', '2018-07-04 13:10:11'),
(135, 4, 7, '2018-07-05 07:29:11', '2018-07-05 07:29:11'),
(136, 3, 7, '2018-07-05 07:29:11', '2018-07-05 07:29:11'),
(137, 2, 7, '2018-07-05 07:29:11', '2018-07-05 07:29:11'),
(138, 1, 7, '2018-07-05 07:29:11', '2018-07-05 07:29:11'),
(139, 2, 8, '2018-07-05 07:30:28', '2018-07-05 07:30:28'),
(140, 4, 9, '2018-07-06 12:53:05', '2018-07-06 12:53:05'),
(141, 3, 9, '2018-07-06 12:53:05', '2018-07-06 12:53:05'),
(142, 2, 9, '2018-07-06 12:53:05', '2018-07-06 12:53:05');

-- --------------------------------------------------------

--
-- Table structure for table `job_post_nationality`
--

CREATE TABLE `job_post_nationality` (
  `id` bigint(20) NOT NULL,
  `nationality_id` bigint(20) NOT NULL,
  `job_post_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_post_pet_problems`
--

CREATE TABLE `job_post_pet_problems` (
  `id` bigint(20) NOT NULL,
  `pet_problem_id` bigint(20) NOT NULL,
  `job_post_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_post_pet_problems`
--

INSERT INTO `job_post_pet_problems` (`id`, `pet_problem_id`, `job_post_id`, `created_at`, `updated_at`) VALUES
(110, 2, 1, '2018-06-29 13:26:15', '2018-06-29 13:26:15'),
(111, 1, 1, '2018-06-29 13:26:15', '2018-06-29 13:26:15'),
(112, 2, 2, '2018-07-04 12:49:06', '2018-07-04 12:49:06'),
(113, 1, 2, '2018-07-04 12:49:06', '2018-07-04 12:49:06'),
(114, 3, 3, '2018-07-04 12:53:30', '2018-07-04 12:53:30'),
(115, 2, 3, '2018-07-04 12:53:30', '2018-07-04 12:53:30'),
(116, 4, 4, '2018-07-04 13:07:05', '2018-07-04 13:07:05'),
(117, 3, 4, '2018-07-04 13:07:05', '2018-07-04 13:07:05'),
(118, 2, 5, '2018-07-04 13:10:02', '2018-07-04 13:10:02'),
(119, 1, 5, '2018-07-04 13:10:02', '2018-07-04 13:10:02'),
(120, 2, 6, '2018-07-04 13:10:11', '2018-07-04 13:10:11'),
(121, 3, 6, '2018-07-04 13:10:11', '2018-07-04 13:10:11'),
(122, 1, 6, '2018-07-04 13:10:11', '2018-07-04 13:10:11'),
(123, 4, 6, '2018-07-04 13:10:11', '2018-07-04 13:10:11'),
(124, 4, 7, '2018-07-05 07:29:11', '2018-07-05 07:29:11'),
(125, 3, 7, '2018-07-05 07:29:11', '2018-07-05 07:29:11'),
(126, 2, 7, '2018-07-05 07:29:11', '2018-07-05 07:29:11'),
(127, 1, 7, '2018-07-05 07:29:11', '2018-07-05 07:29:11'),
(128, 2, 8, '2018-07-05 07:30:28', '2018-07-05 07:30:28'),
(129, 4, 9, '2018-07-06 12:53:05', '2018-07-06 12:53:05'),
(130, 3, 9, '2018-07-06 12:53:05', '2018-07-06 12:53:05'),
(131, 2, 9, '2018-07-06 12:53:05', '2018-07-06 12:53:05');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'language1', '2018-05-23 10:46:45', '2018-05-23 10:46:45', NULL),
(2, 'language2', '2018-05-23 10:46:45', '2018-05-23 10:46:45', NULL),
(3, 'language3', '2018-05-23 10:46:45', '2018-05-23 10:46:45', NULL),
(4, 'language4', '2018-07-02 05:43:33', '2018-07-02 05:43:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `log_activity`
--

CREATE TABLE `log_activity` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log_activity`
--

INSERT INTO `log_activity` (`id`, `subject`, `url`, `method`, `ip`, `agent`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'My Testing.', 'http://13.58.98.218/Maid/add-to-log', 'GET', '103.75.33.154', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', 1528443352, '2018-06-08 07:35:52', '2018-06-08 07:35:52'),
(2, 'My Testing.', 'http://13.58.98.218/Maid/admin/add-to-log', 'GET', '103.75.33.154', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', 1528444122, '2018-06-08 07:48:42', '2018-06-08 07:48:42');

-- --------------------------------------------------------

--
-- Table structure for table `maid_apply_agency`
--

CREATE TABLE `maid_apply_agency` (
  `id` int(11) NOT NULL,
  `maid_id` int(11) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `status` bigint(20) NOT NULL DEFAULT '0' COMMENT 'approved by agency or invitaion accepted by maid to join agency(1) , else(0)',
  `type` bigint(20) NOT NULL DEFAULT '1' COMMENT '1 (if maid apply in agency) , 2 (if agency send invitaion to maid)',
  `fired_status` int(11) NOT NULL DEFAULT '0',
  `reason_to_fire` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maid_apply_agency`
--

INSERT INTO `maid_apply_agency` (`id`, `maid_id`, `agency_id`, `status`, `type`, `fired_status`, `reason_to_fire`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 9, 1, 1, 1, 1, 'Hjgfdsjhgfdsmjhgfds', '2018-07-02 10:45:28', '2018-07-05 15:30:57', NULL),
(3, 9, 2, 0, 1, 0, NULL, '2018-07-02 10:45:37', '2018-07-02 10:45:37', NULL),
(4, 9, 3, 0, 1, 0, NULL, '2018-07-02 10:45:44', '2018-07-02 10:45:44', NULL),
(5, 12, 1, 1, 1, 1, 'Vcxvxcvxcvxc', '2018-07-03 07:30:30', '2018-07-06 12:47:25', NULL),
(6, 12, 2, 0, 1, 1, NULL, '2018-07-03 07:46:26', '2018-07-05 07:50:13', NULL),
(7, 12, 7, 0, 1, 0, NULL, '2018-07-03 07:51:08', '2018-07-03 07:51:08', NULL),
(8, 37, 1, 0, 1, 0, NULL, '2018-07-04 07:40:07', '2018-07-04 07:40:07', NULL),
(9, 8, 1, 0, 1, 0, NULL, '2018-07-04 13:41:44', '2018-07-04 13:41:44', NULL),
(11, 6, 2, 0, 1, 1, 'reason_to_fire', '2018-07-05 06:39:44', '2018-07-05 12:19:23', NULL),
(15, 28, 4, 1, 2, 0, NULL, '2018-07-05 13:34:46', '2018-07-05 14:01:20', NULL),
(16, 21, 4, 1, 1, 0, NULL, '2018-07-05 13:49:58', '2018-07-05 14:01:22', NULL),
(17, 12, 4, 1, 1, 1, NULL, '2018-07-05 13:54:07', '2018-07-05 15:04:18', NULL),
(18, 23, 4, 0, 2, 0, NULL, '2018-07-05 15:09:44', '2018-07-05 15:09:44', NULL),
(19, 1, 2, 0, 2, 0, NULL, '2018-07-06 05:42:51', '2018-07-06 05:42:51', NULL),
(20, 40, 1, 0, 2, 0, NULL, '2018-07-06 05:52:34', '2018-07-06 05:52:34', NULL),
(21, 39, 1, 0, 2, 0, NULL, '2018-07-06 05:52:54', '2018-07-06 05:52:54', NULL),
(22, 38, 1, 0, 2, 0, NULL, '2018-07-06 06:02:08', '2018-07-06 06:02:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maid_apply_jobs`
--

CREATE TABLE `maid_apply_jobs` (
  `id` int(11) NOT NULL,
  `maid_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maid_apply_jobs`
--

INSERT INTO `maid_apply_jobs` (`id`, `maid_id`, `job_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 1, '2018-07-02 10:03:00', '2018-07-02 10:03:00', NULL),
(2, 9, 1, '2018-07-02 10:05:11', '2018-07-02 10:05:11', NULL),
(3, 12, 1, '2018-07-03 06:31:13', '2018-07-03 06:31:13', NULL),
(4, 10, 21, '2018-07-03 11:03:24', '2018-07-03 11:03:24', NULL),
(5, 39, 3, '2018-07-05 06:21:32', '2018-07-05 06:21:32', NULL),
(6, 9, 3, '2018-07-06 10:19:54', '2018-07-06 10:19:54', NULL),
(7, 12, 3, '2018-07-06 13:49:53', '2018-07-06 13:49:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maid_favourite`
--

CREATE TABLE `maid_favourite` (
  `id` int(11) NOT NULL,
  `to_job_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maid_favourite`
--

INSERT INTO `maid_favourite` (`id`, `to_job_id`, `from_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 1, 9, '2018-07-02 09:02:40', '2018-07-02 09:02:40', NULL),
(4, 1, 37, '2018-07-04 07:37:44', '2018-07-04 07:37:44', NULL),
(5, 3, 39, '2018-07-05 06:19:26', '2018-07-05 06:19:26', NULL),
(6, 3, 40, '2018-07-05 07:04:08', '2018-07-05 07:04:08', NULL),
(7, 2, 40, '2018-07-05 07:04:10', '2018-07-05 07:04:10', NULL),
(9, 3, 4, '2018-07-06 06:49:07', '2018-07-06 06:49:07', NULL),
(10, 2, 1, '2018-07-06 10:51:42', '2018-07-06 10:51:42', NULL),
(11, 2, 4, '2018-07-06 13:08:11', '2018-07-06 13:08:11', NULL),
(12, 3, 12, '2018-07-06 13:49:26', '2018-07-06 13:49:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maid_job_choices`
--

CREATE TABLE `maid_job_choices` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `job_choice_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maid_job_choices`
--

INSERT INTO `maid_job_choices` (`id`, `user_id`, `job_choice_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 9, 3, '2018-06-29 17:08:03', '2018-07-06 19:31:17', '2018-07-06 19:31:17'),
(2, 11, 4, '2018-06-29 17:16:32', '2018-06-29 17:16:32', NULL),
(3, 12, 3, '2018-06-29 19:44:56', '2018-06-29 19:44:56', NULL),
(4, 20, 2, '2018-07-03 13:14:13', '2018-07-03 13:14:13', NULL),
(5, 20, 1, '2018-07-03 13:14:13', '2018-07-03 13:14:13', NULL),
(6, 21, 3, '2018-07-03 13:29:26', '2018-07-03 13:29:26', NULL),
(7, 21, 4, '2018-07-03 13:29:26', '2018-07-03 13:29:26', NULL),
(8, 21, 5, '2018-07-03 14:46:48', '2018-07-03 14:46:48', NULL),
(9, 21, 2, '2018-07-03 14:46:48', '2018-07-03 14:46:48', NULL),
(10, 23, 2, '2018-07-03 17:32:12', '2018-07-03 17:32:12', NULL),
(11, 23, 1, '2018-07-03 17:32:12', '2018-07-03 17:32:12', NULL),
(12, 21, 1, '2018-07-03 17:53:13', '2018-07-03 17:53:13', NULL),
(13, 24, 3, '2018-07-03 18:54:01', '2018-07-03 18:54:01', NULL),
(14, 35, 2, '2018-07-04 11:01:53', '2018-07-04 11:01:53', NULL),
(15, 35, 1, '2018-07-04 11:01:53', '2018-07-04 11:01:53', NULL),
(16, 37, 3, '2018-07-04 11:45:57', '2018-07-04 11:45:57', NULL),
(17, 35, 4, '2018-07-04 14:18:39', '2018-07-04 14:18:39', NULL),
(18, 35, 3, '2018-07-04 14:18:39', '2018-07-04 14:18:39', NULL),
(19, 38, 3, '2018-07-04 14:25:50', '2018-07-04 14:25:50', NULL),
(20, 38, 2, '2018-07-04 14:25:50', '2018-07-04 14:25:50', NULL),
(21, 6, 1, '2018-07-04 19:50:42', '2018-07-05 14:14:02', NULL),
(22, 6, 2, '2018-07-04 19:50:42', '2018-07-05 14:14:02', NULL),
(23, 39, 3, '2018-07-05 11:43:00', '2018-07-05 11:43:00', NULL),
(24, 39, 4, '2018-07-05 11:43:00', '2018-07-05 11:43:00', NULL),
(25, 39, 5, '2018-07-05 11:43:00', '2018-07-05 11:43:00', NULL),
(26, 40, 5, '2018-07-05 12:31:38', '2018-07-05 12:31:38', NULL),
(27, 40, 4, '2018-07-05 12:31:38', '2018-07-05 12:31:38', NULL),
(28, 40, 3, '2018-07-05 12:31:38', '2018-07-05 12:31:38', NULL),
(29, 40, 2, '2018-07-05 12:31:38', '2018-07-05 12:31:38', NULL),
(30, 40, 1, '2018-07-05 12:31:38', '2018-07-05 12:31:38', NULL),
(31, 9, 2, '2018-07-05 14:19:15', '2018-07-06 19:31:17', '2018-07-06 19:31:17'),
(32, 9, 1, '2018-07-06 19:31:17', '2018-07-06 19:31:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maid_skill`
--

CREATE TABLE `maid_skill` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `skill_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maid_skill`
--

INSERT INTO `maid_skill` (`id`, `user_id`, `skill_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 9, 3, '2018-06-29 17:08:03', '2018-07-06 19:31:17', '2018-07-06 19:31:17'),
(2, 9, 2, '2018-06-29 17:08:03', '2018-07-05 14:39:23', '2018-07-05 14:39:23'),
(3, 11, 4, '2018-06-29 17:16:32', '2018-06-29 17:16:32', NULL),
(4, 12, 4, '2018-06-29 19:44:56', '2018-06-29 19:44:56', NULL),
(5, 12, 3, '2018-06-29 19:44:56', '2018-06-29 19:44:56', NULL),
(6, 20, 3, '2018-07-03 13:14:13', '2018-07-03 13:14:13', NULL),
(7, 20, 2, '2018-07-03 13:14:13', '2018-07-03 13:14:13', NULL),
(8, 21, 4, '2018-07-03 13:29:26', '2018-07-03 13:29:26', NULL),
(9, 21, 3, '2018-07-03 13:29:26', '2018-07-03 13:29:26', NULL),
(10, 21, 1, '2018-07-03 14:46:48', '2018-07-03 14:46:48', NULL),
(11, 21, 2, '2018-07-03 14:46:48', '2018-07-03 14:46:48', NULL),
(12, 21, 5, '2018-07-03 14:46:48', '2018-07-03 14:46:48', NULL),
(13, 23, 3, '2018-07-03 17:32:12', '2018-07-03 17:32:12', NULL),
(14, 23, 2, '2018-07-03 17:32:12', '2018-07-03 17:32:12', NULL),
(15, 24, 3, '2018-07-03 18:54:01', '2018-07-03 18:54:01', NULL),
(16, 24, 2, '2018-07-03 18:54:01', '2018-07-03 18:54:01', NULL),
(17, 35, 2, '2018-07-04 11:01:53', '2018-07-04 11:01:53', NULL),
(18, 35, 1, '2018-07-04 11:01:53', '2018-07-04 11:01:53', NULL),
(19, 37, 3, '2018-07-04 11:45:57', '2018-07-04 11:45:57', NULL),
(20, 37, 2, '2018-07-04 12:49:09', '2018-07-04 12:49:09', NULL),
(21, 35, 3, '2018-07-04 14:18:39', '2018-07-04 14:18:39', NULL),
(22, 38, 4, '2018-07-04 14:25:50', '2018-07-04 14:25:50', NULL),
(23, 38, 3, '2018-07-04 14:25:50', '2018-07-04 14:25:50', NULL),
(24, 38, 2, '2018-07-04 14:25:50', '2018-07-04 14:25:50', NULL),
(27, 6, 1, '2018-07-04 19:23:26', '2018-07-05 14:14:02', NULL),
(28, 6, 2, '2018-07-04 19:23:26', '2018-07-05 14:14:02', NULL),
(29, 6, 3, '2018-07-04 19:23:50', '2018-07-05 13:24:29', '2018-07-05 13:24:29'),
(30, 39, 3, '2018-07-05 11:43:00', '2018-07-05 11:43:00', NULL),
(31, 39, 4, '2018-07-05 11:43:00', '2018-07-05 11:43:00', NULL),
(32, 39, 5, '2018-07-05 11:43:00', '2018-07-05 11:43:00', NULL),
(33, 39, 2, '2018-07-05 11:47:08', '2018-07-05 11:47:08', NULL),
(34, 40, 5, '2018-07-05 12:31:38', '2018-07-05 12:31:38', NULL),
(35, 40, 4, '2018-07-05 12:31:38', '2018-07-05 12:31:38', NULL),
(36, 40, 3, '2018-07-05 12:31:38', '2018-07-05 12:31:38', NULL),
(37, 40, 2, '2018-07-05 12:31:38', '2018-07-05 12:31:38', NULL),
(38, 40, 1, '2018-07-05 12:31:38', '2018-07-05 12:31:38', NULL),
(39, 9, 4, '2018-07-05 14:39:23', '2018-07-06 19:31:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maid_working_city`
--

CREATE TABLE `maid_working_city` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maid_working_city`
--

INSERT INTO `maid_working_city` (`id`, `user_id`, `city_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 9, 1, '2018-06-29 17:08:03', '2018-07-05 14:19:15', '2018-07-05 14:19:15'),
(2, 11, 9, '2018-06-29 17:16:32', '2018-06-29 17:16:32', NULL),
(3, 12, 10, '2018-06-29 19:44:56', '2018-06-29 19:44:56', NULL),
(4, 20, 2, '2018-07-03 13:14:13', '2018-07-03 13:14:13', NULL),
(5, 20, 1, '2018-07-03 13:14:13', '2018-07-03 13:14:13', NULL),
(6, 21, 6, '2018-07-03 13:29:26', '2018-07-03 13:29:26', NULL),
(7, 21, 8, '2018-07-03 14:46:48', '2018-07-03 14:46:48', NULL),
(8, 23, 4, '2018-07-03 17:32:12', '2018-07-03 17:32:12', NULL),
(9, 23, 2, '2018-07-03 17:32:12', '2018-07-03 17:32:12', NULL),
(10, 21, 11, '2018-07-03 17:49:51', '2018-07-03 17:49:51', NULL),
(11, 21, 10, '2018-07-03 17:53:13', '2018-07-03 17:53:13', NULL),
(12, 24, 11, '2018-07-03 18:54:01', '2018-07-03 18:54:01', NULL),
(13, 35, 2, '2018-07-04 11:01:53', '2018-07-04 11:01:53', NULL),
(14, 35, 1, '2018-07-04 11:01:53', '2018-07-04 11:01:53', NULL),
(15, 37, 11, '2018-07-04 11:45:57', '2018-07-04 11:45:57', NULL),
(16, 35, 5, '2018-07-04 14:18:39', '2018-07-04 14:18:39', NULL),
(17, 35, 4, '2018-07-04 14:18:39', '2018-07-04 14:18:39', NULL),
(18, 38, 9, '2018-07-04 14:25:50', '2018-07-04 14:25:50', NULL),
(19, 38, 8, '2018-07-04 14:25:50', '2018-07-04 14:25:50', NULL),
(20, 38, 7, '2018-07-04 14:25:50', '2018-07-04 14:25:50', NULL),
(21, 38, 6, '2018-07-04 14:25:50', '2018-07-04 14:25:50', NULL),
(22, 38, 5, '2018-07-04 14:25:50', '2018-07-04 14:25:50', NULL),
(23, 38, 4, '2018-07-04 14:25:50', '2018-07-04 14:25:50', NULL),
(24, 38, 2, '2018-07-04 14:25:50', '2018-07-04 14:25:50', NULL),
(25, 38, 1, '2018-07-04 14:25:50', '2018-07-04 14:25:50', NULL),
(26, 6, 1, '2018-07-04 19:45:02', '2018-07-05 14:14:02', NULL),
(27, 6, 2, '2018-07-04 19:45:02', '2018-07-05 14:14:02', NULL),
(28, 6, 3, '2018-07-04 19:45:36', '2018-07-05 13:24:29', '2018-07-05 13:24:29'),
(29, 39, 12, '2018-07-05 11:43:00', '2018-07-05 11:43:00', NULL),
(30, 39, 11, '2018-07-05 11:43:00', '2018-07-05 11:43:00', NULL),
(31, 40, 18, '2018-07-05 12:31:38', '2018-07-05 12:31:38', NULL),
(32, 40, 17, '2018-07-05 12:31:38', '2018-07-05 12:31:38', NULL),
(33, 40, 16, '2018-07-05 12:31:38', '2018-07-05 12:31:38', NULL),
(34, 9, 4, '2018-07-05 14:19:15', '2018-07-05 14:39:23', '2018-07-05 14:39:23'),
(35, 9, 2, '2018-07-05 14:19:15', '2018-07-06 19:31:17', NULL),
(36, 21, 12, '2018-07-05 19:11:16', '2018-07-05 19:11:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maid_working_district`
--

CREATE TABLE `maid_working_district` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `district_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maid_working_district`
--

INSERT INTO `maid_working_district` (`id`, `user_id`, `district_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 9, 1, '2018-06-29 17:08:03', '2018-07-06 19:31:17', '2018-07-06 19:31:17'),
(2, 11, 7, '2018-06-29 17:16:32', '2018-06-29 17:16:32', NULL),
(3, 12, 13, '2018-06-29 19:44:56', '2018-06-29 19:44:56', NULL),
(4, 12, 14, '2018-06-29 19:45:27', '2018-06-29 19:45:27', NULL),
(5, 20, 6, '2018-07-03 13:14:13', '2018-07-03 13:14:13', NULL),
(6, 20, 1, '2018-07-03 13:14:13', '2018-07-03 13:14:13', NULL),
(7, 21, 1, '2018-07-03 13:29:26', '2018-07-03 13:29:26', NULL),
(8, 21, 6, '2018-07-03 14:46:48', '2018-07-03 14:46:48', NULL),
(9, 23, 6, '2018-07-03 17:32:12', '2018-07-03 17:32:12', NULL),
(10, 23, 1, '2018-07-03 17:32:12', '2018-07-03 17:32:12', NULL),
(11, 21, 13, '2018-07-03 17:49:51', '2018-07-03 17:49:51', NULL),
(12, 21, 14, '2018-07-03 18:09:35', '2018-07-03 18:09:35', NULL),
(13, 24, 14, '2018-07-03 18:54:01', '2018-07-03 18:54:01', NULL),
(14, 35, 6, '2018-07-04 11:01:53', '2018-07-04 11:01:53', NULL),
(15, 35, 1, '2018-07-04 11:01:53', '2018-07-04 11:01:53', NULL),
(16, 37, 14, '2018-07-04 11:45:57', '2018-07-04 11:45:57', NULL),
(17, 38, 7, '2018-07-04 14:25:50', '2018-07-04 14:25:50', NULL),
(18, 38, 6, '2018-07-04 14:25:50', '2018-07-04 14:25:50', NULL),
(19, 6, 1, '2018-07-04 19:47:17', '2018-07-05 14:14:02', NULL),
(20, 6, 2, '2018-07-04 19:47:17', '2018-07-05 14:14:02', NULL),
(21, 6, 3, '2018-07-04 19:47:37', '2018-07-04 19:47:43', '2018-07-04 19:47:43'),
(22, 39, 14, '2018-07-05 11:43:00', '2018-07-05 11:43:00', NULL),
(23, 39, 13, '2018-07-05 11:43:00', '2018-07-05 11:43:00', NULL),
(24, 40, 18, '2018-07-05 12:31:38', '2018-07-05 12:31:38', NULL),
(25, 40, 17, '2018-07-05 12:31:38', '2018-07-05 12:31:38', NULL),
(26, 9, 6, '2018-07-05 14:19:15', '2018-07-06 19:31:17', '2018-07-06 19:31:17'),
(27, 9, 14, '2018-07-06 19:31:17', '2018-07-06 19:31:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maid_working_states`
--

CREATE TABLE `maid_working_states` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maid_working_states`
--

INSERT INTO `maid_working_states` (`id`, `user_id`, `state_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 9, 1, '2018-06-29 17:08:03', '2018-07-06 19:31:17', NULL),
(2, 11, 1, '2018-06-29 17:16:32', '2018-06-29 17:16:32', NULL),
(3, 12, 5, '2018-06-29 19:44:56', '2018-06-29 19:44:56', NULL),
(4, 20, 1, '2018-07-03 13:14:13', '2018-07-03 13:14:13', NULL),
(5, 21, 1, '2018-07-03 13:29:26', '2018-07-03 13:29:26', NULL),
(6, 23, 1, '2018-07-03 17:32:12', '2018-07-03 17:32:12', NULL),
(7, 21, 5, '2018-07-03 17:49:51', '2018-07-03 17:49:51', NULL),
(8, 24, 5, '2018-07-03 18:54:01', '2018-07-03 18:54:01', NULL),
(9, 35, 1, '2018-07-04 11:01:53', '2018-07-04 11:01:53', NULL),
(10, 37, 5, '2018-07-04 11:45:57', '2018-07-04 11:45:57', NULL),
(11, 38, 1, '2018-07-04 14:25:50', '2018-07-04 14:25:50', NULL),
(12, 6, 1, '2018-07-04 19:50:42', '2018-07-05 14:14:02', NULL),
(13, 6, 2, '2018-07-04 19:50:42', '2018-07-05 14:14:02', NULL),
(14, 39, 5, '2018-07-05 11:43:00', '2018-07-05 11:43:00', NULL),
(15, 40, 6, '2018-07-05 12:31:38', '2018-07-05 12:31:38', NULL),
(16, 9, 2, '2018-07-05 14:19:15', '2018-07-05 14:39:23', '2018-07-05 14:39:23');

-- --------------------------------------------------------

--
-- Table structure for table `maid_working_style`
--

CREATE TABLE `maid_working_style` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `style_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maid_working_style`
--

INSERT INTO `maid_working_style` (`id`, `user_id`, `style_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 9, 3, '2018-06-29 17:08:03', '2018-07-06 19:31:17', NULL),
(2, 11, 3, '2018-06-29 17:16:32', '2018-06-29 17:16:32', NULL),
(3, 12, 3, '2018-06-29 19:44:56', '2018-06-29 19:44:56', NULL),
(4, 20, 2, '2018-07-03 13:14:13', '2018-07-03 13:14:13', NULL),
(5, 21, 3, '2018-07-03 13:29:26', '2018-07-03 13:29:26', NULL),
(6, 21, 2, '2018-07-03 13:29:26', '2018-07-03 13:29:26', NULL),
(7, 21, 4, '2018-07-03 14:46:48', '2018-07-03 14:46:48', NULL),
(8, 23, 2, '2018-07-03 17:32:12', '2018-07-03 17:32:12', NULL),
(9, 24, 3, '2018-07-03 18:54:01', '2018-07-03 18:54:01', NULL),
(10, 24, 2, '2018-07-03 18:54:01', '2018-07-03 18:54:01', NULL),
(11, 35, 3, '2018-07-04 11:01:53', '2018-07-04 11:01:53', NULL),
(12, 35, 2, '2018-07-04 11:01:53', '2018-07-04 11:01:53', NULL),
(13, 37, 3, '2018-07-04 11:45:57', '2018-07-04 11:45:57', NULL),
(14, 37, 2, '2018-07-04 12:49:09', '2018-07-04 12:49:09', NULL),
(15, 38, 3, '2018-07-04 14:25:50', '2018-07-04 14:25:50', NULL),
(16, 38, 2, '2018-07-04 14:25:50', '2018-07-04 14:25:50', NULL),
(17, 6, 1, '2018-07-04 19:50:42', '2018-07-05 14:14:02', NULL),
(18, 6, 2, '2018-07-04 19:50:42', '2018-07-05 14:14:02', NULL),
(19, 39, 3, '2018-07-05 11:43:00', '2018-07-05 11:43:00', NULL),
(20, 39, 4, '2018-07-05 11:43:00', '2018-07-05 11:43:00', NULL),
(21, 39, 2, '2018-07-05 11:47:08', '2018-07-05 11:47:08', NULL),
(22, 40, 4, '2018-07-05 12:31:38', '2018-07-05 12:31:38', NULL),
(23, 40, 3, '2018-07-05 12:31:38', '2018-07-05 12:31:38', NULL),
(24, 40, 2, '2018-07-05 12:31:38', '2018-07-05 12:31:38', NULL),
(25, 40, 1, '2018-07-05 12:31:38', '2018-07-05 12:31:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maid_work_countries`
--

CREATE TABLE `maid_work_countries` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maid_work_countries`
--

INSERT INTO `maid_work_countries` (`id`, `user_id`, `country_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 9, 181, '2018-06-29 17:08:03', '2018-07-06 19:31:17', NULL),
(2, 11, 181, '2018-06-29 17:16:32', '2018-06-29 17:16:32', NULL),
(3, 12, 87, '2018-06-29 19:44:56', '2018-06-29 19:44:56', NULL),
(4, 13, 6, '2018-06-29 22:27:47', '2018-06-29 22:27:47', NULL),
(5, 20, 181, '2018-07-03 13:14:13', '2018-07-03 13:14:13', NULL),
(6, 21, 181, '2018-07-03 13:29:26', '2018-07-03 13:29:26', NULL),
(7, 23, 181, '2018-07-03 17:32:12', '2018-07-03 17:32:12', NULL),
(8, 21, 87, '2018-07-03 17:49:51', '2018-07-03 17:49:51', NULL),
(9, 24, 87, '2018-07-03 18:54:01', '2018-07-03 18:54:01', NULL),
(10, 35, 181, '2018-07-04 11:01:53', '2018-07-04 11:01:53', NULL),
(11, 37, 87, '2018-07-04 11:45:57', '2018-07-04 11:45:57', NULL),
(12, 38, 181, '2018-07-04 14:25:50', '2018-07-04 14:25:50', NULL),
(13, 6, 87, '2018-07-04 19:50:42', '2018-07-05 14:14:02', NULL),
(14, 6, 84, '2018-07-04 19:50:42', '2018-07-05 14:14:02', NULL),
(15, 39, 87, '2018-07-05 11:43:00', '2018-07-05 11:43:00', NULL),
(16, 40, 87, '2018-07-05 12:31:38', '2018-07-05 12:31:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maid_work_experiences`
--

CREATE TABLE `maid_work_experiences` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `detail` text,
  `start_date` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `still_working` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maid_work_experiences`
--

INSERT INTO `maid_work_experiences` (`id`, `user_id`, `detail`, `start_date`, `end_date`, `still_working`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 'web', '01-01-2016', '27-05-2017', '1', '2018-07-04 19:58:07', '2018-07-05 13:24:29', '2018-07-05 13:24:29'),
(2, 6, 'flu', '01-01-2016', '27-05-2017', '0', '2018-07-04 19:58:07', '2018-07-04 19:59:30', '2018-07-04 19:59:30');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_05_11_090735_create_user_images_table', 1),
(4, '2018_05_15_091437_create_city_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nationality`
--

CREATE TABLE `nationality` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nationality`
--

INSERT INTO `nationality` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Indian', '2018-07-02 05:36:08', '2018-07-02 05:36:08', NULL),
(2, 'Pakistani', '2018-07-02 05:36:14', '2018-07-02 05:36:14', NULL),
(3, 'Afganistani', '2018-07-02 05:36:24', '2018-07-02 05:36:24', NULL),
(4, 'Turkish', '2018-07-02 05:37:01', '2018-07-02 05:37:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `to_id` bigint(20) NOT NULL,
  `text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `from_id`, `to_id`, `text`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 'Agency send registration invitaion.', '2018-07-05 07:06:31', '2018-07-05 07:06:31', NULL),
(2, 4, 28, 'Agency send registration invitaion.', '2018-07-05 13:34:46', '2018-07-05 13:34:46', NULL),
(3, 4, 23, 'Agency send registration invitaion.', '2018-07-05 15:09:44', '2018-07-05 15:09:44', NULL),
(4, 1, 40, 'Agency send registration invitaion.', '2018-07-06 05:52:34', '2018-07-06 05:52:34', NULL),
(5, 1, 39, 'Agency send registration invitaion.', '2018-07-06 05:52:54', '2018-07-06 05:52:54', NULL),
(6, 1, 38, 'Agency send registration invitaion.', '2018-07-06 06:02:08', '2018-07-06 06:02:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pet_problems`
--

CREATE TABLE `pet_problems` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pet_problems`
--

INSERT INTO `pet_problems` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'pet_problem1', '2018-05-23 12:53:52', '2018-05-23 12:53:52', NULL),
(2, 'pet_problem2', '2018-05-23 12:53:52', '2018-05-23 12:53:52', NULL),
(3, 'pet_problem3', '2018-05-23 12:53:52', '2018-05-23 12:53:52', NULL),
(4, 'pet_problem4', '2018-07-02 06:13:23', '2018-07-02 06:13:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rating_review`
--

CREATE TABLE `rating_review` (
  `id` int(11) NOT NULL,
  `rating_by` bigint(20) NOT NULL,
  `rating_to` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `review` text,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0 (rate by user to maid) , 1 (rate by agency on job post)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating_review`
--

INSERT INTO `rating_review` (`id`, `rating_by`, `rating_to`, `job_id`, `review`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 10, 3, NULL, 'Kjhygtfrewuytre', 0, '2018-07-04 10:33:53', '2018-07-04 10:33:53', NULL),
(2, 10, 6, NULL, 'Hgffhfhf', 0, '2018-07-04 11:04:53', '2018-07-04 11:04:53', NULL),
(3, 10, 3, NULL, 'Ghfghfgdhfghfgh', 0, '2018-07-04 11:21:12', '2018-07-04 11:21:12', NULL),
(4, 10, 6, NULL, 'Oiuy', 0, '2018-07-04 11:49:19', '2018-07-04 11:49:19', NULL),
(5, 10, 6, NULL, 'Jhgfds', 0, '2018-07-04 12:10:14', '2018-07-04 12:10:14', NULL),
(6, 10, 6, NULL, ',jhgfds', 0, '2018-07-04 12:10:32', '2018-07-04 12:10:32', NULL),
(7, 10, 6, NULL, 'Dfgdfgdfgdfggdfgdfgdf', 0, '2018-07-04 12:15:59', '2018-07-04 12:15:59', NULL),
(8, 10, 21, NULL, 'review', 0, '2018-07-04 12:21:20', '2018-07-04 12:21:20', NULL),
(9, 8, 1, NULL, 'review', 0, '2018-07-04 12:25:39', '2018-07-04 12:25:39', NULL),
(10, 8, 11, NULL, 'Nice to work with her', 0, '2018-07-04 12:49:46', '2018-07-04 12:49:46', NULL),
(11, 10, 36, NULL, 'Gfds', 0, '2018-07-04 13:34:51', '2018-07-04 13:34:51', NULL),
(12, 8, 9, NULL, 'ok', 0, '2018-07-05 06:40:45', '2018-07-05 06:40:45', NULL),
(13, 8, 37, NULL, 'I ydyxhxhxhchvi', 0, '2018-07-05 06:41:36', '2018-07-05 06:41:36', NULL),
(14, 8, 9, NULL, 'hhuchchcu', 0, '2018-07-05 06:41:58', '2018-07-05 06:41:58', NULL),
(15, 44, 35, NULL, 'vvhh', 0, '2018-07-05 07:31:09', '2018-07-05 07:31:09', NULL),
(16, 1, 1, NULL, 'Olikjuhygtfrkjiu7hy6gtjuhy6gtf', 0, '2018-07-06 08:49:22', '2018-07-06 08:49:22', NULL),
(17, 1, 1, NULL, 'fdsdfsdfsd', 0, '2018-07-06 08:51:56', '2018-07-06 08:51:56', NULL),
(18, 1, 10, NULL, 'fdsdfsdfsd', 0, '2018-07-06 08:52:23', '2018-07-06 08:52:23', NULL),
(19, 1, 1, NULL, NULL, 0, '2018-07-06 09:06:49', '2018-07-06 09:06:49', NULL),
(20, 1, 1, NULL, 'review', 0, '2018-07-06 09:07:12', '2018-07-06 09:07:12', NULL),
(22, 1, NULL, 1, 'review', 1, '2018-07-06 09:10:11', '2018-07-06 09:10:11', NULL),
(23, 10, 28, NULL, 'Fhgfghfhjfh', 0, '2018-07-06 10:31:22', '2018-07-06 10:31:22', NULL),
(24, 4, NULL, 1, 'review', 1, '2018-07-06 10:40:15', '2018-07-06 10:40:15', NULL),
(25, 4, 1, NULL, 'review', 0, '2018-07-06 11:17:56', '2018-07-06 11:17:56', NULL),
(26, 10, 32, NULL, 'Fgdfgfdgdfgfgdfgdf', 0, '2018-07-06 11:38:54', '2018-07-06 11:38:54', NULL),
(27, 10, 26, NULL, 'Jhgfdsargergerger', 0, '2018-07-06 12:05:09', '2018-07-06 12:05:09', NULL),
(28, 10, 16, NULL, 'Ffhfhfhffhg', 0, '2018-07-06 12:20:17', '2018-07-06 12:20:17', NULL),
(29, 10, 20, NULL, 'Hjgfdsghj', 0, '2018-07-06 12:28:03', '2018-07-06 12:28:03', NULL),
(30, 10, 22, NULL, 'Hfghfgh', 0, '2018-07-06 12:31:24', '2018-07-06 12:31:24', NULL),
(31, 8, 39, NULL, 'good to work with him', 0, '2018-07-06 12:40:03', '2018-07-06 12:40:03', NULL),
(32, 8, 34, NULL, 'good but bad', 0, '2018-07-06 12:41:09', '2018-07-06 12:41:09', NULL),
(33, 8, 34, NULL, NULL, 0, '2018-07-06 12:44:04', '2018-07-06 12:44:04', NULL),
(34, 8, 38, NULL, 'ttccttvtv very', 0, '2018-07-06 12:46:19', '2018-07-06 12:46:19', NULL),
(35, 8, 34, NULL, 'ghrhrjrjvkjh', 0, '2018-07-06 12:46:35', '2018-07-06 12:46:35', NULL),
(36, 8, 38, NULL, 'thrndjyhnnfhj', 0, '2018-07-06 12:46:48', '2018-07-06 12:46:48', NULL),
(37, 8, 17, NULL, 'my name is nobita', 0, '2018-07-06 12:49:54', '2018-07-06 12:49:54', NULL),
(38, 8, 23, NULL, 'gugjgyu', 0, '2018-07-06 13:01:20', '2018-07-06 13:01:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `request_by_user_to_agency_for_maid`
--

CREATE TABLE `request_by_user_to_agency_for_maid` (
  `id` bigint(20) NOT NULL,
  `from_user_id` bigint(20) NOT NULL COMMENT '(user_id) from user panel ',
  `to_agency_id` bigint(20) NOT NULL COMMENT 'agency id to which user requesting',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_by_user_to_agency_for_maid`
--

INSERT INTO `request_by_user_to_agency_for_maid` (`id`, `from_user_id`, `to_agency_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, 1, '2018-07-04 08:58:27', '2018-07-04 08:58:27', NULL),
(2, 10, 1, '2018-07-04 10:12:01', '2018-07-04 10:12:01', NULL),
(3, 8, 4, '2018-07-06 13:03:31', '2018-07-06 13:03:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` bigint(20) NOT NULL,
  `name` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'new born baby care', '2018-05-24 05:45:04', '2018-05-24 06:44:06', NULL),
(2, '0-3 year baby care', '2018-05-24 05:45:04', '2018-05-24 06:44:17', NULL),
(3, '4-6 baby care', '2018-05-24 05:45:04', '2018-05-24 06:44:35', NULL),
(4, '7-13 child care', '2018-05-24 05:45:04', '2018-05-24 06:44:35', NULL),
(5, 'i understand child psychology', '2018-05-24 05:45:04', '2018-05-24 06:44:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 181, 'Turkey state1', '2018-06-29 09:14:48', '2018-06-29 09:14:48', NULL),
(2, 181, 'Turkey state2', '2018-06-29 09:15:06', '2018-06-29 09:15:06', NULL),
(3, 181, 'Turkey state3', '2018-06-29 09:15:13', '2018-06-29 09:15:13', NULL),
(4, 181, 'Turkey state4', '2018-06-29 09:15:20', '2018-06-29 09:15:20', NULL),
(5, 87, 'India state1', '2018-06-29 09:34:15', '2018-06-29 09:34:15', NULL),
(6, 87, 'India state2', '2018-06-29 09:34:24', '2018-06-29 09:34:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suggest_maid_by_agency_to_user`
--

CREATE TABLE `suggest_maid_by_agency_to_user` (
  `id` int(11) NOT NULL,
  `agency_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `maid_id` bigint(20) NOT NULL,
  `job_id` bigint(20) NOT NULL,
  `reason_to_suggest` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suggest_maid_by_agency_to_user`
--

INSERT INTO `suggest_maid_by_agency_to_user` (`id`, `agency_id`, `user_id`, `maid_id`, `job_id`, `reason_to_suggest`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 10, 6, 1, 'reason_to_suggest', '2018-07-05 13:39:00', '2018-07-05 13:39:00', NULL),
(2, 1, 10, 9, 3, 'Hjgfhfgjfghjhfgjhgjgh', '2018-07-05 15:09:31', '2018-07-05 15:09:31', NULL),
(3, 1, 10, 12, 3, 'Fdfsdfsdfsdf', '2018-07-06 12:46:18', '2018-07-06 12:46:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_verified` bigint(20) NOT NULL DEFAULT '0' COMMENT 'verified 1 , not-verified 0',
  `complete_profile` bigint(20) NOT NULL DEFAULT '0' COMMENT 'completed 1 , notcompleted 0',
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'active 1 , 0 passive',
  `user_type` bigint(20) NOT NULL COMMENT 'user 1 , maid 2 , provider 3',
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_type` bigint(20) NOT NULL COMMENT 'android 1 , ios 2',
  `notification_status` bigint(20) NOT NULL DEFAULT '1' COMMENT ' off 0 , on 1',
  `photo_email_status` bigint(20) NOT NULL DEFAULT '1' COMMENT ' hide-from-other 0 , show-to-all 1',
  `country_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hi_job` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorised_person` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_administration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `step_for_maid_profile` bigint(20) NOT NULL DEFAULT '0',
  `work_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `driving_licence` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smoke` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alcohol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `can_live_with_family` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `travel_situation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expected_fees` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maid_education` text COLLATE utf8mb4_unicode_ci,
  `maid_certificate` text COLLATE utf8mb4_unicode_ci,
  `maid_about_me` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_text` text COLLATE utf8mb4_unicode_ci,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maid_work_experience` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `country_code`, `mobile`, `email`, `dob`, `gender`, `password`, `otp`, `otp_verified`, `complete_profile`, `status`, `user_type`, `device_token`, `device_type`, `notification_status`, `photo_email_status`, `country_id`, `city_id`, `state_id`, `district`, `nationality_id`, `marital_status`, `kids`, `hi_job`, `company_name`, `authorised_person`, `tax_administration`, `tax_no`, `company_phone`, `step_for_maid_profile`, `work_status`, `driving_licence`, `smoke`, `alcohol`, `can_live_with_family`, `travel_situation`, `expected_fees`, `maid_education`, `maid_certificate`, `maid_about_me`, `remember_token`, `location_text`, `latitude`, `longitude`, `maid_work_experience`, `address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'abhishek', '+91', '55555', 'a@a.com', NULL, NULL, '$2y$10$tbaXPoM1arrxxALufGZNi.MfKBXucPHrNOzXiMISolN4J2hjzp/Lq', '', 1, 1, '1', 3, '2154545156we14r651g65e1rg651er', 2, 1, 1, 181, NULL, 2, NULL, NULL, NULL, NULL, NULL, 'jhgfds', 'spartan', 'dfgdfgdfg', 'dfgfgdf', 'dfgdfgfdg', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Sector 38 Sector 38 Greater Noida', '28.46', '77.57', NULL, 'abhishek', '2018-06-29 16:08:22', '2018-07-06 19:47:36', NULL),
(2, 'agency', '+91', '8881438090', 'agenciii@gmail.com', NULL, NULL, '$2y$10$Unx8cB95WTftfSXUqAdTquClpy9Anuj5VI0iZ5IJwId/Jlby8DaL6', '7143', 0, 0, '1', 3, '12515215165165165', 1, 1, 1, 181, NULL, 2, NULL, NULL, NULL, NULL, NULL, 'fluper1', 'authorised_person1', 'tax_administration1', 'tax_no1', 'company_phone21', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7a7e27d0c515ec75d69eab7cd76c3095', NULL, NULL, NULL, NULL, 'address11', '2018-06-29 16:13:21', '2018-07-05 06:51:36', NULL),
(3, 'abhishek', '+91', '555555', 'agenciii@gmail.com', NULL, NULL, '$2y$10$vg5U6YAK1otk19cAwSeHEejtfJO/NsoM.hmnpJagptpG4Zp1QJLEG', '', 1, 0, '1', 3, '12515215165165165', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6bdf85f2e766587c02730e081c84f4b0', NULL, NULL, NULL, NULL, NULL, '2018-06-29 16:17:29', '2018-06-29 16:18:19', NULL),
(4, 'Sam Billings', '91', '83838383', 'sambhatia66@gmail.com', NULL, NULL, '$2y$10$Z8PeX0ZAnNEkBFwVxw0hLe0TH/0G4YMLppRDVFoZ1eyMl5tZctEKy', '', 1, 1, '1', 3, 'dJIpG3aH7Dc:APA91bFNB6gZfzEkDMy3-kCBOUd0KFD5ENvBeyuZLb_dYlQ_pmSX2K5dctlLlW8iXv2HGAsMiGqJUHiWdbrw6lG3Or-Wm_GG0eks1doLUCkSU3wOgJd3QLxD07F5wCag3E6EthH4PXErh45CIjMDFJcSMaifgDb3bw', 1, 1, 1, 87, NULL, 5, NULL, NULL, NULL, NULL, NULL, 'Fluper Limited', 'Jyotsana Mishra', 'Delhi', '858285552', '9999999999', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'C-142, Sector 63, Noida- 201301', '28.614514', '77.386707', NULL, 'C-142 Noida', '2018-06-29 16:18:08', '2018-07-06 13:10:05', NULL),
(5, 'user', '+91', '8881438096', 'user@gmail.com', '1992-05-15', 'female', '$2y$10$Xcamwi66TUjfYmOJ23aj4OuvNUZYmtdyPjzDXUZB26SuGaaR8/JN.', '1371', 0, 1, '1', 1, '12515215165165165', 1, 0, 0, 181, NULL, 2, NULL, NULL, 'double', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0997ac6619ffeb761dee851d67fc51cf', NULL, NULL, NULL, NULL, NULL, '2018-06-29 16:22:21', '2018-07-02 18:56:11', NULL),
(6, 'maid', '+91', '8881438096', 'maid@gmail.com', '1994-05-24', 'female', '$2y$10$Uja64zg467NDy6F2b.tgwefWMr66bpoz55b/YClnX85ST7ITSVQMm', '5840', 0, 1, '1', 2, '12515215165165165', 1, 1, 1, 181, NULL, 1, NULL, '2', 'double', 'kids', 'hi_job', NULL, NULL, NULL, NULL, NULL, 5, 'work_status', 'driving_licence', 'smoke', 'alcohol', 'yes', 'no matter', '20000', NULL, NULL, NULL, '9319869791f59cd5ba1ff4c37bbc3a88', NULL, NULL, NULL, NULL, NULL, '2018-06-29 16:23:52', '2018-07-04 19:50:42', NULL),
(7, 'jhgfdsjhgf', '+91', '11111', 'a@a.com', NULL, NULL, '$2y$10$snXuDjpk2O27SkVWk2rKh.TCRIBrxWPqDLGda1dqEpnD6LBCWii1m', '', 1, 1, '1', 3, '2154545156we14r651g65e1rg651er', 2, 1, 1, 181, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Jhgfds', 'Uytrew', 'Hgfd', '6543654', '65432', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Sarojini Nagar Sarojini Nagar New Delhi', '28.57', '77.2', NULL, 'Hgfd', '2018-06-29 16:32:46', '2018-06-29 17:03:29', NULL),
(8, 'John Doe', '91', '3333333', 'sambhatia7777@gmail.com', '1996-07-01', 'male', '$2y$10$MMAWiUCTlbPtaixbiHoVEu1KoHOk9QOUkwygLE47s/VKpS11bm0ja', '', 1, 1, '1', 1, 'dJIpG3aH7Dc:APA91bFNB6gZfzEkDMy3-kCBOUd0KFD5ENvBeyuZLb_dYlQ_pmSX2K5dctlLlW8iXv2HGAsMiGqJUHiWdbrw6lG3Or-Wm_GG0eks1doLUCkSU3wOgJd3QLxD07F5wCag3E6EthH4PXErh45CIjMDFJcSMaifgDb3bw', 1, 0, 1, 87, NULL, 5, NULL, NULL, 'Unmarried', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '32c6d5cf320ebd6ff67b22902c0eec78', 'Kanpur, Uttar Pradesh, India', '26.449923000000002', '80.3318736', NULL, NULL, '2018-06-29 16:51:12', '2018-07-06 13:53:31', NULL),
(9, 'abhishek maid', '+91', '55555', 'a@a.com', '2009-07-06', 'Male', '$2y$10$m1sZmFsyunokbwB697hIneRbPuWSAfMMFzT.1Gbod620d0YedqAye', '', 1, 1, '1', 2, '2154545156we14r651g65e1rg651er', 2, 1, 1, 87, NULL, 5, NULL, '1', 'Divorced', 'Yes,lives separately', 'Optional', NULL, NULL, NULL, NULL, NULL, 5, 'Not Working', 'Yes,I am not driving', 'I use sometimes', 'I use', 'Yes', 'No', '22', NULL, NULL, NULL, '', 'Von Wielligh Street Johannesburg Johannesburg', '-26.2', '28.05', NULL, NULL, '2018-06-29 17:03:55', '2018-07-06 19:32:01', NULL),
(10, 'ankit user', '+91', '55555', 'a@a.com', '2007-07-06', 'Female', '$2y$10$hXReGBc2c4fqPIBuDecZmegSaGCm67j7w65tI4NXCxS0DTg7J4JhK', '', 1, 1, '1', 1, '2154545156we14r651g65e1rg651er', 2, 0, 0, 181, NULL, 1, NULL, NULL, 'Divorced', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '681ce4efbc4f4458eb2f6bfaeff4ed96', 'Nathu Pura Nathu Pura New Delhi', '28.76', '77.17', NULL, NULL, '2018-06-29 17:11:31', '2018-07-06 19:49:20', NULL),
(11, 'priyanka', '+91', '66666', 'abhi@abhi.com', '2018-06-29', 'male', '$2y$10$4IaSwBIS3iPsRHZfB1owROJiEKVekhwOK.xcOXEu9kwm4p776lxLO', '', 1, 1, '1', 2, '12515215165165165', 2, 1, 1, 181, NULL, 1, NULL, '1', 'Divorced', 'Yes,lives separately', 'Optional', NULL, NULL, NULL, NULL, NULL, 5, 'Not Working', 'No', 'I use', 'I use', 'No', 'No Matter', '54', 'Uytre', 'Hgtrewqh', 'Gfdsah', '', 'Block C Block C New Delhi', '28.56', '77.26', NULL, NULL, '2018-06-29 17:14:11', '2018-07-03 13:07:26', NULL),
(12, 'Rani', '91', '22222222', 'sambhatia@gmail.com', '1964-06-29', 'male', '$2y$10$ZUcHELkov2gelXsPhEcGX.0WWXNLnhzPMQtS5heVppvIkGTlv/ieu', '', 1, 1, '1', 2, 'dJIpG3aH7Dc:APA91bFNB6gZfzEkDMy3-kCBOUd0KFD5ENvBeyuZLb_dYlQ_pmSX2K5dctlLlW8iXv2HGAsMiGqJUHiWdbrw6lG3Or-Wm_GG0eks1doLUCkSU3wOgJd3QLxD07F5wCag3E6EthH4PXErh45CIjMDFJcSMaifgDb3bw', 1, 0, 0, 87, NULL, 5, NULL, '1', 'Single', 'No', 'Yes', NULL, NULL, NULL, NULL, NULL, 5, 'Working', 'Yes, I am Driving', 'I am not use', 'I am not use', 'Yes', 'Yes', '10000 $', 'snnanan', 'nannNN', 'anananan', '', 'B129, Sector 65, Noida- 201301', '28.6124908', '77.3899638', NULL, NULL, '2018-06-29 19:29:16', '2018-07-06 13:53:20', NULL),
(13, 'mudi', '+90', '5328888888', 'hshshshsh@hdhsjdhdjsh.com', '2018-06-29', 'male', '$2y$10$hauBIJwXfcjhsGhzyT23c.fSNPPElZ2C.MPdeJCJO6vvhFqRBUldC', '', 1, 0, '1', 2, '12515215165165165', 2, 1, 1, 181, NULL, 3, NULL, '1', 'Married', 'Yes,lives separately', 'No', NULL, NULL, NULL, NULL, NULL, 1, 'Part Time Working', 'Yes,I am not driving', 'I use sometimes', 'I use', NULL, NULL, NULL, NULL, NULL, NULL, '958212cc9b1b1c9d38ee6ce4fffe283c', NULL, NULL, NULL, NULL, NULL, '2018-06-29 22:20:21', '2018-06-29 22:29:55', NULL),
(14, 'nato', '+91', '5555555555', 'hshshshbssb@bdhdjdjd.com', '2018-06-29', 'female', '$2y$10$rSBS8i90UPe9Cr6QYet7VuBbPCJ23KCDyicNr9E.BH/io.Pq13Z3G', '', 1, 1, '1', 1, '12515215165165165', 2, 1, 0, 181, NULL, 1, NULL, NULL, 'Widow', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Doğaparkı Caddesi 9 Bahçeşehir 1. Kısım Başakşehir', '41.07', '28.69', NULL, NULL, '2018-06-29 22:32:09', '2018-07-04 10:48:52', NULL),
(15, 'hakann', '91', '12345678', 'aaa@bbaa.com', '1987-06-29', 'male', '$2y$10$W/gCdgd98l0jcI/VaYOiLuxUadhj87to2ctPDJSoJ2xZR259kS4lK', '', 1, 1, '1', 1, '123456789', 1, 0, 0, 181, NULL, 1, NULL, NULL, 'Married', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5f1bab830f55d01b63dad420184bc605', '1, Büyükçekmece, null- 34535', '41.018672', '28.5643307', NULL, NULL, '2018-06-29 22:40:51', '2018-07-02 12:30:12', NULL),
(16, 'babasnn', '+91', '51515185181', 'gagahahh@hahshdh.com', NULL, NULL, '$2y$10$V7zOAj7FFk.PzCY69IOLmusa5w0awQ.N/tyzNU4PiqPj/Q/XFQ.iq', '', 1, 0, '1', 2, '12515215165165165', 2, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '34500 Alkent 2000 Büyükçekmece', '41.07', '28.61', NULL, NULL, '2018-07-02 02:55:26', '2018-07-04 11:01:20', NULL),
(17, 'user', '+91', '5555555', 'user@gmail.com', NULL, NULL, '$2y$10$1Db4ql6S2ESOlyVxbsVseOZ8odsX7EesVxTOlrZtaJmU0GHpIuXr.', '6160', 0, 1, '1', 2, '12515215165165165', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'maid_education', 'maid_certificate', 'maid_about_me', '4d1b69ffaaa59bfb302c9677356758cd', NULL, NULL, NULL, NULL, NULL, '2018-07-03 12:52:05', '2018-07-03 12:52:35', NULL),
(18, 'abhishek singh', '+91', '99999', 'a@a.com', NULL, NULL, '$2y$10$L0DwDw3mmhiNb.EaDnqoeeraPOfebOq3d4Kref4itbmXsj2HQzUi2', '6534', 0, 0, '1', 2, '2154545156we14r651g65e1rg651er', 2, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '42d6064e3e8229fdb8f0dd8ea40f9adc', NULL, NULL, NULL, NULL, NULL, '2018-07-03 13:03:16', '2018-07-03 13:07:19', NULL),
(19, 'abhishek', '+91', '99999', 'a@a.com', '2018-07-03', 'male', '$2y$10$hgRh3MadLgaYLxcQSaymaO4uCFqGD7ZgmLi6.T5BGBWcKMcSbcWQq', '', 1, 1, '1', 1, '2154545156we14r651g65e1rg651er', 2, 1, 1, 181, NULL, 1, NULL, NULL, 'Married', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Sarojini Nagar Sarojini Nagar New Delhi', '28.57', '77.2', NULL, NULL, '2018-07-03 13:08:50', '2018-07-03 13:11:37', NULL),
(20, 'abhishek', '+91', '999999', 'a@a.com', '2018-07-03', 'male', '$2y$10$sd.amx6SlYq0UutUGzyHIepgaYB.pc7gQKt04uqGzAn3N4/sAsytq', '', 1, 0, '1', 2, '12515215165165165', 2, 1, 1, 181, NULL, 1, NULL, '4', 'Married', 'Yes,lives separately', 'Optional', NULL, NULL, NULL, NULL, NULL, 4, 'Not Working', 'No', 'I use sometimes', 'I use', 'No', 'No', '765', NULL, NULL, NULL, '5370eac9e73e309d9dfc3c9b164c35ad', NULL, NULL, NULL, NULL, NULL, '2018-07-03 13:11:59', '2018-07-03 13:14:13', NULL),
(21, 'Savita Kumari', '91', '147147', 'Savitak123@gmail.com', '2013-07-05', 'male', '$2y$10$maIVWdrObmmKDH.FDO5A1ezi635HZIplnJPcCWVOte.QGPxd..31i', '', 1, 1, '1', 2, 'dJIpG3aH7Dc:APA91bFNB6gZfzEkDMy3-kCBOUd0KFD5ENvBeyuZLb_dYlQ_pmSX2K5dctlLlW8iXv2HGAsMiGqJUHiWdbrw6lG3Or-Wm_GG0eks1doLUCkSU3wOgJd3QLxD07F5wCag3E6EthH4PXErh45CIjMDFJcSMaifgDb3bw', 1, 0, 0, 87, NULL, 5, NULL, '4', 'Single', 'No', 'No', NULL, NULL, NULL, NULL, NULL, 5, 'Part Time Working', 'Yes, I am Driving', 'I am not use', 'I am not use', 'No', 'No matter', '1000 $', 'BA', 'BA', 'Nothing special about me. I am a common careTaker of babies. I have 1 year of experience in this .', '', 'B129, Sector 65, Noida- 201301', '28.6124981', '77.3899494', NULL, NULL, '2018-07-03 13:27:43', '2018-07-05 13:53:40', NULL),
(22, 'hgfdsa', '+91', '11111', 'a@a.com', NULL, NULL, '$2y$10$I5jB02.FncFiz8Z4ggzJjuue0zoFIe/ItKNADSilwO3lB8TY9FVl2', '', 1, 0, '1', 2, '12515215165165165', 2, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '648656d89ea819563a53cfcf2e8cfbd1', NULL, NULL, NULL, NULL, NULL, '2018-07-03 17:02:05', '2018-07-03 17:02:09', NULL),
(23, 'deepu', '+91', '00000', 'abhishek@a.com', '2018-07-03', 'male', '$2y$10$g2NmAgPmr9ihJYg37fQgZewjj3aSfss8N0T4kcN1JV6LAjnReCP46', '', 1, 0, '1', 2, '12515215165165165', 2, 1, 1, 181, NULL, 1, NULL, '1', 'Married', 'Yes,lives with me', 'No', NULL, NULL, NULL, NULL, NULL, 4, 'Part Time Working', 'No', 'I use sometimes', 'I use', 'No', 'No Matter', '543', NULL, NULL, NULL, '805f3a6b4631a3115866bef8aaffe6fe', NULL, NULL, NULL, NULL, NULL, '2018-07-03 17:30:00', '2018-07-03 17:32:12', NULL),
(24, 'Rama', '91', '136136', 'ram@gmail.com', '2000-07-03', 'male', '$2y$10$l4M4l3DMxGctpPYUO/WqLeesjYcbyNO743OtTv5IYGFdLJ402m3yu', '', 1, 0, '1', 2, '123456789', 1, 1, 1, 87, NULL, 5, NULL, '1', 'Single', 'No', 'Yes', NULL, NULL, NULL, NULL, NULL, 4, 'Working', 'Yes, I am Driving', 'I am not use', 'I am not use', 'Yes', 'Yes', '10000 $', NULL, NULL, NULL, '1a98d393f865cbe1e40fdd59afbe786a', NULL, NULL, NULL, NULL, NULL, '2018-07-03 18:52:28', '2018-07-03 18:54:01', NULL),
(25, 'user', '+91', '55443', 'user@gmail.com', NULL, NULL, '$2y$10$C1da7c6eZSlczy.qgq5IpOw5p2EQMVAZn1ABBUlHXZ5/yC763oh.u', '1694', 0, 0, '1', 1, '12515215165165165', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '59d3712d76a7cc9aee66f87629f22927', NULL, NULL, NULL, NULL, NULL, '2018-07-03 19:01:48', '2018-07-03 19:01:48', NULL),
(26, 'user', '+91', '55443', 'user@gmail.com', NULL, NULL, '$2y$10$GQMmMWHJWyY/2oEvFs2URumV7xxSJ92s4pq/prwjSIuI4RxfY.SsC', '3041', 0, 0, '1', 2, '12515215165165165', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '318916d8419eb2b4ff43b88ee5a32387', NULL, NULL, NULL, NULL, NULL, '2018-07-03 19:01:52', '2018-07-03 19:01:52', NULL),
(27, 'user', '+91', '554433', 'user@gmail.com', NULL, NULL, '$2y$10$hyTclnLaXwQ11okcQf0I0ee6iu9mCVdZ/w1IoUZpAvkSWzpnJBj.2', '4100', 0, 0, '1', 2, '12515215165165165', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0b222beabea010722c36d32e7a880f72', NULL, NULL, NULL, NULL, NULL, '2018-07-03 19:17:17', '2018-07-03 19:17:17', NULL),
(28, 'Ram', '91', '6131648', 'sambhatia7777@gmail.com', NULL, NULL, '$2y$10$eVRs8MZ5oXO38PA8eOl5CuKBhbIa97/oNtMxBmwsvLS7e20ZcKyQW', '', 1, 0, '1', 2, '123456789', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'fd34ba71e9a9f6fb131908ade1ba49bc', NULL, NULL, NULL, NULL, NULL, '2018-07-03 19:30:10', '2018-07-03 19:30:39', NULL),
(29, 'user', '+91', '232323', 'user@gmail.com', NULL, NULL, '$2y$10$/ldP/VuBfQOhkz2jQNlPcejgKL5kb3p.vR/uFqTtZxAsp6yfYCad2', '1502', 0, 0, '1', 1, '12515215165165165', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '72cf2d8bf4aa012c9829be99f0343ddd', NULL, NULL, NULL, NULL, NULL, '2018-07-03 19:37:43', '2018-07-03 19:37:43', NULL),
(30, 'user', '+91', '232323', 'user@gmail.com', NULL, NULL, '$2y$10$GbO3fV08URffrmd68oL5/.N7v8p0ShWy.UvEaIp.5508rchegzaW.', '2293', 0, 0, '1', 2, '12515215165165165', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a4cb4c16a20f7061be8b80cc86ac7395', NULL, NULL, NULL, NULL, NULL, '2018-07-03 19:37:49', '2018-07-03 19:37:49', NULL),
(31, 'user', '+91', '33333', 'user@gmail.com', NULL, NULL, '$2y$10$LJ13BxkrPGwDSYCm6bPZYelyRVAIBoqy1V35B0rnqy2mc7r2BV1BG', '6748', 0, 0, '1', 2, '12515215165165165', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '63d6077b5e55ebc799c0b47617141f37', NULL, NULL, NULL, NULL, NULL, '2018-07-03 19:38:10', '2018-07-03 19:38:10', NULL),
(32, 'user', '+91', '9999999', 'user@gmail.com', NULL, NULL, '$2y$10$BXwg.JzOWzSCzYGkTBPLqeG4Khpbb2C73kMaOauaxZNtOq/VWsWSK', '5206', 0, 0, '1', 2, '12515215165165165', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cd2e4469ac49e99c3be8c66b4a186144', NULL, NULL, NULL, NULL, NULL, '2018-07-04 10:41:29', '2018-07-04 10:41:29', NULL),
(33, 'user', '+91', '88814380961', 'user@gmail.com', NULL, NULL, '$2y$10$4lNTycFsZSN/dR5FBQAZreci/TfpR9Beh0TFErdNh45PByV/UAozO', '2732', 0, 0, '1', 1, '12515215165165165', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '53dd9a1f14165cf83f05412663d83224', NULL, NULL, NULL, NULL, NULL, '2018-07-04 10:47:54', '2018-07-04 10:47:54', NULL),
(34, 'user', '+91', '88814380961', 'user@gmail.com', NULL, NULL, '$2y$10$.fR0s65W6HIxlaCtZDr/yeV0t3BmwBvhZtqvEPp8mQZKd3HncUZE.', '1884', 0, 1, '1', 2, '12515215165165165', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'maid_education', 'maid_certificate', 'maid_about_me', '5394c929812e541488d323d80a6d183b', NULL, NULL, NULL, NULL, NULL, '2018-07-04 10:48:05', '2018-07-04 10:48:35', NULL),
(35, 'sakshi', '+91', '888888', 'a@a.com', '2018-07-04', 'male', '$2y$10$3IWFN9lBYNLgCj1S6ZzG8ONpvSxd4TwmByWVLw3cRSgUN.akfDHjS', '', 1, 1, '1', 2, '2154545156we14r651g65e1rg651er', 2, 1, 1, 181, NULL, 1, NULL, '2', 'Divorced', 'Yes,lives separately', 'No', NULL, NULL, NULL, NULL, NULL, 5, 'Part Time Working', 'Yes,I am not driving', 'I use sometimes', 'I use sometimes', 'No', 'No Matter', '54', 'Uyhgtrewj', 'Hgfdsa', 'Jhgfdsa', '338fb9c8f47d189442b842cb6335f669', NULL, NULL, NULL, NULL, NULL, '2018-07-04 10:54:33', '2018-07-04 14:19:01', NULL),
(36, 'user', '+91', '8881438098', 'user@gmail.com', NULL, NULL, '$2y$10$TmDEocgeRz/ESbkhHyZGdOkyIBH8OeO08CBmUbxlIBFKjX6D/3r.i', '5841', 0, 1, '1', 2, '12515215165165165', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'maid_education', 'maid_certificate', 'maid_about_me', 'b67e03059fa07adb1933c495ee41cae2', NULL, NULL, NULL, NULL, NULL, '2018-07-04 11:38:23', '2018-07-04 11:40:33', NULL),
(37, 'Robert', '91', '808080', 'RobertNice@gmail.com', '1998-07-04', 'male', '$2y$10$hUrBUJMPjjjdPheSWA8LmuEjvgQUssUjQYGZkK.3haRuj27NJYlIu', '', 1, 1, '1', 2, 'dJIpG3aH7Dc:APA91bFNB6gZfzEkDMy3-kCBOUd0KFD5ENvBeyuZLb_dYlQ_pmSX2K5dctlLlW8iXv2HGAsMiGqJUHiWdbrw6lG3Or-Wm_GG0eks1doLUCkSU3wOgJd3QLxD07F5wCag3E6EthH4PXErh45CIjMDFJcSMaifgDb3bw', 1, 0, 0, 87, NULL, 5, NULL, '1', 'Single', 'No', 'Yes', NULL, NULL, NULL, NULL, NULL, 5, 'Working', 'Yes, I am Driving', 'I am not use', 'I am not use', 'Yes', 'No matter', '10000 $', 'BA', 'BA', 'BA', '', 'C-142, Sector 63, Noida- 201301', '28.6145429', '77.3866917', NULL, NULL, '2018-07-04 11:42:06', '2018-07-04 07:50:22', NULL),
(38, 'abhishek yadav', '+91', '676767', 'a@a.com', '2018-07-04', 'male', '$2y$10$icYstEhlaWvHPulAY1kZW.f6ckDMhhTIw0KGE09z9YBaXx3GomBXm', '', 1, 1, '1', 2, '12515215165165165', 2, 1, 1, 181, NULL, 1, NULL, '1', 'Living Separately', 'Yes,lives with me', 'Optional', NULL, NULL, NULL, NULL, NULL, 5, 'Not Working', 'No', 'I use', 'I use sometimes', 'No', 'No Matter', '445', 'Iuytrew', 'Uytrewq', 'Iuytrewq', '', 'Sarojini Nagar Sarojini Nagar New Delhi', '28.57', '77.2', NULL, NULL, '2018-07-04 14:23:27', '2018-07-04 14:26:59', NULL),
(39, 'Winni Albert Seikh', '91', '0123456789', 'winniealbert6262@gmail.com', '2006-07-05', 'male', '$2y$10$3fGYVeDHqC2wCKdUXg9Whe0ISxozViU5McgV72q/18ocPsTHctI3u', '', 1, 1, '1', 2, '123456789', 1, 0, 0, 87, NULL, 5, NULL, '1', 'Single', 'No', 'Yes', NULL, NULL, NULL, NULL, NULL, 5, 'Working', 'Yes, I am Driving', 'I am not use', 'I am not use', 'Yes', 'Yes', '10000 $', 'faxscwxc', 'dd', 'fccx', '', 'B129, Sector 65, Noida- 201301', '28.6124982', '77.3899497', NULL, NULL, '2018-07-05 11:34:47', '2018-07-05 06:37:42', NULL),
(40, 'Keily', '91', '2555555', 'sambhatia7777@gmail.com', '2017-07-05', 'male', '$2y$10$o.kLY1UWgpPesl/L08r/be1okjhz4NCy4HY/7squ32P/YhZaMvcs6', '', 1, 1, '1', 2, '123456789', 1, 0, 0, 87, NULL, 5, NULL, '2', 'Single', 'No', 'Yes', NULL, NULL, NULL, NULL, NULL, 5, 'Working', 'Yes, I am Driving', 'I am not use', 'I am not use', 'Yes', 'Yes', '10000 $', 'sfcssc', 'dgssf', 'rgaffsf', '', 'B129, Sector 65, Noida- 201301', '28.6124981', '77.3899489', NULL, NULL, '2018-07-05 12:25:28', '2018-07-05 07:05:33', NULL),
(41, 'Jsjajakks', '91', '34346494', 'hshahajaj@jzsj.xk', NULL, NULL, '$2y$10$GSOsv8HrOwGqQn4DTClqYe/wBjk6En0UT65wj0JhscaZWpPHXSuYK', '', 1, 0, '1', 1, '123456789', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8703a36a2567838777eec7a3e96b9936', NULL, NULL, NULL, NULL, NULL, '2018-07-05 12:36:13', '2018-07-05 12:36:21', NULL),
(42, 'Hshahwh', '91', '754584', 'sambhatia66@gmail.com', NULL, NULL, '$2y$10$hGsODYtvQJKED.QpbDwyDeB9PrpTKcju8IzIbBXNvnggkfxwpPxZC', '', 1, 0, '1', 1, '123456789', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'da1e5b1aa90480e3ab072fcba06b87d2', NULL, NULL, NULL, NULL, NULL, '2018-07-05 12:37:51', '2018-07-05 12:37:58', NULL),
(43, 'Babahw', '91', '123456', 'sambhatia7777@gmail.com', '2008-07-05', 'male', '$2y$10$RA4m.zeKY7dAg/eBV65yQO4kSzhFbkl9yxxbLDA0g6WhIUj3l8sWG', '', 1, 1, '1', 1, '123456789', 1, 0, 0, 87, NULL, 6, NULL, NULL, 'Unmarried', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'B129, Sector 65, Noida- 201301', '28.6124885', '77.3899371', NULL, NULL, '2018-07-05 12:39:27', '2018-07-05 07:16:02', NULL),
(44, 'Mgrdfr', '91', '987654321', 'sda@ddf.jb', '2007-07-05', 'male', '$2y$10$q./liGzjqvTqFrdgJH5vf.PzI75VE6gp5Ts4.PWeK3E5D7OJ1g/zS', '', 1, 1, '1', 1, '123456789', 1, 0, 0, 87, NULL, 5, NULL, NULL, 'Unmarried', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'C-142, Sector 63, Noida- 201301', '28.6143686', '77.3867296', NULL, NULL, '2018-07-05 12:46:42', '2018-07-05 07:31:46', NULL),
(53, 'add_maid_by_agency', '+91', '8410107875', 'add_maid_by_agency@gmail.com', NULL, NULL, '$2y$10$IL1vXl4oUJ59A8OCueoG.e4okuFURLaBfI87sGFb15l79MEImz7HK', NULL, 0, 0, '1', 2, '12515215165165165', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3c19b0ac0317259253a49aa774030116', NULL, NULL, NULL, NULL, NULL, '2018-07-06 13:51:55', '2018-07-06 13:51:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_educations`
--

CREATE TABLE `user_educations` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `education_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_educations`
--

INSERT INTO `user_educations` (`id`, `user_id`, `education_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 9, 2, '2018-06-29 17:07:04', '2018-07-06 19:31:17', NULL),
(2, 9, 1, '2018-06-29 17:07:04', '2018-07-06 19:31:17', NULL),
(3, 11, 1, '2018-06-29 17:15:26', '2018-06-29 17:15:26', NULL),
(4, 12, 2, '2018-06-29 19:33:54', '2018-06-29 19:33:54', NULL),
(5, 12, 3, '2018-06-29 19:33:54', '2018-06-29 19:33:54', NULL),
(6, 13, 1, '2018-06-29 22:24:45', '2018-06-29 22:24:45', NULL),
(7, 20, 2, '2018-07-03 13:13:23', '2018-07-03 13:13:23', NULL),
(8, 20, 1, '2018-07-03 13:13:23', '2018-07-03 13:13:23', NULL),
(9, 21, 2, '2018-07-03 13:28:54', '2018-07-03 13:28:54', NULL),
(10, 21, 3, '2018-07-03 13:28:54', '2018-07-03 13:28:54', NULL),
(11, 23, 1, '2018-07-03 17:31:24', '2018-07-03 17:31:24', NULL),
(12, 24, 1, '2018-07-03 18:53:18', '2018-07-03 18:53:18', NULL),
(13, 35, 2, '2018-07-04 11:01:06', '2018-07-04 11:01:06', NULL),
(14, 35, 1, '2018-07-04 11:01:06', '2018-07-04 11:01:06', NULL),
(15, 37, 2, '2018-07-04 11:45:26', '2018-07-04 11:45:26', NULL),
(16, 37, 3, '2018-07-04 12:48:42', '2018-07-04 12:48:42', NULL),
(17, 38, 3, '2018-07-04 14:24:51', '2018-07-04 14:24:51', NULL),
(18, 38, 2, '2018-07-04 14:24:51', '2018-07-04 14:24:51', NULL),
(19, 6, 1, '2018-07-04 19:32:09', '2018-07-05 14:14:02', NULL),
(20, 6, 2, '2018-07-04 19:32:09', '2018-07-05 14:14:02', NULL),
(21, 6, 3, '2018-07-04 19:32:33', '2018-07-04 19:34:23', '2018-07-04 19:34:23'),
(22, 39, 2, '2018-07-05 11:41:17', '2018-07-05 11:41:17', NULL),
(23, 39, 3, '2018-07-05 11:41:17', '2018-07-05 11:41:17', NULL),
(24, 40, 4, '2018-07-05 12:28:28', '2018-07-05 12:28:28', NULL),
(25, 40, 3, '2018-07-05 12:28:28', '2018-07-05 12:28:28', NULL),
(26, 40, 2, '2018-07-05 12:28:28', '2018-07-05 12:28:28', NULL),
(27, 40, 1, '2018-07-05 12:28:28', '2018-07-05 12:28:28', NULL),
(28, 9, 3, '2018-07-05 14:19:15', '2018-07-06 19:31:17', '2018-07-06 19:31:17'),
(29, 21, 4, '2018-07-05 19:09:25', '2018-07-05 19:09:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_favourite`
--

CREATE TABLE `user_favourite` (
  `id` int(11) NOT NULL,
  `to_maid_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_favourite`
--

INSERT INTO `user_favourite` (`id`, `to_maid_id`, `from_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 8, '2018-06-29 12:03:57', '2018-07-03 07:55:41', '2018-07-03 07:55:41'),
(2, 12, 14, '2018-06-29 17:11:18', '2018-06-29 17:11:18', NULL),
(3, 37, 8, '2018-07-04 11:05:18', '2018-07-05 06:43:32', '2018-07-05 06:43:32'),
(4, 12, 8, '2018-07-04 11:05:34', '2018-07-06 13:00:17', '2018-07-06 13:00:17'),
(5, 24, 8, '2018-07-04 11:05:37', '2018-07-04 11:05:37', NULL),
(6, 28, 8, '2018-07-04 11:05:40', '2018-07-04 11:05:40', NULL),
(7, 20, 8, '2018-07-04 11:06:05', '2018-07-05 06:43:28', '2018-07-05 06:43:28'),
(8, 16, 8, '2018-07-04 11:06:06', '2018-07-04 11:06:06', NULL),
(9, 35, 8, '2018-07-04 13:41:18', '2018-07-04 13:41:18', NULL),
(10, 39, 8, '2018-07-05 06:39:20', '2018-07-06 13:00:12', '2018-07-06 13:00:12'),
(11, 24, 43, '2018-07-05 07:13:33', '2018-07-05 07:13:33', NULL),
(12, 16, 43, '2018-07-05 07:13:37', '2018-07-05 07:13:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_hired_maid`
--

CREATE TABLE `user_hired_maid` (
  `id` int(11) NOT NULL,
  `hire_by` int(11) NOT NULL,
  `hire_to` int(11) NOT NULL,
  `completed_status` int(11) NOT NULL DEFAULT '0' COMMENT 'if maid completed task of user then 1 else 0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_hired_maid`
--

INSERT INTO `user_hired_maid` (`id`, `hire_by`, `hire_to`, `completed_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 8, 9, 1, '2018-06-29 11:40:06', '2018-07-04 13:33:51', NULL),
(2, 8, 11, 1, '2018-06-29 11:46:33', '2018-07-04 12:49:25', NULL),
(3, 10, 6, 1, '2018-06-29 13:26:28', '2018-07-04 11:04:33', NULL),
(4, 14, 13, 0, '2018-06-29 17:10:04', '2018-06-29 17:10:04', NULL),
(5, 19, 18, 0, '2018-07-03 07:41:12', '2018-07-03 07:41:12', NULL),
(6, 10, 21, 1, '2018-07-03 11:03:45', '2018-07-04 11:49:27', NULL),
(8, 8, 38, 1, '2018-07-04 13:29:38', '2018-07-06 12:45:05', NULL),
(9, 8, 37, 1, '2018-07-04 13:30:23', '2018-07-06 12:46:01', NULL),
(10, 10, 36, 1, '2018-07-04 13:34:08', '2018-07-04 13:35:03', NULL),
(11, 8, 39, 1, '2018-07-05 06:40:11', '2018-07-05 06:41:47', NULL),
(12, 8, 34, 1, '2018-07-05 06:42:13', '2018-07-06 12:40:10', NULL),
(13, 8, 17, 1, '2018-07-05 06:42:23', '2018-07-06 12:41:40', NULL),
(14, 43, 40, 0, '2018-07-05 07:13:19', '2018-07-05 07:13:19', NULL),
(15, 44, 35, 0, '2018-07-05 07:30:38', '2018-07-05 07:30:38', NULL),
(16, 4, 31, 0, '2018-07-05 10:11:27', '2018-07-05 10:11:27', NULL),
(18, 10, 28, 1, '2018-07-06 10:24:08', '2018-07-06 10:31:40', NULL),
(19, 10, 32, 1, '2018-07-06 11:38:45', '2018-07-06 12:07:53', NULL),
(20, 10, 26, 1, '2018-07-06 12:04:56', '2018-07-06 12:05:30', NULL),
(21, 10, 20, 1, '2018-07-06 12:15:13', '2018-07-06 12:27:52', NULL),
(22, 10, 16, 1, '2018-07-06 12:19:37', '2018-07-06 12:19:55', NULL),
(23, 10, 22, 1, '2018-07-06 12:31:01', '2018-07-06 12:31:15', NULL),
(24, 8, 23, 1, '2018-07-06 12:40:46', '2018-07-06 12:45:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_images`
--

CREATE TABLE `user_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1 free , 2 paid',
  `status_by_admin` bigint(20) NOT NULL COMMENT '0 not-verified , 1 verified-by-admin',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_images`
--

INSERT INTO `user_images` (`id`, `user_id`, `image`, `type`, `status_by_admin`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, '_0_1530269519_1530169360988.jpg', 1, 0, '2018-06-29 16:20:00', '2018-06-29 16:21:59', NULL),
(2, 5, '_0_1530269610_12F8N.jpg', 1, 0, '2018-06-29 16:23:30', '2018-06-29 16:23:30', NULL),
(3, 7, '_0_1530270207_1530270205.jpeg', 1, 0, '2018-06-29 16:33:27', '2018-06-29 16:33:27', NULL),
(4, 9, '_0_1530272054_1530272053.jpeg', 1, 0, '2018-06-29 17:04:14', '2018-06-29 17:04:14', NULL),
(5, 8, '_0_1530272218_1530169360988.jpg', 1, 0, '2018-06-29 17:06:58', '2018-06-29 17:06:58', NULL),
(6, 1, '_0_1530272425_1530272423.jpeg', 1, 0, '2018-06-29 17:10:25', '2018-06-29 17:10:25', NULL),
(7, 10, '_0_1530272524_1530272522.jpeg', 1, 0, '2018-06-29 17:12:04', '2018-06-29 17:12:04', NULL),
(8, 11, '_0_1530272664_1530272663.jpeg', 1, 0, '2018-06-29 17:14:24', '2018-06-29 17:14:24', NULL),
(9, 12, '_0_1530280783_IMG-20180629-WA0001.jpg', 1, 0, '2018-06-29 19:29:43', '2018-06-29 19:29:43', NULL),
(10, 13, '_0_1530291595_1530291594.jpeg', 1, 0, '2018-06-29 22:21:09', '2018-06-29 22:29:55', NULL),
(11, 14, '_0_1530292033_1530292032.jpeg', 1, 0, '2018-06-29 22:37:13', '2018-06-29 22:37:13', NULL),
(12, 15, '_0_1530292295_IMG-20180629-WA0026.jpg', 1, 0, '2018-06-29 22:41:35', '2018-06-29 22:41:35', NULL),
(13, 16, '_0_1530480427_1530480426.jpeg', 1, 0, '2018-07-02 02:57:01', '2018-07-02 02:57:07', NULL),
(14, 19, '_0_1530603615_1530603614.jpeg', 1, 0, '2018-07-03 13:10:15', '2018-07-03 13:10:15', NULL),
(15, 20, '_0_1530603739_1530603738.jpeg', 1, 0, '2018-07-03 13:12:19', '2018-07-03 13:12:19', NULL),
(16, 21, '_0_1530797918_13513510656_14.jpg', 1, 0, '2018-07-03 13:28:07', '2018-07-05 19:08:39', NULL),
(17, 23, '_0_1530619221_1530619220.jpeg', 1, 0, '2018-07-03 17:30:21', '2018-07-03 17:30:21', NULL),
(18, 24, '_0_1530624167_0o131uD-minions-wallpaper.jpg', 1, 0, '2018-07-03 18:52:47', '2018-07-03 18:52:47', NULL),
(19, 28, '_0_1530626439_0o131uD-minions-wallpaper.jpg', 1, 0, '2018-07-03 19:30:39', '2018-07-03 19:30:39', NULL),
(20, 35, '_0_1530694031_1530694028.jpeg', 1, 0, '2018-07-04 10:56:10', '2018-07-04 14:17:11', NULL),
(21, 37, '_0_1530688685_0o131uD-minions-wallpaper.jpg', 1, 0, '2018-07-04 11:42:55', '2018-07-04 12:48:05', NULL),
(22, 38, '_0_1530694433_1530694431.jpeg', 1, 0, '2018-07-04 14:23:53', '2018-07-04 14:23:53', NULL),
(23, 39, '_0_1530770857_ds_x_e_tense_concept_car_4k.jpg', 1, 0, '2018-07-05 11:37:38', '2018-07-05 11:37:38', NULL),
(24, 40, '_0_1530773867_13513510656_14.jpg', 1, 0, '2018-07-05 12:27:47', '2018-07-05 12:27:47', NULL),
(26, 44, '_0_1530775161_251038.jpg', 1, 0, '2018-07-05 12:49:22', '2018-07-05 12:49:22', NULL),
(27, 53, '_0_1530885115_Screenshot from 2017-05-02 18-37-34.png', 1, 0, '2018-07-06 13:51:55', '2018-07-06 13:51:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_languages`
--

CREATE TABLE `user_languages` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `language_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_languages`
--

INSERT INTO `user_languages` (`id`, `user_id`, `language_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 9, 1, '2018-06-29 17:07:04', '2018-07-05 14:19:15', '2018-07-05 14:19:15'),
(2, 11, 1, '2018-06-29 17:15:26', '2018-06-29 17:15:26', NULL),
(3, 12, 2, '2018-06-29 19:33:54', '2018-06-29 19:33:54', NULL),
(4, 12, 3, '2018-06-29 19:33:54', '2018-06-29 19:33:54', NULL),
(5, 13, 2, '2018-06-29 22:24:45', '2018-06-29 22:24:45', NULL),
(6, 20, 3, '2018-07-03 13:13:23', '2018-07-03 13:13:23', NULL),
(7, 20, 2, '2018-07-03 13:13:23', '2018-07-03 13:13:23', NULL),
(8, 21, 3, '2018-07-03 13:28:54', '2018-07-03 13:28:54', NULL),
(9, 21, 2, '2018-07-03 14:45:51', '2018-07-03 14:45:51', NULL),
(10, 23, 2, '2018-07-03 17:31:24', '2018-07-03 17:31:24', NULL),
(11, 23, 1, '2018-07-03 17:31:24', '2018-07-03 17:31:24', NULL),
(12, 24, 3, '2018-07-03 18:53:18', '2018-07-03 18:53:18', NULL),
(13, 24, 2, '2018-07-03 18:53:18', '2018-07-03 18:53:18', NULL),
(14, 35, 2, '2018-07-04 11:01:06', '2018-07-04 11:01:06', NULL),
(15, 35, 1, '2018-07-04 11:01:06', '2018-07-04 11:01:06', NULL),
(16, 37, 3, '2018-07-04 11:45:26', '2018-07-04 11:45:26', NULL),
(17, 37, 2, '2018-07-04 12:48:42', '2018-07-04 12:48:42', NULL),
(18, 38, 1, '2018-07-04 14:24:51', '2018-07-04 14:24:51', NULL),
(19, 6, 1, '2018-07-04 19:38:42', '2018-07-05 14:14:02', NULL),
(20, 6, 2, '2018-07-04 19:38:42', '2018-07-05 14:14:02', NULL),
(21, 6, 3, '2018-07-04 19:39:19', '2018-07-04 19:51:24', '2018-07-04 19:51:24'),
(22, 39, 3, '2018-07-05 11:41:17', '2018-07-05 11:41:17', NULL),
(23, 39, 2, '2018-07-05 11:41:17', '2018-07-05 11:41:17', NULL),
(24, 39, 1, '2018-07-05 11:41:17', '2018-07-05 11:41:17', NULL),
(25, 40, 2, '2018-07-05 12:28:28', '2018-07-05 12:28:28', NULL),
(26, 40, 3, '2018-07-05 12:28:28', '2018-07-05 12:28:28', NULL),
(27, 40, 4, '2018-07-05 12:28:28', '2018-07-05 12:28:28', NULL),
(28, 9, 3, '2018-07-05 14:19:15', '2018-07-06 19:31:17', NULL),
(29, 9, 2, '2018-07-05 14:19:15', '2018-07-06 19:31:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_pet_problems`
--

CREATE TABLE `user_pet_problems` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `pet_problem_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_pet_problems`
--

INSERT INTO `user_pet_problems` (`id`, `user_id`, `pet_problem_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 9, 2, '2018-06-29 17:07:04', '2018-07-06 19:31:17', '2018-07-06 19:31:17'),
(2, 9, 1, '2018-06-29 17:07:04', '2018-07-06 19:31:17', NULL),
(3, 11, 2, '2018-06-29 17:15:26', '2018-06-29 17:15:26', NULL),
(4, 11, 1, '2018-06-29 17:15:26', '2018-06-29 17:15:26', NULL),
(5, 12, 2, '2018-06-29 19:33:54', '2018-06-29 19:33:54', NULL),
(6, 12, 3, '2018-06-29 19:33:54', '2018-06-29 19:33:54', NULL),
(7, 13, 3, '2018-06-29 22:24:45', '2018-06-29 22:24:45', NULL),
(8, 13, 2, '2018-06-29 22:24:45', '2018-06-29 22:24:45', NULL),
(9, 13, 1, '2018-06-29 22:24:45', '2018-06-29 22:24:45', NULL),
(10, 20, 1, '2018-07-03 13:13:23', '2018-07-03 13:13:23', NULL),
(11, 21, 2, '2018-07-03 13:28:54', '2018-07-03 13:28:54', NULL),
(12, 23, 2, '2018-07-03 17:31:24', '2018-07-03 17:31:24', NULL),
(13, 23, 1, '2018-07-03 17:31:24', '2018-07-03 17:31:24', NULL),
(14, 21, 3, '2018-07-03 17:49:24', '2018-07-03 17:49:24', NULL),
(15, 24, 4, '2018-07-03 18:53:18', '2018-07-03 18:53:18', NULL),
(16, 24, 3, '2018-07-03 18:53:18', '2018-07-03 18:53:18', NULL),
(17, 35, 3, '2018-07-04 11:01:06', '2018-07-04 11:01:06', NULL),
(18, 35, 2, '2018-07-04 11:01:06', '2018-07-04 11:01:06', NULL),
(19, 35, 1, '2018-07-04 11:01:06', '2018-07-04 11:01:06', NULL),
(20, 37, 3, '2018-07-04 11:45:26', '2018-07-04 11:45:26', NULL),
(21, 37, 2, '2018-07-04 11:45:26', '2018-07-04 11:45:26', NULL),
(22, 38, 2, '2018-07-04 14:24:51', '2018-07-04 14:24:51', NULL),
(23, 38, 1, '2018-07-04 14:24:51', '2018-07-04 14:24:51', NULL),
(24, 6, 1, '2018-07-04 19:41:29', '2018-07-05 14:14:02', NULL),
(25, 6, 2, '2018-07-04 19:41:29', '2018-07-05 14:14:02', NULL),
(26, 6, 3, '2018-07-04 19:42:12', '2018-07-04 19:42:31', '2018-07-04 19:42:31'),
(27, 39, 4, '2018-07-05 11:41:17', '2018-07-05 11:41:17', NULL),
(28, 39, 3, '2018-07-05 11:41:17', '2018-07-05 11:41:17', NULL),
(29, 39, 2, '2018-07-05 11:41:17', '2018-07-05 11:41:17', NULL),
(30, 39, 1, '2018-07-05 11:41:17', '2018-07-05 11:41:17', NULL),
(31, 40, 4, '2018-07-05 12:28:28', '2018-07-05 12:28:28', NULL),
(32, 40, 3, '2018-07-05 12:28:28', '2018-07-05 12:28:28', NULL),
(33, 40, 2, '2018-07-05 12:28:28', '2018-07-05 12:28:28', NULL),
(34, 9, 3, '2018-07-05 14:19:15', '2018-07-06 19:31:17', '2018-07-06 19:31:17'),
(35, 21, 4, '2018-07-05 19:09:25', '2018-07-05 19:09:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `working_styles`
--

CREATE TABLE `working_styles` (
  `id` bigint(20) NOT NULL,
  `name` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `working_styles`
--

INSERT INTO `working_styles` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'full day', '2018-05-24 05:45:04', '2018-05-24 06:34:37', NULL),
(2, 'some days', '2018-05-24 05:45:04', '2018-05-24 06:34:55', NULL),
(3, 'part time', '2018-05-24 05:45:04', '2018-05-24 06:34:58', NULL),
(4, 'full day1', '2018-07-02 06:06:06', '2018-07-02 06:06:06', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `district_id` (`state_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state_id` (`state_id`);

--
-- Indexes for table `educations`
--
ALTER TABLE `educations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_choices`
--
ALTER TABLE `job_choices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_listing_title`
--
ALTER TABLE `job_listing_title`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_posts`
--
ALTER TABLE `job_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_post_education`
--
ALTER TABLE `job_post_education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_post_known_languages`
--
ALTER TABLE `job_post_known_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_post_id` (`job_post_id`);

--
-- Indexes for table `job_post_nationality`
--
ALTER TABLE `job_post_nationality`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_post_id` (`job_post_id`);

--
-- Indexes for table `job_post_pet_problems`
--
ALTER TABLE `job_post_pet_problems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_post_id` (`job_post_id`),
  ADD KEY `job_post_id_2` (`job_post_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_activity`
--
ALTER TABLE `log_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maid_apply_agency`
--
ALTER TABLE `maid_apply_agency`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`agency_id`);

--
-- Indexes for table `maid_apply_jobs`
--
ALTER TABLE `maid_apply_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`);

--
-- Indexes for table `maid_favourite`
--
ALTER TABLE `maid_favourite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maid_job_choices`
--
ALTER TABLE `maid_job_choices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maid_skill`
--
ALTER TABLE `maid_skill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maid_working_city`
--
ALTER TABLE `maid_working_city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maid_working_district`
--
ALTER TABLE `maid_working_district`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maid_working_states`
--
ALTER TABLE `maid_working_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maid_working_style`
--
ALTER TABLE `maid_working_style`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maid_work_countries`
--
ALTER TABLE `maid_work_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maid_work_experiences`
--
ALTER TABLE `maid_work_experiences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nationality`
--
ALTER TABLE `nationality`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pet_problems`
--
ALTER TABLE `pet_problems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating_review`
--
ALTER TABLE `rating_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_by_user_to_agency_for_maid`
--
ALTER TABLE `request_by_user_to_agency_for_maid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `suggest_maid_by_agency_to_user`
--
ALTER TABLE `suggest_maid_by_agency_to_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_educations`
--
ALTER TABLE `user_educations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_favourite`
--
ALTER TABLE `user_favourite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_hired_maid`
--
ALTER TABLE `user_hired_maid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_images`
--
ALTER TABLE `user_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_languages`
--
ALTER TABLE `user_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_pet_problems`
--
ALTER TABLE `user_pet_problems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `working_styles`
--
ALTER TABLE `working_styles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;
--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `educations`
--
ALTER TABLE `educations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `job_choices`
--
ALTER TABLE `job_choices`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `job_listing_title`
--
ALTER TABLE `job_listing_title`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `job_posts`
--
ALTER TABLE `job_posts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `job_post_education`
--
ALTER TABLE `job_post_education`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `job_post_known_languages`
--
ALTER TABLE `job_post_known_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;
--
-- AUTO_INCREMENT for table `job_post_nationality`
--
ALTER TABLE `job_post_nationality`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `job_post_pet_problems`
--
ALTER TABLE `job_post_pet_problems`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `log_activity`
--
ALTER TABLE `log_activity`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `maid_apply_agency`
--
ALTER TABLE `maid_apply_agency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `maid_apply_jobs`
--
ALTER TABLE `maid_apply_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `maid_favourite`
--
ALTER TABLE `maid_favourite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `maid_job_choices`
--
ALTER TABLE `maid_job_choices`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `maid_skill`
--
ALTER TABLE `maid_skill`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `maid_working_city`
--
ALTER TABLE `maid_working_city`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `maid_working_district`
--
ALTER TABLE `maid_working_district`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `maid_working_states`
--
ALTER TABLE `maid_working_states`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `maid_working_style`
--
ALTER TABLE `maid_working_style`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `maid_work_countries`
--
ALTER TABLE `maid_work_countries`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `maid_work_experiences`
--
ALTER TABLE `maid_work_experiences`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `nationality`
--
ALTER TABLE `nationality`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pet_problems`
--
ALTER TABLE `pet_problems`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `rating_review`
--
ALTER TABLE `rating_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `request_by_user_to_agency_for_maid`
--
ALTER TABLE `request_by_user_to_agency_for_maid`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `suggest_maid_by_agency_to_user`
--
ALTER TABLE `suggest_maid_by_agency_to_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `user_educations`
--
ALTER TABLE `user_educations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `user_favourite`
--
ALTER TABLE `user_favourite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `user_hired_maid`
--
ALTER TABLE `user_hired_maid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `user_images`
--
ALTER TABLE `user_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `user_languages`
--
ALTER TABLE `user_languages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `user_pet_problems`
--
ALTER TABLE `user_pet_problems`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `working_styles`
--
ALTER TABLE `working_styles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `district_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job_post_known_languages`
--
ALTER TABLE `job_post_known_languages`
  ADD CONSTRAINT `job_post_known_languages_ibfk_1` FOREIGN KEY (`job_post_id`) REFERENCES `job_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job_post_nationality`
--
ALTER TABLE `job_post_nationality`
  ADD CONSTRAINT `job_post_nationality_ibfk_1` FOREIGN KEY (`job_post_id`) REFERENCES `job_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job_post_pet_problems`
--
ALTER TABLE `job_post_pet_problems`
  ADD CONSTRAINT `job_post_pet_problems_ibfk_1` FOREIGN KEY (`job_post_id`) REFERENCES `job_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
