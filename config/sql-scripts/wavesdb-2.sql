-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2019 at 11:52 PM
-- Server version: 8.0.12
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
-- Database: `wavesdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `text` text,
  `state` enum('WAITING','ACCEPTED','REJECTED') NOT NULL DEFAULT 'WAITING',
  `poolevent_id` int(11) NOT NULL,
  `edited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `user_id`, `text`, `state`, `poolevent_id`, `edited_at`, `created_at`) VALUES
(1, 1, 'lorem ipsum', 'WAITING', 298, '2019-11-18 20:13:56', '2019-11-18 20:13:56'),
(2, 1, 'lorem ipsum', 'REJECTED', 304, '2019-11-19 21:24:33', '2019-11-18 21:01:29'),
(3, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.', 'ACCEPTED', 304, '2019-11-19 21:27:14', '2019-11-18 21:32:03'),
(4, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.', 'REJECTED', 306, '2019-11-20 21:33:25', '2019-11-20 08:56:27'),
(5, 1, 'lkfsadkjhfslkshfkihjsöifgjslkijgkrdhjlgkjdlkjflkdsjlkfjslkjfkjdslkfjdnflksjdflkjsd', 'ACCEPTED', 344, '2019-11-24 17:46:58', '2019-11-21 19:04:54');

-- --------------------------------------------------------

--
-- Table structure for table `badges`
--

CREATE TABLE `badges` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `desc` text,
  `type` enum('comments','poolevents','votes','connections','profiles') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `img_url` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `badges`
--

INSERT INTO `badges` (`id`, `name`, `desc`, `type`, `created_at`, `edited_at`, `img_url`) VALUES
(54, 'first poolevent', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.', 'poolevents', '2019-11-21 17:05:10', '2019-11-21 17:05:10', 'https://i.ibb.co/CWVHL1p/badges.png '),
(55, 'comment', 'comment', 'comments', '2019-11-21 17:20:11', '2019-11-21 17:20:11', ' https://i.ibb.co/2qwf5L9/game-badges-4.png'),
(56, 'profile', 'profile', 'profiles', '2019-11-21 17:20:53', '2019-11-21 17:20:53', 'https://i.ibb.co/3kM9YkF/Badges-Mileston-Profile.png');

-- --------------------------------------------------------

--
-- Table structure for table `badge_progress`
--

CREATE TABLE `badge_progress` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `progress` int(11) NOT NULL DEFAULT '0',
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` enum('comments','connections','votes','poolevents','profiles') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `badge_progress`
--

INSERT INTO `badge_progress` (`id`, `user_id`, `badge_id`, `progress`, `completed`, `created_at`, `edited_at`, `type`) VALUES
(166, 1, 54, 3, 1, '2019-11-21 17:05:10', '2019-11-24 17:41:12', 'poolevents'),
(167, 2, 54, 0, 0, '2019-11-21 17:05:10', '2019-11-21 17:05:10', 'poolevents'),
(168, 1, 55, 3, 1, '2019-11-21 17:20:12', '2019-11-24 17:47:30', 'comments'),
(169, 2, 55, 0, 0, '2019-11-21 17:20:12', '2019-11-21 17:20:12', 'comments'),
(170, 1, 56, 0, 0, '2019-11-21 17:20:53', '2019-11-21 17:20:53', 'profiles'),
(171, 2, 56, 0, 0, '2019-11-21 17:20:53', '2019-11-21 17:20:53', 'profiles');

-- --------------------------------------------------------

--
-- Table structure for table `challenges`
--

CREATE TABLE `challenges` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `desc` text,
  `badge_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` enum('comments','poolevents','votes','connections','profiles') NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `edited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `challenges`
--

INSERT INTO `challenges` (`id`, `name`, `desc`, `badge_id`, `created_at`, `type`, `points`, `edited_at`) VALUES
(43, 'poolevent', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.', 54, '2019-11-21 17:05:10', 'poolevents', 1, '2019-11-21 17:05:10'),
(44, 'comment', 'comment', 55, '2019-11-21 17:20:12', 'comments', 1, '2019-11-21 17:20:12'),
(45, 'profile', 'profile', 56, '2019-11-21 17:20:53', 'profiles', 4, '2019-11-21 17:20:53');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `poolevent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `text`, `user_id`, `poolevent_id`, `created_at`, `edited_at`, `comment_id`) VALUES
(42, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.', 1, 344, '2019-11-22 09:23:03', '2019-11-22 09:23:03', NULL),
(43, 'lorem300;', 1, 345, '2019-11-23 21:44:56', '2019-11-23 21:44:56', NULL),
(44, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui.', 1, 344, '2019-11-24 17:47:30', '2019-11-24 17:47:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `connections`
--

CREATE TABLE `connections` (
  `id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `descriptions`
--

CREATE TABLE `descriptions` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `html` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `poolevent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `descriptions`
--

INSERT INTO `descriptions` (`id`, `text`, `html`, `created_at`, `edited_at`, `poolevent_id`) VALUES
(249, '', '<p>loremlorem</p>', '2019-11-21 17:34:46', '2019-11-21 17:34:46', 344),
(250, '', '<p>lorelorem</p>', '2019-11-22 16:31:42', '2019-11-22 16:31:42', 345),
(251, '', '<p>lorem lorem</p>', '2019-11-24 17:41:12', '2019-11-24 17:41:12', 346);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `poolevent_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `poolevent_id`, `user_id`, `created_at`) VALUES
(15, 344, 1, '2019-11-22 08:34:57'),
(17, 345, 1, '2019-11-22 16:33:57');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `poolevent_id` int(11) NOT NULL,
  `street_name` varchar(45) NOT NULL,
  `street_number` varchar(45) NOT NULL,
  `full_address` varchar(45) DEFAULT NULL,
  `long` varchar(45) NOT NULL,
  `lat` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `country` varchar(45) DEFAULT NULL,
  `post_code` varchar(45) DEFAULT NULL,
  `desc` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `poolevent_id`, `street_name`, `street_number`, `full_address`, `long`, `lat`, `city`, `country`, `post_code`, `desc`) VALUES
(274, 344, 'Lothstraße', '12', NULL, '11.54889030000004', '48.1510766', 'München', 'Deutschland', '80335', 'loremlorem'),
(275, 345, 'Bernauer Straße', '21', NULL, '13.291279400000008', '52.5753501', 'Berlin', 'Deutschland', '13507', ''),
(276, 346, 'Am Hauptbahnhof', '12', NULL, '8.664729999999963', '50.10814', 'Frankfurt am Main', 'Deutschland', '60329', 'Am Hauptbahnhof 12, Frankfurt am Main, Deutschland');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` enum('PE_NEW','PE_RELEASED','PE_CANCELLED','NEW_COMMENT','NEW_VOTE','APPLICATION_REJECTED','APPLICATION_ACCEPETED','UNLOCKED_ACHIEVEMENT','NEW_ACHIEVEMENT_ADDED') NOT NULL COMMENT 'ENUM(''PE_NEW'', \\n''PE_RELEASED'',\\n ''PE_CANCELLED'', \\n''NEW_COMMENT'', \\n''NEW_VOTE'', \\n''APPLICATION_REJECTED'',\\n ''APPLICATION_ACCEPETED’,\\n)',
  `desc` text,
  `source_id` int(11) NOT NULL,
  `dirty` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `type`, `desc`, `source_id`, `dirty`, `created_at`) VALUES
(415, 1, 'PE_NEW', NULL, 344, 1, '2019-11-21 17:34:46'),
(416, 2, 'PE_NEW', NULL, 344, 0, '2019-11-21 17:34:46'),
(417, 1, 'UNLOCKED_ACHIEVEMENT', NULL, 0, 1, '2019-11-21 17:34:46'),
(418, 2, 'UNLOCKED_ACHIEVEMENT', NULL, 0, 0, '2019-11-21 17:34:46'),
(419, 1, 'UNLOCKED_ACHIEVEMENT', NULL, 0, 1, '2019-11-22 09:23:04'),
(420, 2, 'UNLOCKED_ACHIEVEMENT', NULL, 0, 0, '2019-11-22 09:23:04'),
(421, 1, 'PE_NEW', NULL, 345, 1, '2019-11-22 16:31:42'),
(422, 2, 'PE_NEW', NULL, 345, 0, '2019-11-22 16:31:42'),
(423, 1, 'PE_NEW', NULL, 346, 1, '2019-11-24 17:41:12'),
(424, 2, 'PE_NEW', NULL, 346, 0, '2019-11-24 17:41:12');

-- --------------------------------------------------------

--
-- Table structure for table `notification_poolevents`
--

CREATE TABLE `notification_poolevents` (
  `idnotification_poolevents` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `poolevents`
--

CREATE TABLE `poolevents` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `event_start` datetime DEFAULT NULL,
  `event_end` datetime DEFAULT NULL,
  `application_start` datetime DEFAULT NULL,
  `application_end` datetime DEFAULT NULL,
  `asp_event_Id` int(11) DEFAULT NULL,
  `website` text,
  `supporter_lim` int(11) DEFAULT '0',
  `active_user_only` tinyint(1) DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `edited_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` enum('UNRELEASED','RELEASED','REJECTED','DRAFT') NOT NULL DEFAULT 'UNRELEASED',
  `type` enum('FESTIVAL','GOLDEIMER_FESTIVAL','RUN4WASH','CONCERT','OTHER') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `poolevents`
--

INSERT INTO `poolevents` (`id`, `name`, `created_at`, `event_start`, `event_end`, `application_start`, `application_end`, `asp_event_Id`, `website`, `supporter_lim`, `active_user_only`, `user_id`, `edited_at`, `state`, `type`) VALUES
(344, 'lorem', '2019-11-21 17:34:46', '2019-11-21 17:34:19', '2019-11-21 17:34:20', '2019-11-21 17:34:42', '2019-11-21 17:34:43', 0, 'loremlorem', 1, 0, 1, '2019-11-21 17:35:39', 'RELEASED', 'FESTIVAL'),
(345, 'Tocotronic', '2019-11-22 16:31:42', '2019-11-22 16:31:16', '2019-11-22 16:31:17', '2019-11-22 16:31:36', '2019-11-22 16:31:37', 0, 'www.tocotronic.com', 4, 0, 1, '2019-11-22 16:32:26', 'RELEASED', 'FESTIVAL'),
(346, 'Schönhauser allee', '2019-11-24 17:41:12', '2019-11-24 17:40:39', '2019-11-24 17:40:40', '2019-11-24 17:41:06', '2019-11-24 17:41:07', 0, 'www.a9.com', 1, 0, 1, '2019-11-24 20:42:36', 'RELEASED', 'GOLDEIMER_FESTIVAL');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email_address` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `created_at`, `edited_at`, `email_address`, `age`) VALUES
(1, 'John', 'Doe', '2019-11-06 21:53:08', '2019-11-06 21:53:08', 'john.doe@scoop.com', NULL),
(2, 'Jane', 'Doe', '2019-11-07 11:46:49', '2019-11-07 11:46:49', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `user_id`, `created_at`, `comment_id`) VALUES
(21, 1, '2019-11-22 10:37:32', 42),
(23, 1, '2019-11-23 21:45:01', 43),
(24, 1, '2019-11-24 17:47:36', 44);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_poolevent_idx` (`poolevent_id`),
  ADD KEY `fk_user_idx` (`user_id`);

--
-- Indexes for table `badges`
--
ALTER TABLE `badges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `badge_progress`
--
ALTER TABLE `badge_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_badge_progress` (`user_id`,`badge_id`);

--
-- Indexes for table `challenges`
--
ALTER TABLE `challenges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_challenges` (`badge_id`,`points`,`type`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_poolevent_idx` (`poolevent_id`),
  ADD KEY `fk_user_id_idx` (`user_id`);

--
-- Indexes for table `connections`
--
ALTER TABLE `connections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `descriptions`
--
ALTER TABLE `descriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `uq_favorites` (`user_id`,`poolevent_id`),
  ADD UNIQUE KEY `uq_waves_p_u` (`poolevent_id`,`user_id`),
  ADD KEY `userfave_idx` (`user_id`),
  ADD KEY `poolevent_fave_idx` (`poolevent_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_poolevents`
--
ALTER TABLE `notification_poolevents`
  ADD PRIMARY KEY (`idnotification_poolevents`);

--
-- Indexes for table `poolevents`
--
ALTER TABLE `poolevents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_votes` (`user_id`,`comment_id`),
  ADD KEY `fk_uservote_id_idx` (`user_id`),
  ADD KEY `fk_votecomment_id_idx` (`comment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `badges`
--
ALTER TABLE `badges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `badge_progress`
--
ALTER TABLE `badge_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `challenges`
--
ALTER TABLE `challenges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `descriptions`
--
ALTER TABLE `descriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;

--
-- AUTO_INCREMENT for table `notification_poolevents`
--
ALTER TABLE `notification_poolevents`
  MODIFY `idnotification_poolevents` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poolevents`
--
ALTER TABLE `poolevents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=347;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_poolevent` FOREIGN KEY (`poolevent_id`) REFERENCES `poolevents` (`id`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `poolevent_fave` FOREIGN KEY (`poolevent_id`) REFERENCES `poolevents` (`id`),
  ADD CONSTRAINT `userfave` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `fk_uservote_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_votecomment_id` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
