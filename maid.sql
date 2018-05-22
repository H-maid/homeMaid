-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 22, 2018 at 10:15 AM
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
(1, 'admin gaurav', '8881438096', '1526979622_Unknown.jpg', 'Hapur', 'maid', 'fluper', '$2y$10$DUaQff5gXysIonZ9sxvDTOQp1XvAmLVP8UfHna.gX2DfD4ZBTG2dy', 'vuIuGz92aeEPdwnasiRVsrn5xwc23cOTjHdHe7pm6Q2Ow2SEiKaPbrAOZWqP', '', 'gauravmrvh1@gmail.com', 1, '2018-05-08 12:35:57', '2018-05-22 10:00:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `country_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'hapur', 82, '2018-05-21 12:43:12', '2018-05-21 12:43:12', NULL),
(2, 'Anguilla', 7, '2018-05-21 12:48:04', '2018-05-21 12:48:04', NULL),
(3, 'Algeria', 3, '2018-05-21 16:40:16', '2018-05-21 16:40:16', NULL),
(4, 'kanpur', 23, '2018-05-22 10:49:33', '2018-05-22 10:49:33', NULL),
(5, 'AmericanSamoa', 4, '2018-05-22 11:18:43', '2018-05-22 11:18:43', NULL),
(6, 'Albania', 2, '2018-05-22 11:22:36', '2018-05-22 11:22:36', NULL);

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
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `district` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hi_job` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorised_person` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_administration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `step_for_maid_profile` bigint(20) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `country_code`, `mobile`, `email`, `dob`, `gender`, `password`, `otp`, `otp_verified`, `complete_profile`, `status`, `user_type`, `device_token`, `device_type`, `notification_status`, `photo_email_status`, `country_id`, `city_id`, `district`, `nationality`, `marital_status`, `kids`, `hi_job`, `company_name`, `authorised_person`, `tax_administration`, `tax_no`, `company_phone`, `step_for_maid_profile`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'maid', '+91', '8881438096', 'maid@gmail.com', '1993-05-14', 'male', '$2y$10$jjGvNqbu4MpuLSu/N71p3.I/kK3zY0JTyn0N9fP9ButkG1Fz38.4y', '', 1, 0, '1', 2, '12515215165165165', 1, 1, 1, 82, 1, 'district', 'nationality', 'single', 'kids', 'hi_job', NULL, NULL, NULL, NULL, NULL, 2, '56caefb3199b2cc0fda81edff310a9e7', '2018-05-21 12:33:33', '2018-05-21 12:52:25', NULL),
(2, 'ewre', '+91', '12345', 'abhi@abhi.com', '2018-05-20', 'male', '$2y$10$kNzLEG7yhpt/F.TnP4iaYujB2tiSyvv8qCCy6wo9mfgvlw1dWUhBq', '', 1, 1, '1', 1, '12515215165165165', 2, 1, 1, 7, 2, NULL, NULL, 'unmarried', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '2018-05-21 12:47:30', '2018-05-21 16:37:36', NULL),
(3, 'vbhati', '91', '7838783878', 'v@z.com', NULL, NULL, '$2y$10$EjQZeovw0OaJA2Q0lmMLIe7TRB9zx1LSGUd8tLZUBp0ROVG2gvQSS', '', 1, 0, '1', 2, 'dD6QItIUB-0:APA91bEIXkirKiqxXXF0-TMvyra8G3kC6kELvdzdK8xkFrei-afHFz_0SFAC6d3j_B-vzGFmsVg1x6mRiWnwD7KoPAttA6SHN026fuNg--SPIo8NpRfCZpubXQL_2AciA_aL5HcLA4iR', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2d7fa55aa0d0bf98ddea091a020e269d', '2018-05-21 13:12:48', '2018-05-21 13:12:54', NULL),
(4, 'bx', '91', '5252414141', 'r@s.com', NULL, NULL, '$2y$10$vzjuxUaTs3EY1R16XpJ.P.sapfKRr9LP6TRwDWi0XLI5.BybhhMeS', '', 1, 0, '1', 1, 'dD6QItIUB-0:APA91bEIXkirKiqxXXF0-TMvyra8G3kC6kELvdzdK8xkFrei-afHFz_0SFAC6d3j_B-vzGFmsVg1x6mRiWnwD7KoPAttA6SHN026fuNg--SPIo8NpRfCZpubXQL_2AciA_aL5HcLA4iR', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '6965ae06ac7d6c9af1f85e640b9b94dd', '2018-05-21 13:16:13', '2018-05-21 13:16:18', NULL),
(5, 'samamma', '91', '1234567', 'sambhatia66@gmail.com', NULL, NULL, '$2y$10$522ioe0L8.CDkYgFJjbRBOiSUAHj4VdS1EnZz1MWMx4NbNNzlwMgy', '', 1, 0, '1', 1, 'cCz40PWtaxg:APA91bGVEBcQvopP6wubTDTkBnO2xTcZ2c_U6HMdcT2GiScYHFT3ma9LMtLI4sXG4aBmuRhYDQ38xPSBgROkQTWMOZIz61ZAWHrKHVBl9tnMfAuTZY9NJZRyjR0octXRwSRFinB7Bid6', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'e9ba4ab8941f33c3c981b6cc7ad674ca', '2018-05-21 13:19:38', '2018-05-21 13:19:44', NULL),
(6, 'sevda', '90', '5549087706', 'sevdababar@gmail.com', NULL, NULL, '$2y$10$BNJOqSpWUmnuYM9tXA4VN.9WGu3/Tg23IgxmzMglSWPrD7r1lvAIa', '', 1, 0, '1', 2, 'eFqVG8abqCc:APA91bEBIhYA8EEfxyD2YYo5FcNzbQ75orNZUfjYHeCzODIkmhiYFRUcYyLFIkcirvQSHt1M5fg-g-MCcOFQ9BpkRMuVwDp7iotOTqz78chxyPhwcRA2LxNbDAFc8F109wUiMYfz1nXm', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '3431f18405ac1c980120d7d9a29e06b2', '2018-05-21 15:37:35', '2018-05-21 15:37:40', NULL),
(7, 'abhishek', '+91', '99999999', 'abhi@abhi.com', NULL, NULL, '$2y$10$UK4pKzhWVIX3iIMsZ9Ag.u4ODiJkl9zQTLYIU4KKcBwFLlSNoE2mS', '', 1, 0, '1', 2, '2154545156we14r651g65e1rg651er', 2, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '25568be99394f88f66682fd13b2c801f', '2018-05-21 16:37:50', '2018-05-22 13:41:52', NULL),
(8, 'abhishek', '+91', '99999999', 'abhi@abhi.com', NULL, NULL, '$2y$10$SRrAzoB1bYr/ElGIkDPbreoan14WorIo8MCvdo2jlfWbkyZ3d7cgq', '', 1, 1, '1', 3, '2154545156we14r651g65e1rg651er', 2, 1, 1, 3, 3, NULL, NULL, NULL, NULL, NULL, 'Fluper', 'Abhishek', 'sddas', 'sdsdasd', 'sdasadsa', 0, '', '2018-05-21 16:39:30', '2018-05-22 13:40:22', NULL),
(9, 'satyam', '91', '9654352383', 'sambhatia66@gmail.com', '1987-05-22', 'male', '$2y$10$Oc7KzCAZ9HdfJGQ99gIkTuSZkLRMWQ.Kpfz75GNgVMI0ethLFmV8u', '', 1, 1, '1', 1, 'do66lJWoXDI:APA91bFVQy4qBABFXqivGyviA3gpDdVA3iNv5Af48QNqYgexbbdIiZxW0JpyaEWUe4ASJZGCqi5yP1uUtU-Tt1f8Oi47Wgw4W4YdNLf10kumX0bQ1bDShAwKvvuCKoiA2XnFw3Fa0gzM', 1, 0, 0, 23, 4, NULL, NULL, 'Unmarried', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'bfa5846a6013cf48c34362930105e8bc', '2018-05-22 10:48:01', '2018-05-22 10:03:01', NULL),
(10, 'abhishek', '+91', '99999999', 'abhi@abhi.com', '2018-05-21', 'male', '$2y$10$OpfpfMkBalOoDojV6H0a0utUJZKuvf4B8by3YNovm84bilY0YwzpS', '', 1, 1, '1', 1, '2154545156we14r651g65e1rg651er', 2, 1, 1, 4, 5, NULL, NULL, 'unmarried', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '2018-05-22 11:18:21', '2018-05-22 12:36:21', NULL),
(11, 'abhishek', '+91', '9999999999', 'abhi@abhi.com', '2018-05-20', 'male', '$2y$10$RWhPW5rVeKAfl9ZS857vaeIiE0rxbnpEs7wF8hSaQ34gFqAP1a0Cu', '', 1, 1, '1', 1, '12515215165165165', 2, 1, 1, 2, 6, NULL, NULL, 'unmarried', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '2018-05-22 11:22:14', '2018-05-22 11:29:55', NULL),
(12, 'abhishek', '+91', '9999999999', 'abhi@abhi.com', NULL, NULL, '$2y$10$mLMVeeepyCcHn9h/jP4/hOj2OByMwBC.cPKvSMEEw66JXkQU0RIE6', '', 1, 1, '1', 3, '12515215165165165', 2, 1, 1, 3, 3, NULL, NULL, NULL, NULL, NULL, 'Fluper', 'Abhishek', 'Dsfsdfsd', '4334', '4534534', 0, '', '2018-05-22 11:30:07', '2018-05-22 11:32:21', NULL),
(13, 'abhishek', '+91', '999999991', 'abhi@abhi.com', '2018-04-22', 'male', '$2y$10$E9tauuCBa7sm/IFYdIT1VOlYlqugTMoZtnaRmqgCvaG/jyJu8o3SC', '', 1, 1, '1', 1, '12515215165165165', 2, 1, 1, 2, 6, NULL, NULL, 'unmarried', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '84f98e7d14e839ef91e297e1c7f0b817', '2018-05-22 11:37:13', '2018-05-22 11:37:32', NULL);

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
(1, 1, '_0_1526886470_12F8N.png', 1, 0, '2018-05-21 12:37:50', '2018-05-21 12:37:50', NULL),
(2, 2, '_0_1526887091_1526887090.jpeg', 1, 0, '2018-05-21 12:48:04', '2018-05-21 12:48:11', NULL),
(3, 8, '_0_1526901016_1526901015.jpeg', 1, 0, '2018-05-21 16:40:16', '2018-05-21 16:40:16', NULL),
(4, 9, '_0_1526966373_IMG-20180522-WA0008.jpg', 1, 0, '2018-05-22 10:49:33', '2018-05-22 10:49:33', NULL),
(5, 10, '_0_1526968131_1526968132.jpeg', 1, 0, '2018-05-22 11:18:43', '2018-05-22 11:18:51', NULL),
(6, 11, '_0_1526968356_1526968355.jpeg', 1, 0, '2018-05-22 11:22:36', '2018-05-22 11:22:36', NULL),
(7, 12, '_0_1526968843_1526968842.jpeg', 1, 0, '2018-05-22 11:30:43', '2018-05-22 11:30:43', NULL),
(8, 13, '_0_1526969252_1526969252.jpeg', 1, 0, '2018-05-22 11:37:32', '2018-05-22 11:37:32', NULL);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_images`
--
ALTER TABLE `user_images`
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `user_images`
--
ALTER TABLE `user_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
