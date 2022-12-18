-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2022 at 10:21 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cybersafe`
--
CREATE DATABASE IF NOT EXISTS `cybersafe` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cybersafe`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_telephone` int(11) NOT NULL,
  `admin_firstname` varchar(30) NOT NULL,
  `admin_lastname` varchar(50) NOT NULL,
  `admin_email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_body` text NOT NULL,
  `posted_by` varchar(100) NOT NULL,
  `posted_to` varchar(100) NOT NULL,
  `date_added` datetime NOT NULL,
  `removed` varchar(3) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` VALUES
(10, 'agree', 'elenavelez', 'elenavelez', '2022-12-17 10:15:07', 'no', 20),
(11, 'Incredible', 'elenavelez', 'elenavelez', '2022-12-17 13:06:09', 'no', 37),
(12, 'Incredible', 'elenavelez', 'elenavelez', '2022-12-17 13:06:49', 'no', 38),
(13, 'We must be extra careful when using our mobile phones', 'elenavelez', 'elenavelez', '2022-12-17 17:36:24', 'no', 41),
(14, 'Hope our website contributes to increase awareness on how to protect us online', 'elenavelez', 'saulmoon', '2022-12-18 09:17:40', 'no', 47);

-- --------------------------------------------------------

--
-- Table structure for table `degree`
--

DROP TABLE IF EXISTS `degree`;
CREATE TABLE `degree` (
  `degree_id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `degree_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
CREATE TABLE `faculty` (
  `faculty_id` int(11) NOT NULL,
  `faculty_name` varchar(50) NOT NULL,
  `no_students` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `post_id` int(11) NOT NULL,
  `liked_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` VALUES
(6, 'timfinn', 32, '2022-12-18 09:07:27'),
(7, 'timfinn', 10, '2022-12-18 09:07:27'),
(9, 'timfinn', 36, '2022-12-18 09:07:27');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `link` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` VALUES
(0, 'timfinn', 'elenavelez', 'Elena Velez commented on your post', 'post.php?id=36', '2022-12-17 10:14:55', 'no', 'no'),
(0, 'saulmoon', 'elenavelez', 'Elena Velez commented on your post', 'post.php?id=47', '2022-12-18 09:17:40', 'no', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `body` text DEFAULT NULL,
  `added_by` varchar(100) DEFAULT NULL,
  `user_to` varchar(100) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_closed` varchar(3) DEFAULT NULL,
  `deleted` varchar(3) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` VALUES
(40, 'The cost of cybercrime', 'deirderejum', 'none', '2022-12-17 13:57:37', 'no', 'no', 0, 'assets/images/posts/639dcad1419aecostcybercrime.PNG'),
(41, 'Devices and platforms at risk', 'elenavelez', 'none', '2022-12-17 13:59:37', 'no', 'no', 0, 'assets/images/posts/639dcb49340bdplatformsrisk.PNG'),
(44, 'Over 75% of targeted cyberattacks start with an email. (RoundRobin, 2020)\r\n', 'timfinn', 'none', '2022-12-17 18:47:39', 'no', 'no', 0, 'assets/images/posts/639e0ecbaeb24emails.PNG'),
(46, 'Cybercrimes impact in real world', 'timfinn', 'none', '2022-12-17 18:49:19', 'no', 'no', 0, 'assets/images/posts/639e0f2f68575cybercrimes.PNG'),
(47, 'More people are interested in learning cybersecure behaviours', 'saulmoon', 'none', '2022-12-17 18:52:57', 'no', 'no', 0, 'assets/images/posts/639e1009c1215concern.PNG'),
(50, 'It’s been long noted that a hacker attacks every 44 seconds, but their methods of attack are ever evolving. Here are some of the most prominent cyberattack types in recent years', 'elenavelez', 'none', '2022-12-17 22:00:35', 'no', 'no', 0, 'assets/images/posts/639e3c038a9c8glance.PNG');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date_created` date NOT NULL,
  `members_array` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `project_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` VALUES
(1, 'timfinn', 'Enforce Multifactor Authentication in my e-commerce website', '2022-12-01', 'elenavelez,saulmoon,timfinn,', 'open', 'Hi everyone, I am in the second year of my Bachelors in Computing- Web Development. I am creating an e-commerce website and I would like to implement some security features like MF Authentication, would anyone have experience and be interested in giving a', 'Authentication', '');

-- --------------------------------------------------------

--
-- Table structure for table `projectsme`
--

DROP TABLE IF EXISTS `projectsme`;
CREATE TABLE `projectsme` (
  `project_ID` int(11) NOT NULL,
  `SME_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sme`
--

DROP TABLE IF EXISTS `sme`;
CREATE TABLE `sme` (
  `SME_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `degree_Id` int(11) NOT NULL,
  `numberProjects` int(11) NOT NULL,
  `numberPosts` int(11) NOT NULL,
  `adminID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics` (
  `Id` int(11) NOT NULL,
  `topic_name` varchar(100) NOT NULL,
  `topic_description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `signup_date` date NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `num_posts` int(11) NOT NULL,
  `num_bumps` int(11) NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `friend_array` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` VALUES
(1, 'Mike', 'Fuer', 'mikefuer', 'Mike@ncirl.com', '25d55ad283aa400af464c76d713c07ad', '2022-11-27', 'assets/images/profile_pics/default/head_gray.jpg', 0, 0, 'no', ','),
(2, 'Elena', 'Levy', 'elenalevy', 'Elena@ncirl.com', 'f5c90d326bc375e17efee4325dc04b59', '2022-11-27', 'assets/images/profile_pics/default/head_black.png', 0, 0, 'no', ',timfinn,saulmoon,'),
(3, 'Sam', 'Ponds', 'samponds', 'Sam@ncirl.com', '25d55ad283aa400af464c76d713c07ad', '2022-11-27', 'assets/images/profile_pics/default/head_black.png', 0, 0, 'no', ','),
(4, 'Mary', 'Harris', 'maryharris', 'Mary@ncirl.com', 'bf709005906087dc1256bb4449d8774d', '2022-11-27', 'assets/images/profile_pics/default/head_black.png', 0, 0, 'no', ','),
(5, 'Mencia', 'Holmes', 'menciaholmes', 'Meny@ncirl.com', '25d55ad283aa400af464c76d713c07ad', '2022-11-27', 'assets/images/profile_pics/default/head_gray.jpg', 0, 0, 'no', ','),
(6, 'Ulma', 'Kim', 'ulmakim', 'Ulmay@ncirl.com', '22d7fe8c185003c98f97e5d6ced420c7', '2022-11-27', 'assets/images/profile_pics/default/head_gray.jpg', 0, 0, 'no', ','),
(7, 'Stuart', 'Lindon', 'stuartlindon', 'Stuart@ncirl.com', '25d55ad283aa400af464c76d713c07ad', '2022-11-27', 'assets/images/profile_pics/default/head_black.png', 0, 0, 'no', ','),
(8, 'Steve', 'Mikelson', 'stevemikelson', 'Stevie@ncirl.com', 'bf709005906087dc1256bb4449d8774d', '2022-11-27', 'assets/images/profile_pics/default/head_gray.jpg', 0, 0, 'no', ','),
(9, 'Saul', 'Moon', 'saulmoon', 'Saul@ncirl.com', '25d55ad283aa400af464c76d713c07ad', '2022-11-28', 'assets/images/profile_pics/default/head_gray.jpg', 4, 0, 'no', ',elenavelez'),
(10, 'Elena', 'Velez', 'elenavelez', 'Elenavelez@ncirl.com', '25d55ad283aa400af464c76d713c07ad', '2022-11-28', 'assets/images/profile_pics/avatar.png', 34, 0, 'no', ','),
(11, 'Elena', 'Velez', 'elenavelez_1', 'Elenac@ncirl.com', '0c93c7c327a1c72b6bbfc5649c755064', '2022-11-28', 'assets/images/profile_pics/default/head_gray.jpg', 0, 0, 'no', ','),
(12, 'Sisu', 'Lim', 'sisulim', 'Sisu@ncirl.com', '22d7fe8c185003c98f97e5d6ced420c7', '2022-11-28', 'assets/images/profile_pics/default/head_gray.jpg', 0, 0, 'no', ','),
(13, 'Peter', 'Fleming', 'peterfleming', 'Peter@ncirl.com', '25d55ad283aa400af464c76d713c07ad', '2022-11-29', 'assets/images/profile_pics/default/head_black.png', 0, 0, 'no', ','),
(14, 'Tim', 'Finn', 'timfinn', 'Timfinn@ncirl.com', '25d55ad283aa400af464c76d713c07ad', '2022-12-04', 'assets/images/profile_pics/default/head_black.png', 16, 0, 'no', ',elenavelez,'),
(15, 'Mint', 'Min', 'mintmin', 'Minm@ncirl.ie', '25d55ad283aa400af464c76d713c07ad', '2022-12-16', 'assets/images/profile_pics/default/head_black.png', 0, 0, 'no', ','),
(16, 'Maria elena', 'Velez nicolas', 'maria elenavelez nicolas', 'Elenavnicolas@ncirl.ie', '25d55ad283aa400af464c76d713c07ad', '2022-12-16', 'assets/images/profile_pics/default/head_gray.jpg', 0, 0, 'no', ','),
(17, 'Gaby', 'Ming', 'gabyming', 'Gabym@ncirl.ie', '25d55ad283aa400af464c76d713c07ad', '2022-12-16', 'assets/images/profile_pics/default/head_gray.jpg', 0, 0, 'no', ','),
(18, 'Betty', 'Lindon', 'bettylindon', 'Betty@ncirl.ie', '25d55ad283aa400af464c76d713c07ad', '2022-12-16', 'assets/images/profile_pics/default/head_gray.jpg', 0, 0, 'no', ','),
(19, 'Mark', 'Space', 'markspace', 'Marks@ncirl.ie', '25d55ad283aa400af464c76d713c07ad', '2022-12-16', 'assets/images/profile_pics/default/head_black.png', 0, 0, 'no', ','),
(20, 'Fer', 'Lopez', 'ferlopez', 'Fer@ncirl.ie', '25d55ad283aa400af464c76d713c07ad', '2022-12-16', 'assets/images/profile_pics/default/head_gray.jpg', 0, 0, 'no', ','),
(21, 'Niamh', 'Perry', 'niamhperry', 'Nipe@ncirl.ie', '25d55ad283aa400af464c76d713c07ad', '2022-12-16', 'assets/images/profile_pics/default/head_black.png', 0, 0, 'no', ','),
(22, 'Lisa', 'Stan', 'lisastan', 'Lisa@ncirl.ie', '25d55ad283aa400af464c76d713c07ad', '2022-12-16', 'assets/images/profile_pics/default/head_gray.jpg', 0, 0, 'no', ','),
(23, 'Elena', 'Ve', 'elenave', 'Elenavnicolas@gmail.com', '25d55ad283aa400af464c76d713c07ad', '2022-12-16', 'assets/images/profile_pics/default/head_black.png', 0, 0, 'no', ','),
(24, 'Maria elena', 'Velez nicolas', 'maria elenavelez nicolas_1', 'Ee@gmail.com', '25d55ad283aa400af464c76d713c07ad', '2022-12-16', 'assets/images/profile_pics/default/head_gray.jpg', 0, 0, 'no', ','),
(25, 'Un', 'Dos', 'undos', 'Undos@gmail.com', '25d55ad283aa400af464c76d713c07ad', '2022-12-16', 'assets/images/profile_pics/default/head_black.png', 0, 0, 'no', ','),
(26, 'Alana', 'Harris', 'alanaharris', 'Ala@ncirl.com', '25d55ad283aa400af464c76d713c07ad', '2022-12-16', 'assets/images/profile_pics/default/head_gray.jpg', 0, 0, 'no', ','),
(27, 'Maria', 'Pimbi', 'mariapimbi', 'Mari@ncirl.com', '25d55ad283aa400af464c76d713c07ad', '2022-12-16', 'assets/images/profile_pics/default/head_black.png', 0, 0, 'no', ','),
(28, 'June', 'Ger', 'juneger', 'June@ncirl.com', '25d55ad283aa400af464c76d713c07ad', '2022-12-16', 'assets/images/profile_pics/default/head_black.png', 0, 0, 'no', ','),
(29, 'Hui', 'Oln', 'huioln', 'Hu@ncirl.com', '25d55ad283aa400af464c76d713c07ad', '2022-12-16', 'assets/images/profile_pics/default/head_gray.jpg', 0, 0, 'no', ','),
(30, 'Basu', 'Harris', 'basuharris', 'Basu@ncirl.com', '25d55ad283aa400af464c76d713c07ad', '2022-12-17', 'assets/images/profile_pics/default/head_black.png', 0, 0, 'no', ','),
(31, 'Maria elena', 'Velez nicolas', 'maria elenavelez nicolas_1_2', 'Gim@ncirl.com', '25d55ad283aa400af464c76d713c07ad', '2022-12-17', 'assets/images/profile_pics/default/head_gray.jpg', 0, 0, 'no', ','),
(32, 'Olive', 'Ferry', 'oliveferry', 'Olive@ncirl.com', '25d55ad283aa400af464c76d713c07ad', '2022-12-17', 'assets/images/profile_pics/default/head_black.png', 0, 0, 'no', ','),
(34, 'Yuri', 'Lam', 'yurilam', 'Elenavnivolas@gmail.com', '25f9e794323b453885f5181f1b624d0b', '2022-12-17', 'assets/images/profile_pics/default/head_black.png', 0, 0, 'no', ','),
(36, 'Ellen', 'Hye', 'ellenhye', 'X20199651@student.ncirl.ie', '25d55ad283aa400af464c76d713c07ad', '2022-12-17', 'assets/images/profile_pics/default/head_black.png', 0, 0, 'no', ','),
(37, 'Silvia', 'Lange', 'silvialange', 'Sil@ncirl.ie', '25d55ad283aa400af464c76d713c07ad', '2022-12-17', 'assets/images/profile_pics/default/head_black.png', 0, 0, 'no', ','),
(38, 'Deirdere', 'Jum', 'deirderejum', 'Deir@ncirl.ie', '25d55ad283aa400af464c76d713c07ad', '2022-12-17', 'assets/images/profile_pics/default/head_gray.jpg', 2, 0, 'no', ',');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `faculty_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
