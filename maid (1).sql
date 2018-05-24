-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 24, 2018 at 01:11 PM
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
(6, 'Albania', 2, '2018-05-22 11:22:36', '2018-05-22 11:22:36', NULL),
(7, 'Bahamas', 15, '2018-05-22 16:29:56', '2018-05-22 16:29:56', NULL),
(8, 'Turkey', 181, '2018-05-22 17:52:33', '2018-05-22 17:52:33', NULL);

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
(3, 'education3', '2018-05-23 10:21:42', '2018-05-23 10:21:42', NULL);

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
(3, 'language3', '2018-05-23 10:46:45', '2018-05-23 10:46:45', NULL);

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
(1, 2, 1, '2018-05-24 14:28:52', '2018-05-24 14:28:52', NULL),
(2, 2, 2, '2018-05-24 14:28:52', '2018-05-24 14:28:52', NULL);

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
(1, 2, 1, '2018-05-24 14:30:05', '2018-05-24 14:30:05', NULL),
(2, 2, 2, '2018-05-24 14:30:05', '2018-05-24 14:30:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maid_skills`
--

CREATE TABLE `maid_skills` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `job_choice_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maid_skills`
--

INSERT INTO `maid_skills` (`id`, `user_id`, `job_choice_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, '2018-05-24 12:52:20', '2018-05-24 12:52:20', NULL),
(2, 2, 2, '2018-05-24 12:52:20', '2018-05-24 12:52:20', NULL);

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
(1, 2, 1, '2018-05-24 14:28:52', '2018-05-24 14:28:52', NULL),
(2, 2, 2, '2018-05-24 14:28:52', '2018-05-24 14:28:52', NULL);

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
(1, 2, 1, '2018-05-24 14:30:05', '2018-05-24 14:30:05', NULL),
(2, 2, 2, '2018-05-24 14:30:05', '2018-05-24 14:30:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maid_work_experiences`
--

CREATE TABLE `maid_work_experiences` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'nationality1', '2018-05-23 09:44:40', '2018-05-23 09:44:52', NULL),
(2, 'nationality2', '2018-05-23 09:44:40', '2018-05-23 09:44:52', NULL),
(3, 'nationality3', '2018-05-23 09:44:40', '2018-05-23 09:44:52', NULL);

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
(3, 'pet_problem3', '2018-05-23 12:53:52', '2018-05-23 12:53:52', NULL);

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
(1, 87, 'india_state1', '2018-05-23 07:59:31', '2018-05-23 08:00:38', NULL),
(2, 87, 'india_state2', '2018-05-23 07:59:31', '2018-05-23 08:00:45', NULL),
(3, 87, 'india_state3', '2018-05-23 07:59:31', '2018-05-23 08:00:45', NULL),
(4, 181, 'Turkey_state1', '2018-05-23 07:59:31', '2018-05-23 09:19:37', NULL),
(5, 181, 'Turkey_state2', '2018-05-23 07:59:31', '2018-05-23 09:19:37', NULL),
(6, 181, 'Turkey_state3', '2018-05-23 07:59:31', '2018-05-23 09:19:37', NULL);

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
  `maid_can_work_country_id` bigint(20) DEFAULT NULL,
  `can_live_with_family` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `travel_situation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expected_fees` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maid_education` text COLLATE utf8mb4_unicode_ci,
  `maid_certificate` text COLLATE utf8mb4_unicode_ci,
  `maid_about_me` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `country_code`, `mobile`, `email`, `dob`, `gender`, `password`, `otp`, `otp_verified`, `complete_profile`, `status`, `user_type`, `device_token`, `device_type`, `notification_status`, `photo_email_status`, `country_id`, `city_id`, `state_id`, `district`, `nationality_id`, `marital_status`, `kids`, `hi_job`, `company_name`, `authorised_person`, `tax_administration`, `tax_no`, `company_phone`, `step_for_maid_profile`, `work_status`, `driving_licence`, `smoke`, `alcohol`, `maid_can_work_country_id`, `can_live_with_family`, `travel_situation`, `expected_fees`, `maid_education`, `maid_certificate`, `maid_about_me`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'maid', '+91', '8881438096', 'user@gmail.com', '1993-05-14', 'male', '$2y$10$mL4BqGmaOtcl2gpRMHy0EeISxdg4LP/1erAdZtgVp15o0yLBlko86', '8645', 0, 1, '1', 1, '12515215165165165', 1, 1, 1, 87, NULL, 1, NULL, NULL, 'single', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f997496def2a4ada13f2445b6eaeb5c6', '2018-05-23 13:23:18', '2018-05-23 20:37:49', NULL),
(2, 'maid', '+91', '8881438096', 'maid@gmail.com', '1993-05-14', 'male', '$2y$10$Gh23a6k6AK3uBpAMKsS3fekLMD8ZTbfZuoLEaO0mjC9kC.8fBpxaK', '', 1, 0, '1', 2, '12515215165165165', 1, 0, 0, 87, NULL, 1, NULL, '1', 'single', 'kids', 'hi_job', NULL, NULL, NULL, NULL, NULL, 5, 'work_status', 'driving_licence', 'smoke', 'alcohol', 87, 'yes', 'no matter', '20000', 'maid_education', 'maid_certificate', 'maid_about_me', 'fcc0fa456e171bd7d3969cf12797f0a2', '2018-05-23 13:23:51', '2018-05-24 18:22:58', NULL),
(3, 'maid', '+91', '8881438096', 'agency@gmail.com', NULL, NULL, '$2y$10$X1p0thvZHs6iKRt4N7j41uNmhbUBEgb41O5eb2Z7LV4ye0qfAx4F2', '', 1, 1, '1', 3, '12515215165165165', 1, 1, 1, 87, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'fluper', 'authorised_person', 'tax_administration', 'tax_no', 'company_phone', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'fa816a569bfc9a7525f05b3fd3f7731e', '2018-05-23 13:24:11', '2018-05-24 16:23:51', NULL),
(16, 'abhishek', '+91', '99999999', 'abhi@abhi.com', '1993-05-14', 'male', '$2y$10$sHOTjCuqmfMUwxtJe88JeOpqvUz3T5V60WyzeXF1eMXetak8vEOtW', '', 1, 1, '1', 1, '2154545156we14r651g65e1rg651er', 2, 1, 1, 87, NULL, 1, NULL, NULL, 'single', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-05-23 15:46:59', '2018-05-24 17:07:44', NULL),
(17, 'maid', '+91', '8881438095', 'agency@gmail.com', NULL, NULL, '$2y$10$KvmIb92rViT569VZtGWB1..aK4vLm.pZCpPOI.3Gb1VPTmA3EJRgy', '5585', 0, 0, '1', 3, '12515215165165165', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4df139692b548bf5ddd7b99ef4578e3d', '2018-05-23 15:54:40', '2018-05-23 15:54:40', NULL),
(18, 'maid', '+91', '11111111', 'agency@gmail.com', NULL, NULL, '$2y$10$6laRw7328ryhiX.DX.u.EuUX.9OPQZQU6AgbEfVJyF0gRR4we6iki', '2296', 0, 0, '1', 3, '12515215165165165', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f7f656ab0576ee04023e534895635785', '2018-05-23 16:00:44', '2018-05-23 16:00:44', NULL),
(19, 'maid', '+91', '11111111', 'agency@gmail.com', '1993-05-14', 'male', '$2y$10$c6ushfgJG9qgAYonkF095OBTX9IMvyI2k4WOyaNu1sqczA95EpZR.', '8071', 0, 1, '1', 1, '12515215165165165', 1, 1, 1, 87, NULL, 1, NULL, NULL, 'single', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '33d50e6fdb12c5f2f70f32f16d1f3f34', '2018-05-23 16:01:10', '2018-05-23 16:18:24', NULL),
(20, 'abhishek', '+91', '22222222', 'abhi@abhi.com', '2018-05-23', 'male', '$2y$10$IAe4EuSW3zp5v2Ymri6SJ.HqFnfSmfNx8vOAJDf.O6g09EZm/rl6m', '', 1, 1, '1', 1, '12515215165165165', 2, 1, 1, 87, NULL, 87, NULL, NULL, 'Unmarried', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c4b161e4f88b4e699a7f157a82265c56', '2018-05-23 16:03:18', '2018-05-23 16:04:12', NULL),
(21, 'abhishek', '+91', '999999991', 'abhi@abhi.com', NULL, NULL, '$2y$10$R/UyL3LN5rbY0rufu1ITbu.3hdkPXBPGfvICNKhMNCHFKDFvWIHOS', '', 1, 0, '1', 1, '12515215165165165', 2, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f97084e96db7847befc61b67d6cdc515', '2018-05-23 16:16:20', '2018-05-23 16:16:24', NULL),
(22, 'abhishek', '+91', '999999992', 'abhi@abhi.com', '2018-02-23', 'male', '$2y$10$6U3v/Lls6urX11HOfyu8/Oed32CI7OdMmDkZDbj4o/XLdDA2iBXPe', '', 1, 1, '1', 1, '12515215165165165', 2, 1, 1, 87, NULL, 1, NULL, NULL, 'Unmarried', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-05-23 16:19:46', '2018-05-23 16:20:49', NULL),
(23, 'abhishek', '+91', '99999999', 'abhi@abhi.com', NULL, NULL, '$2y$10$dT5aLZRa05DJCr6EHQ1np.tZ/G0qG8toXaC2ABb7zOA.P7UtuRCNW', '', 1, 1, '1', 3, '2154545156we14r651g65e1rg651er', 2, 1, 1, 2, NULL, 87, NULL, NULL, NULL, NULL, NULL, 'Ewr', 'Erwe', 'Rewrwe', 'Ewrwer', 'erewrwe', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-05-23 16:21:06', '2018-05-24 10:38:35', NULL),
(24, 'maid', '+91', '111111111', 'agency@gmail.com', NULL, NULL, '$2y$10$uV43nUyWokMxCMurc5TPDuzj3PbLCvHkc9oAnUJcEsQ.F0hqezkSa', '9984', 0, 1, '1', 3, '12515215165165165', 1, 1, 1, 87, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'fluper', 'authorised_person', 'tax_administration', 'tax_no', 'company_phone', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '589d4f14eec6d1bbb49a737183e3f241', '2018-05-23 16:24:57', '2018-05-23 16:25:28', NULL),
(25, 'abhishek', '+91', '9999999', 'abhi@abhi.com', NULL, NULL, '$2y$10$LF/e.V4WGY0NeH7sm8fSQuMBsJPxnBmSx/PaCpwUVrtu7to1rNJPC', '', 1, 1, '1', 3, '12515215165165165', 2, 1, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Wer', 'Erewr', 'wrewrwerwre', 'Ewrwerwe', 'ewrwer', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-05-23 16:30:16', '2018-05-23 16:33:02', NULL),
(26, 'satyam', '91', '7011886334', 'sambhatia66@gmail.com', NULL, NULL, '$2y$10$MmyRShM91H7Du/Rd9w7sMunIFLq0qCFygEeR4jghdLJHYPvBL2Ax2', '', 1, 1, '1', 3, 'fMOACzJrNCY:APA91bEAbc3hLg4pOe_8HxQ1mF2Jpo4AD0j-9wnpqnilLKAXUkUDAJD5Xuo--OPyFSQlusJzofD844OU2yKnx0oD-teQE3yp9XPpeKvPOxkLk5bmfSGRgaO-ariCzSAyv5vpHeKC72ea', 1, 1, 1, 181, NULL, 5, NULL, NULL, NULL, NULL, NULL, 'smnaj', 'sjjanajaj', 'hajjqhahajjwj', '949494664949', '94949949941', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2f149917977efd4cd0ff35f509c27425', '2018-05-23 16:31:43', '2018-05-23 17:05:04', NULL),
(27, 'abhishek', '+91', '99999999', 'abhi@abhi.com', '2018-05-24', 'male', '$2y$10$sH4XDIntaCVhk8yvGOXEl.uCpHAAydhO8gHDmHQoU1QEzLG4UlF4.', '', 1, 0, '1', 2, '2154545156we14r651g65e1rg651er', 2, 1, 1, 2, NULL, 6, NULL, '2', 'Single', 'No', 'Yes', NULL, NULL, NULL, NULL, NULL, 3, 'Working', 'No', 'I am not use', 'I use', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f86cd55e758a65535b44951020ebfbbb', '2018-05-23 16:33:12', '2018-05-24 18:28:05', NULL),
(28, 'abhishek', '+91', '999999991', 'abhi@abhi.com', NULL, NULL, '$2y$10$de.jBHP9IOdOkk5rjI.nN.YPB5vOHTA14GNLXSdeAFLL5/wTfniRy', '', 1, 1, '1', 3, '12515215165165165', 2, 1, 1, 4, NULL, 87, NULL, NULL, NULL, NULL, NULL, 'Ewqfqfas', '3212431432', 'Fgsgdfsgdfsgf', 'Dsggfdsfgd', 'fdhfgdfg', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '38102c795a7338138b12a7dc623dcd0b', '2018-05-23 17:53:51', '2018-05-23 17:54:32', NULL),
(29, 'maid', '+91', '88814380', 'agency@gmail.com', NULL, NULL, '$2y$10$XUDmeh.IdA2K.V2MT5v8L.VdM7tKt/YZqUM/2xcr8c.YtnHXRcL0S', '5848', 0, 0, '1', 3, '12515215165165165', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6a948da6de8ac09c8915556122fbc730', '2018-05-23 17:54:54', '2018-05-23 17:54:54', NULL),
(30, 'abhishek', '+91', '99999990', 'abhi@abhi.com', '2018-02-23', 'male', '$2y$10$VBhlNW2iU8.jLEoI43QHfeH1eKvv/ov/FQCl13E7bcp4/SjdnUzZK', '', 1, 1, '1', 1, '12515215165165165', 2, 1, 1, 4, NULL, 87, NULL, NULL, 'Married', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '387f70b0d9227b9195a405bddaaa2ce7', '2018-05-23 18:01:09', '2018-05-23 18:05:32', NULL),
(31, 'satyam', '91', '123456', 'sambhatia66@gmail.com', '1997-05-24', 'male', '$2y$10$G39QcywvYo7BzLsKDIbxveLw69i7BWES2NZdQPRWk37HyiXIrYiU.', '', 1, 0, '1', 2, 'cdV5ADSdL4c:APA91bEZeRRoHGWYc0R8YdaM0i3jeLGdJF-4iOcxs44y0Xjn4qewhl11yrJOhQ0DQGmdXyuJ98Y3twZyA_ltICmZcE72VvpvxlxSULpmioHRJGixORJjJ5mG93dc96R52_zv-h2fbbye', 1, 1, 1, 181, NULL, 4, NULL, '1', 'Unmarried', 'No', 'No', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4d550c17a436d3b80a19d43d2eb4e503', '2018-05-23 19:23:54', '2018-05-24 13:10:51', NULL),
(32, 'maid', '+91', '222222', 'agency@gmail.com', NULL, NULL, '$2y$10$miI67het1ZhdYN/KxP0TjOMufUIUi1MTx2iyB9SZSqjxNiBbd9u8G', '9268', 0, 0, '1', 3, '12515215165165165', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4375bcfd7cb7ed602031dacfe1f8898d', '2018-05-23 19:27:29', '2018-05-23 19:27:29', NULL),
(33, 'maid', '+91', '222222', 'agency@gmail.com', NULL, NULL, '$2y$10$VYQQWyJTuZNkKEUDrI7gHe4cJRqXgvWtM1fYJRf.9WPrp86wlAPOK', '8155', 0, 0, '1', 1, '12515215165165165', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3981fd75f4433185e565e2265db54376', '2018-05-23 19:27:36', '2018-05-23 19:27:36', NULL),
(34, 'abhishek', '+91', '9999999943534', 'abhi@abhi.com', '2018-05-21', 'male', '$2y$10$o5ZA4TtNYgk7fmeuAEfjSOpNaelnujrpYMBtp2MRHwJ7hk2QYN.7a', '', 1, 1, '1', 1, '12515215165165165', 2, 1, 1, 2, NULL, 1, NULL, NULL, 'Unmarried', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-05-23 20:03:42', '2018-05-23 20:04:30', NULL),
(35, 'abhishek', '+91', '999999990', 'abhi@abhi.com', NULL, NULL, '$2y$10$X9D1Tr8AZZxoH1m2DPahG.F9AEY7.Ipr1SSUwzBtR7Wv/.myU01bW', '', 1, 0, '1', 1, '12515215165165165', 2, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '560ed2dc342807c519ffe939192f867e', '2018-05-24 11:24:57', '2018-05-24 11:26:52', NULL),
(36, 'abhishek', '+91', '8888888888', 'abhi@abhi.com', '2018-02-24', 'Female', '$2y$10$gnXCJx2jk7l2yLmwhCtNBOBwlWYJ84zGK2as9XX4OqZQcoFD30gZa', '', 1, 0, '1', 2, '12515215165165165', 2, 1, 1, 181, NULL, 6, NULL, '1', 'Unmarried', 'No', 'No', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-05-24 11:33:24', '2018-05-24 12:16:19', NULL),
(37, 'abhishek', '+91', '1111111111', 'abhi@abhi.com', '2018-05-24', 'Female', '$2y$10$jmBNyU85C8hSowUuegHWlOJN2WW15inYo30MFQUz5nk9OziuYd5MK', '', 1, 0, '1', 2, '12515215165165165', 2, 1, 1, 2, NULL, 6, NULL, '3', 'Unmarried', 'No', 'No', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-05-24 12:18:11', '2018-05-24 13:00:25', NULL),
(38, 'abhishek', '+91', '1212121212', 'abhi@abhi.com', NULL, NULL, '$2y$10$6Ov25OxobfWsaRfyj7i6Z.n8lUbp1lcKkeROM8ONdemEfib9liyla', '', 1, 1, '1', 3, '12515215165165165', 2, 1, 1, 181, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Hzhsh', 'Zhxhhx', 'H Hxhxh', 'Bbbb', '8', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-05-24 13:01:13', '2018-05-24 13:28:45', NULL),
(39, 'abhishek', '+91', '88888888', 'abhi@abhi.com', '2018-05-23', 'male', '$2y$10$Rkuq9bzV79ITYIcOiFdyD.HbS1IGHK/1QEpDvs6Unk.hFuNpoMFla', '', 1, 0, '1', 2, '12515215165165165', 2, 1, 1, 2, NULL, 5, NULL, '2', 'Single', 'No', 'Yes', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '54fcd0f6fc1b83ba7a57df2c28f27295', '2018-05-24 13:16:11', '2018-05-24 13:16:35', NULL),
(40, 'abhishek', '+91', '1212121212', 'abhi@abhi.com', '2018-05-24', 'female', '$2y$10$ArRCecWK1OFAJN2XUcbi7uoVArRUL88q4sMUMdJD5abEk4yJ02m1q', '', 1, 1, '1', 1, '12515215165165165', 2, 1, 1, 181, NULL, 1, NULL, NULL, 'Unmarried', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4f5a6143d7995e78fbc22e63893f2613', '2018-05-24 13:48:16', '2018-05-24 13:49:17', NULL),
(41, 'abhishek', '+91', '9999999933', 'abhi@abhi.com', NULL, NULL, '$2y$10$fsgtoTEw.bNVaQlkBAw6OuxEy1P.jQJrzpa5fV9d5cCRTNDA.g7ry', '', 1, 0, '1', 1, '12515215165165165', 2, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7ecb47a6b6e4ced60dcc082c551d183c', '2018-05-24 15:26:52', '2018-05-24 15:26:57', NULL),
(42, 'abhishek', '+91', '99999999333', 'abhi@abhi.com', '2018-03-24', 'male', '$2y$10$REJuAhTixnj3eBT/CivFh.0gIrwLls28BbywwzjjDlqX2fM/Daa2G', '', 1, 1, '1', 1, '2154545156we14r651g65e1rg651er', 2, 1, 1, 3, NULL, 1, NULL, NULL, 'Married', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-05-24 15:41:28', '2018-05-24 16:00:12', NULL),
(43, 'abhishek', '+91', '99999999333', 'abhi@abhi.com', NULL, NULL, '$2y$10$Ficn8sFFJdwhpE3nUMNateDQtWUjLkoVPEf0NkPqGIN6m9ErT7SPO', '', 1, 1, '1', 3, '2154545156we14r651g65e1rg651er', 2, 1, 1, 3, NULL, 181, NULL, NULL, NULL, NULL, NULL, 'Ewrewew', 'rwerwe', 'erwerwee', 'rwererwerwe', 'ewrwerwer', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-05-24 16:00:20', '2018-05-24 16:25:31', NULL),
(44, 'maid', '+91', '9999999999', 'agency@gmail.com', NULL, NULL, '$2y$10$oTDaEwvAppWyBnfODVqvvOVKoID7ikMEDveVIEdThtMdTOkZmWxAC', '9048', 0, 0, '1', 3, '12515215165165165', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a22626ad0be11e6270890764bd01096f', '2018-05-24 16:08:48', '2018-05-24 16:08:48', NULL),
(45, 'maid', '+91', '999999999999', 'agency@gmail.com', NULL, NULL, '$2y$10$QUPvYVQgsLZBXeuyYHo5qe8sWfzv2CLjPOsZBAqZooVBiGyKkQjqe', '8318', 0, 0, '1', 3, '12515215165165165', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f286cc8dbb3b4a8fab28e6c055459eb4', '2018-05-24 16:15:48', '2018-05-24 16:15:48', NULL),
(46, 'maid', '+91', '12345', 'agency@gmail.com', NULL, NULL, '$2y$10$uaQXakyjNk64W0UVZkmDiOSHhvxV4WpBOpenUlXp08N3T8DYHempC', '3885', 0, 0, '1', 3, '12515215165165165', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '082015ea6dd96a29e9b1c422a6b03261', '2018-05-24 16:20:52', '2018-05-24 16:20:52', NULL),
(47, 'maid', '+91', '88814380961', 'agency@gmail.com', NULL, NULL, '$2y$10$xLyJbyBM.PK6T4j.221Paurz0jy/3ANGRuuDcOz4zDGRVqLS1d0JS', '8212', 0, 1, '1', 3, '12515215165165165', 1, 1, 1, 87, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'fluper', 'authorised_person', 'tax_administration', 'tax_no', 'company_phone', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1c3b1f658a95d56f9d0c848a153d72c6', '2018-05-24 16:23:34', '2018-05-24 16:27:10', NULL),
(48, 'abhishek', '+91', '9999999921', 'abhi@abhi.com', NULL, NULL, '$2y$10$PQiuM4M1EcxJdnSxOzFdPet.iD/twoXHBRd0.9Aui70Kx4.EUb2mi', '', 1, 1, '1', 3, '2154545156we14r651g65e1rg651er', 2, 1, 1, 3, NULL, 181, NULL, NULL, NULL, NULL, NULL, 'Er', 'ewrwer', 'Rwerweew', 'Rwerew', 'rwerew', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-05-24 16:25:39', '2018-05-24 16:27:55', NULL),
(49, 'abhishek', '+91', '99999999211', 'abhi@abhi.com', NULL, NULL, '$2y$10$nam538UhHraRoMMP5tVjwOzgPKKVIHjlywag9Mpt/Ij4gMrOGYGmO', '', 1, 1, '1', 3, '12515215165165165', 2, 1, 1, 3, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Wqeqw', 'eqwew', 'wqeqweqwweqweqwe', 'ewqweqwweqwewqe', 'ewqweqw', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-05-24 16:28:06', '2018-05-24 16:33:11', NULL),
(50, 'abhishek', '+91', '999999', 'abhi@abhi.com', NULL, NULL, '$2y$10$TLwcnsCAdg6rxSIvWxwnDuLolAdMsFWO6q3dP0/Rowwwc37ucE2BW', '', 1, 0, '1', 3, '12515215165165165', 2, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '57e3e0c2d74178aecb3f79c12cb4a027', '2018-05-24 16:33:20', '2018-05-24 16:33:24', NULL),
(51, 'abhishek', '+91', '99999', 'abhi@abhi.com', NULL, NULL, '$2y$10$KCt/kspdfJNVA0Bh6cnmJeT0O/cZkJWANcOQe1HpZwNN9BGJrO0EO', '', 1, 1, '1', 3, '12515215165165165', 2, 1, 1, 22, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Rewrwee', 'Rwerwee', 'Rwere', 'Ewrwerewrwer', 'erwer', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-05-24 16:35:47', '2018-05-24 17:03:33', NULL),
(52, 'abhishek', '+91', '99999999456456', 'abhi@abhi.com', NULL, NULL, '$2y$10$99FuebkSLyoBfEnhyyuI/.k6K2kAfrv4WDgt7Rl72RyXvieUy7ixW', '', 1, 1, '1', 3, '12515215165165165', 2, 1, 1, 87, NULL, 1, NULL, NULL, NULL, NULL, NULL, '4rwer', 'erwerewr', 'dsfsdf', '4534', '4534', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-05-24 17:27:26', '2018-05-24 17:28:25', NULL),
(53, 'abhishek', '+91', '999999994353443534', 'abhi@abhi.com', '2018-05-23', 'male', '$2y$10$r7OndK9qctFy0HVgjyw.YutnsYSU.aE3N5e9XfV/12c7XJ7LRpA4a', '', 1, 1, '1', 1, '12515215165165165', 2, 1, 1, 2, NULL, 1, NULL, NULL, 'Unmarried', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-05-24 17:28:36', '2018-05-24 17:29:13', NULL),
(54, 'abhishek', '+91', '999999994353453', 'abhi@abhi.com', NULL, NULL, '$2y$10$rnyqeendiMSN3GRMpIXp8.TB037wiIv0ktKvbMtceJodSEVraaqEO', '', 1, 0, '1', 2, '12515215165165165', 2, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7ce9ef78b0bdc39c766876cae9fabc98', '2018-05-24 17:29:19', '2018-05-24 17:29:26', NULL);

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
(1, 2, 1, '2018-05-23 16:55:14', '2018-05-23 16:55:14', NULL),
(2, 2, 2, '2018-05-23 16:55:14', '2018-05-23 16:55:14', NULL),
(3, 27, 2, '2018-05-24 18:10:59', '2018-05-24 18:10:59', NULL),
(4, 27, 3, '2018-05-24 18:10:59', '2018-05-24 18:10:59', NULL);

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
(1, 1, '_0_1527066843_South-Indian-Food_150x150.jpg', 1, 0, '2018-05-23 14:30:56', '2018-05-23 14:44:03', NULL),
(2, 3, '_0_1527159018_South-Indian-Food_150x150.jpg', 1, 0, '2018-05-23 14:56:57', '2018-05-24 16:20:18', NULL),
(3, 2, '_0_1527086691_Ddc6TsMV4AAMqDx.jpg', 1, 0, '2018-05-23 15:01:57', '2018-05-23 20:14:51', NULL),
(5, 16, '_0_1527071370_South-Indian-Food_150x150.jpg', 1, 0, '2018-05-23 15:47:50', '2018-05-23 15:59:30', NULL),
(6, 19, '_0_1527072504_bill.jpg', 1, 0, '2018-05-23 16:01:32', '2018-05-23 16:18:24', NULL),
(7, 20, '_0_1527072188_1527072185.jpeg', 1, 0, '2018-05-23 16:04:12', '2018-05-23 16:13:08', NULL),
(8, 22, '_0_1527072630_1527072629.jpeg', 1, 0, '2018-05-23 16:20:30', '2018-05-23 16:20:30', NULL),
(9, 23, '_0_1527072834_1527072834.jpeg', 1, 0, '2018-05-23 16:21:37', '2018-05-23 16:23:54', NULL),
(10, 24, '_0_1527073151_bill.jpg', 1, 0, '2018-05-23 16:25:28', '2018-05-23 16:29:11', NULL),
(11, 25, '_0_1527073250_1527073247.jpeg', 1, 0, '2018-05-23 16:30:50', '2018-05-23 16:30:50', NULL),
(12, 26, '_0_1527075304_IMG-20180523-WA0006.jpg', 1, 0, '2018-05-23 17:05:04', '2018-05-23 17:05:04', NULL),
(13, 28, '_0_1527078272_1527078272.jpeg', 1, 0, '2018-05-23 17:54:32', '2018-05-23 17:54:32', NULL),
(14, 30, '_0_1527078932_1527078932.jpeg', 1, 0, '2018-05-23 18:05:32', '2018-05-23 18:05:32', NULL),
(15, 31, '_0_1527167478_IMG-20180524-WA0000.jpg', 1, 0, '2018-05-23 19:37:15', '2018-05-24 18:41:18', NULL),
(16, 27, '_0_1527166657_1527166656.jpeg', 1, 0, '2018-05-23 20:00:40', '2018-05-24 18:27:37', NULL),
(17, 34, '_0_1527086051_1527086050.jpeg', 1, 0, '2018-05-23 20:04:11', '2018-05-23 20:04:11', NULL),
(18, 36, '_0_1527141812_1527141811.jpeg', 1, 0, '2018-05-24 11:33:32', '2018-05-24 11:33:32', NULL),
(19, 37, '_0_1527144600_1527144599.jpeg', 1, 0, '2018-05-24 12:20:00', '2018-05-24 12:20:00', NULL),
(20, 38, '_0_1527147119_1527147118.jpeg', 1, 0, '2018-05-24 13:01:59', '2018-05-24 13:01:59', NULL),
(21, 39, '_0_1527147979_1527147979.jpeg', 1, 0, '2018-05-24 13:16:19', '2018-05-24 13:16:19', NULL),
(22, 40, '_0_1527149957_1527149956.jpeg', 1, 0, '2018-05-24 13:49:17', '2018-05-24 13:49:17', NULL),
(23, 42, '_0_1527157805_1527157804.jpeg', 1, 0, '2018-05-24 16:00:05', '2018-05-24 16:00:05', NULL),
(24, 43, '_0_1527158258_1527158257.jpeg', 1, 0, '2018-05-24 16:07:38', '2018-05-24 16:07:38', NULL),
(25, 47, '_0_1527159430_A.jpg', 1, 0, '2018-05-24 16:24:35', '2018-05-24 16:27:10', NULL),
(26, 48, '_0_1527159365_1527159364.jpeg', 1, 0, '2018-05-24 16:26:05', '2018-05-24 16:26:05', NULL),
(27, 49, '_0_1527159520_1527159519.jpeg', 1, 0, '2018-05-24 16:28:40', '2018-05-24 16:28:40', NULL),
(28, 51, '_0_1527160067_1527160066.jpeg', 1, 0, '2018-05-24 16:37:47', '2018-05-24 16:37:47', NULL),
(29, 52, '_0_1527163098_1527163097.jpeg', 1, 0, '2018-05-24 17:28:18', '2018-05-24 17:28:18', NULL),
(30, 53, '_0_1527163143_1527163142.jpeg', 1, 0, '2018-05-24 17:29:03', '2018-05-24 17:29:03', NULL),
(31, 54, '_0_1527163166_1527163165.jpeg', 1, 0, '2018-05-24 17:29:26', '2018-05-24 17:29:26', NULL);

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
(1, 2, 1, '2018-05-23 16:47:24', '2018-05-24 12:18:57', NULL),
(2, 2, 2, '2018-05-23 16:47:24', '2018-05-24 12:19:00', NULL),
(3, 27, 2, '2018-05-24 18:28:05', '2018-05-24 18:28:05', NULL),
(4, 27, 3, '2018-05-24 18:28:05', '2018-05-24 18:28:05', NULL);

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
(3, 2, 1, '2018-05-23 19:16:03', '2018-05-23 19:16:03', NULL),
(4, 2, 2, '2018-05-23 19:16:03', '2018-05-23 19:16:03', NULL),
(5, 27, 2, '2018-05-24 18:28:05', '2018-05-24 18:28:05', NULL),
(6, 27, 3, '2018-05-24 18:28:05', '2018-05-24 18:28:05', NULL);

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
(3, 'part time', '2018-05-24 05:45:04', '2018-05-24 06:34:58', NULL);

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
-- Indexes for table `languages`
--
ALTER TABLE `languages`
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
-- Indexes for table `maid_skills`
--
ALTER TABLE `maid_skills`
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
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;
--
-- AUTO_INCREMENT for table `educations`
--
ALTER TABLE `educations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `job_choices`
--
ALTER TABLE `job_choices`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `maid_job_choices`
--
ALTER TABLE `maid_job_choices`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `maid_skill`
--
ALTER TABLE `maid_skill`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `maid_skills`
--
ALTER TABLE `maid_skills`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `maid_working_states`
--
ALTER TABLE `maid_working_states`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `maid_working_style`
--
ALTER TABLE `maid_working_style`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `maid_work_experiences`
--
ALTER TABLE `maid_work_experiences`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `nationality`
--
ALTER TABLE `nationality`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pet_problems`
--
ALTER TABLE `pet_problems`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `user_educations`
--
ALTER TABLE `user_educations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_images`
--
ALTER TABLE `user_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `user_languages`
--
ALTER TABLE `user_languages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_pet_problems`
--
ALTER TABLE `user_pet_problems`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `working_styles`
--
ALTER TABLE `working_styles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
