-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2025 at 09:22 PM
-- Server version: MySQL
-- PHP Version: 8.01

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
DROP DATABASE IF EXISTS survey_db;
CREATE DATABASE survey_db;
USE survey_db;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
--
-- Database: `survey_db`
--
-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(30) NOT NULL,
  `survey_id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `answer` text NOT NULL,
  `question_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
);

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `survey_id`, `user_id`, `answer`, `question_id`, `date_created`) VALUES
(1, 1, 2, 'Sample Only', 4, '2020-11-10 14:46:07');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(30) NOT NULL,
  `question` text NOT NULL,
  `type` varchar(50) NOT NULL,
  `survey_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
);

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(30) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(50) NOT NULL,
  `survey_id` int(30) NOT NULL,
  `question_id` int(30) NOT NULL
);


INSERT INTO questions (id, question, type, survey_id, date_created) VALUES
(1, 'What is your favorite programming language?', 'Single Choice', 1, CURRENT_TIMESTAMP),
(2, 'How often do you use social media?', 'Single Choice', 1, CURRENT_TIMESTAMP),
(3, 'Rate your satisfaction with the service.', 'Rating', 2, CURRENT_TIMESTAMP),
(4, 'What features would you like to see in the next version?', 'Multiple Choice', 2, CURRENT_TIMESTAMP);


INSERT INTO options (id, value, type, survey_id, question_id) VALUES
-- Options for Question 1 (What is your favorite programming language?)
(1, 'Python', 'Choice', 1, 1),
(2, 'Java', 'Choice', 1, 1),
(3, 'JavaScript', 'Choice', 1, 1),
(4, 'C++', 'Choice', 1, 1),

-- Options for Question 2 (How often do you use social media?)
(5, 'Daily', 'Choice', 1, 2),
(6, 'Weekly', 'Choice', 1, 2),
(7, 'Monthly', 'Choice', 1, 2),
(8, 'Rarely', 'Choice', 1, 2),

-- Options for Question 3 (Rate your satisfaction with the service.)
(9, 'Very Satisfied', 'Choice', 2, 3),
(10, 'Satisfied', 'Choice', 2, 3),
(11, 'Neutral', 'Choice', 2, 3),
(12, 'Dissatisfied', 'Choice', 2, 3),
(13, 'Very Dissatisfied', 'Choice', 2, 3),

-- Options for Question 4 (What features would you like to see in the next version?)
(14, 'Better performance', 'Choice', 2, 4),
(15, 'New features', 'Choice', 2, 4),
(16, 'Bug fixes', 'Choice', 2, 4),
(17, 'UI improvements', 'Choice', 2, 4);


--
-- Table structure for table `survey_set`
--

CREATE TABLE `survey_set` (
  `id` int(30) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
);

--
-- Dumping data for table `survey_set`
--

INSERT INTO `survey_set` (`id`, `title`, `description`, `start_date`, `end_date`, `date_created`) VALUES
(1, 'Employee Satisfaction Survey', 'This survey aims to gather feedback on employee satisfaction, including workplace environment, work-life balance, and leadership effectiveness. Your honest responses will help us improve employee experience.', '2025-04-01', '2025-04-30', '2025-03-25 10:00:00'),
(2, 'Customer Feedback on Product X', 'We value your feedback on Product X! Please take a moment to share your experience using the product, your satisfaction level, and any improvements you would suggest.', '2025-04-05', '2025-04-25', '2025-03-25 10:30:00'),
(3, 'Annual Employee Engagement Survey', 'We are looking to assess employee engagement levels across various departments. This survey will focus on professional development, communication, and company culture.', '2025-05-01', '2025-05-15', '2025-03-26 08:45:00'),
(4, 'Health & Wellness Feedback', 'Help us improve our health and wellness programs by completing this short survey. Your feedback will guide our wellness initiatives, including fitness programs and mental health resources.', '2025-04-10', '2025-04-20', '2025-03-26 09:15:00'),
(5, 'Market Research on New Product Idea', 'We are researching a potential new product. Share your thoughts, preferences, and needs regarding the product to help us make informed decisions before launching.', '2025-03-28', '2025-04-18', '2025-03-27 11:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `middlename` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1=Admin,2 = Staff, 3= Subscriber',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
);

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `middlename`, `contact`, `address`, `email`, `password`, `type`, `date_created`) VALUES
(1, 'Admin', 'Admin', '', '+123456789', 'Sample address', 'admin@admin.com', '0192023a7bbd73250516f069df18b500', 1, '2020-11-10 08:43:06'),
(2, 'Lukas', 'Müller', 'F', '+436501234567', 'Wien, Mariahilferstraße 25', 'lukas.mueller@email.com', '5d41402abc4b2a76b9719d911017c592', 3, '2025-03-27 10:00:00'),
(3, 'Anna', 'Schmidt', 'K', '+436761234567', 'Graz, Jakominiplatz 3', 'anna.schmidt@email.com', '7d2f8493b6b729038d911bb1938242da', 3, '2025-03-27 10:05:00'),
(4, 'Max', 'Huber', '', '+436601234567', 'Linz, Landstraße 44', 'max.huber@email.com', 'a4a8aebf4313a0d97b4b626728d941c4', 3, '2025-03-27 10:10:00'),
(5, 'Sophie', 'Lehner', 'M', '+436991234567', 'Salzburg, Getreidegasse 12', 'sophie.lehner@email.com', 'd02f9c4d8d22a2b95a71e303b7c3ec6d', 3, '2025-03-27 10:15:00'),
(6, 'Thomas', 'Fischer', '', '+436641234567', 'Innsbruck, Maria-Theresien-Straße 30', 'thomas.fischer@email.com', '8e1f60145c1fa212cc3a9da378632b0c', 3, '2025-03-27 10:20:00'),
(7, 'Eva', 'Pichler', 'L', '+436991234567', 'Wien, Praterstraße 10', 'eva.pichler@email.com', 'baad7de0b9a5ef91268a48c6fa5da7ea', 3, '2025-03-27 10:25:00'),
(8, 'Jakob', 'Bauer', 'P', '+436801234567', 'Klagenfurt, Heuplatz 2', 'jakob.bauer@email.com', 'b84cc49fcd43052d7a3e089b693b8b9d', 3, '2025-03-27 10:30:00'),
(9, 'Mia', 'Haas', 'T', '+436771234567', 'Graz, Lendplatz 7', 'mia.haas@email.com', 'c98c29802cfa9b249a34be08de45fcf5', 3, '2025-03-27 10:35:00'),
(10, 'Felix', 'Koch', '', '+436991234567', 'Linz, Hauptstraße 9', 'felix.koch@email.com', 'e75d573c70c9288b50167439fcbf24e9', 3, '2025-03-27 10:40:00'),
(11, 'Laura', 'Jäger', 'K', '+436771234567', 'Vienna, Neubaugasse 12', 'laura.jaeger@email.com', '1e6bb9899abf9e5a68e56e4535e0b091', 3, '2025-03-27 10:45:00');
--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey_set`
--
ALTER TABLE `survey_set`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `survey_set`
--
ALTER TABLE `survey_set`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
