-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 04. Nov 2019 um 21:41
-- Server-Version: 8.0.12
-- PHP-Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `wavesdb`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `text` varchar(45) DEFAULT NULL,
  `state` enum('waiting_list,accepted,rejected') DEFAULT NULL,
  `poolevent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `badges`
--

CREATE TABLE `badges` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `desc` varchar(45) DEFAULT NULL,
  `challenge_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `challenges`
--

CREATE TABLE `challenges` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `desc` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `text` varchar(45) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vote` int(11) DEFAULT NULL,
  `poolevent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `comments`
--

INSERT INTO `comments` (`id`, `text`, `user_id`, `vote`, `poolevent_id`) VALUES
(1, 'scoop', NULL, NULL, 1),
(2, 'scoop', NULL, NULL, 1),
(3, 'scoop', NULL, NULL, 1),
(4, 'scoop', NULL, NULL, 1),
(5, 'scoop', NULL, NULL, 1),
(6, 'scoop', NULL, NULL, 1),
(7, 'scoop', NULL, NULL, 2),
(8, 'scoop', NULL, NULL, 2),
(9, 'scoop', NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `connections`
--

CREATE TABLE `connections` (
  `id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `descriptions`
--

CREATE TABLE `descriptions` (
  `id` int(11) NOT NULL,
  `text` varchar(45) DEFAULT NULL,
  `html` varchar(45) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `editedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `poolevent_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `poolevent_id` int(11) NOT NULL,
  `street_name` varchar(45) DEFAULT NULL,
  `street_number` varchar(45) DEFAULT NULL,
  `full_address` varchar(45) DEFAULT NULL,
  `long` varchar(45) DEFAULT NULL,
  `lat` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `land` varchar(45) DEFAULT NULL,
  `post_code` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `locations`
--

INSERT INTO `locations` (`id`, `poolevent_id`, `street_name`, `street_number`, `full_address`, `long`, `lat`, `city`, `land`, `post_code`) VALUES
(1, 20, 'its a mee', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 23, 'noli', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `poolevents`
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
  `website` varchar(45) DEFAULT NULL,
  `supporter_lim` int(11) DEFAULT NULL,
  `active_user_only` binary(1) DEFAULT NULL,
  `descId` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `edited_at` datetime DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `poolevents`
--

INSERT INTO `poolevents` (`id`, `name`, `created_at`, `event_start`, `event_end`, `application_start`, `application_end`, `asp_event_Id`, `website`, `supporter_lim`, `active_user_only`, `descId`, `user_id`, `edited_at`, `location_id`) VALUES
(1, 'scoop', '2019-10-30 19:27:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(2, 'scoop', '2019-10-30 19:28:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(19, 'scoop', '2019-10-30 19:40:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(21, 'scoop', '2019-10-31 12:48:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'tocotronic', '2019-10-31 13:53:54', NULL, NULL, NULL, NULL, NULL, 'www.scoop.com', NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'tocotronic', '2019-10-31 13:54:45', NULL, NULL, NULL, NULL, NULL, 'www.scoop.com', NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'tocotronic', '2019-10-31 17:03:42', NULL, NULL, NULL, NULL, NULL, 'www.scoop.com', NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'scoop', '2019-11-01 10:32:01', NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'its a mee', '2019-11-01 10:35:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(30, 'scoop', '2019-11-01 15:15:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(31, 'scoop', '2019-11-01 15:17:36', NULL, NULL, NULL, NULL, 1, 'ascasda', 12, 0x30, NULL, 0, NULL, NULL),
(32, 'scoop', '2019-11-01 15:28:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vote`
--

CREATE TABLE `vote` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_poolevent_idx` (`poolevent_id`),
  ADD KEY `fk_user_idx` (`user_id`);

--
-- Indizes für die Tabelle `badges`
--
ALTER TABLE `badges`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `challenges`
--
ALTER TABLE `challenges`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_poolevent_idx` (`poolevent_id`),
  ADD KEY `fk_user_id_idx` (`user_id`);

--
-- Indizes für die Tabelle `connections`
--
ALTER TABLE `connections`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `descriptions`
--
ALTER TABLE `descriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indizes für die Tabelle `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userfave_idx` (`user_id`),
  ADD KEY `poolevent_fave_idx` (`poolevent_id`);

--
-- Indizes für die Tabelle `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indizes für die Tabelle `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `poolevents`
--
ALTER TABLE `poolevents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poolevent_location_idx` (`location_id`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_uservote_id_idx` (`user_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `descriptions`
--
ALTER TABLE `descriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `poolevents`
--
ALTER TABLE `poolevents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `vote`
--
ALTER TABLE `vote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_poolevent` FOREIGN KEY (`poolevent_id`) REFERENCES `poolevents` (`id`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints der Tabelle `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `poolevent_fave` FOREIGN KEY (`poolevent_id`) REFERENCES `poolevents` (`id`),
  ADD CONSTRAINT `userfave` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints der Tabelle `poolevents`
--
ALTER TABLE `poolevents`
  ADD CONSTRAINT `poolevent_location` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

--
-- Constraints der Tabelle `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `fk_uservote_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
