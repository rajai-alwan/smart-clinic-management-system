-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 17 يونيو 2026 الساعة 21:40
-- إصدار الخادم: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pms_db`
--

-- --------------------------------------------------------

--
-- بنية الجدول `medicines`
--

CREATE TABLE `medicines` (
  `id` int(11) NOT NULL,
  `medicine_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `medicines`
--

INSERT INTO `medicines` (`id`, `medicine_name`) VALUES
(5, 'Aspirin'),
(6, 'Atorvastatin'),
(4, 'Brufen, Advil'),
(3, 'Losartan'),
(2, 'Mefenamic'),
(7, 'Oxymetazoline'),
(1, 'Panadol, Doliprane'),
(8, 'Suprax'),
(13, 'Trofen 40m'),
(9, 'Zithromax'),
(10, 'اكمول'),
(12, 'ترمدول'),
(11, 'فلتمول');

-- --------------------------------------------------------

--
-- بنية الجدول `medicine_details`
--

CREATE TABLE `medicine_details` (
  `id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `packing` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `medicine_details`
--

INSERT INTO `medicine_details` (`id`, `medicine_id`, `packing`) VALUES
(1, 1, '50'),
(2, 4, '50'),
(3, 5, '50'),
(4, 6, '25'),
(5, 3, '80'),
(6, 2, '100'),
(7, 7, '25'),
(8, 4, '2'),
(9, 8, '75'),
(10, 9, '100'),
(11, 1, '50');

-- --------------------------------------------------------

--
-- بنية الجدول `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `patient_name` varchar(60) NOT NULL,
  `address` varchar(100) NOT NULL,
  `cnic` varchar(17) NOT NULL,
  `date_of_birth` date NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  `gender` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `patients`
--

INSERT INTO `patients` (`id`, `patient_name`, `address`, `cnic`, `date_of_birth`, `phone_number`, `gender`) VALUES
(1, 'يعقوب', 'غزة', '123654789', '1999-06-23', '0599158414', 'ذكر'),
(2, 'احمد', 'غزة', '45671652', '2006-06-16', '0567568481', 'ذكر'),
(3, 'مصطفى', 'غزة', '07147176588', '2000-03-04', '0599146541', 'ذكر'),
(4, 'محمد', 'غزة', '00943715', '2018-06-07', '0599418690', 'ذكر'),
(5, 'امير', 'غزة', '802335415', '2020-08-05', '0599252454', 'ذكر'),
(6, 'محمود', 'غزة', '963258741', '2012-01-14', '0599418690', 'ذكر'),
(7, 'كنان', 'غزة', '976662529', '2005-06-02', '0599418690', 'ذكر');

-- --------------------------------------------------------

--
-- بنية الجدول `patient_medication_history`
--

CREATE TABLE `patient_medication_history` (
  `id` int(11) NOT NULL,
  `patient_visit_id` int(11) NOT NULL,
  `medicine_details_id` int(11) NOT NULL,
  `quantity` tinyint(4) NOT NULL,
  `dosage` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `patient_medication_history`
--

INSERT INTO `patient_medication_history` (`id`, `patient_visit_id`, `medicine_details_id`, `quantity`, `dosage`) VALUES
(1, 1, 1, 5, '250'),
(2, 1, 6, 2, '500'),
(3, 2, 2, 2, '250'),
(4, 2, 7, 2, '250'),
(5, 5, 2, 50, '1'),
(6, 8, 1, 15, '1'),
(7, 8, 5, 50, '2'),
(8, 9, 2, 15, '20'),
(9, 10, 5, 50, '3');

-- --------------------------------------------------------

--
-- بنية الجدول `patient_visits`
--

CREATE TABLE `patient_visits` (
  `id` int(11) NOT NULL,
  `visit_date` date NOT NULL,
  `next_visit_date` date DEFAULT NULL,
  `bp` varchar(23) NOT NULL,
  `weight` varchar(12) NOT NULL,
  `disease` varchar(30) NOT NULL,
  `patient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `patient_visits`
--

INSERT INTO `patient_visits` (`id`, `visit_date`, `next_visit_date`, `bp`, `weight`, `disease`, `patient_id`) VALUES
(1, '2022-06-28', '2022-06-30', '120/80', '65 kg.', 'Wounded Arm', 1),
(2, '2022-06-30', '2022-07-02', '120/80', '65 kg.', 'Rhinovirus', 1),
(5, '2022-10-05', '2022-10-29', 'Ø·Ø¨ÙŠØ¹ÙŠ', '85', 'no', 1),
(8, '2022-10-05', '2022-10-21', 'Ø·Ø¨ÙŠØ¹ÙŠ', '85', 'no', 1),
(9, '2022-10-06', '2022-10-19', 'Ø·Ø¨ÙŠØ¹ÙŠ', '85', 'no', 1),
(10, '2025-01-23', '2025-01-23', '15', '65', 'جيدة', 4);

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `display_name` varchar(30) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `profile_picture` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`id`, `display_name`, `user_name`, `password`, `profile_picture`) VALUES
(1, 'محمد', 'محمد', '202cb962ac59075b964b07152d234b70', '1656551981avatar.png '),
(2, 'خميس', 'خميس', '762701e2a2e6eb210c1492fabde42908', '1656551999avatar_.png'),
(3, 'rajai', 'رجائي', 'ac7ec538efb19daf36b2070fb9b567b2', '17410536941656551981avatar.png'),
(7, 'رجائي علوان', 'rajai1', '0599418690', '176830570022.png'),
(8, 'رجائي', 'R', '827ccb0eea8a706c4c34a16891f84e7b', '1768389116حمزه حلس.png ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `medicine_name` (`medicine_name`);

--
-- Indexes for table `medicine_details`
--
ALTER TABLE `medicine_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_medicine_details_medicine_id` (`medicine_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_medication_history`
--
ALTER TABLE `patient_medication_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_patient_medication_history_patients_visits_id` (`patient_visit_id`),
  ADD KEY `fk_patient_medication_history_medicine_details_id` (`medicine_details_id`);

--
-- Indexes for table `patient_visits`
--
ALTER TABLE `patient_visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_patients_visit_patient_id` (`patient_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `medicine_details`
--
ALTER TABLE `medicine_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `patient_medication_history`
--
ALTER TABLE `patient_medication_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `patient_visits`
--
ALTER TABLE `patient_visits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- قيود الجداول المُلقاة.
--

--
-- قيود الجداول `medicine_details`
--
ALTER TABLE `medicine_details`
  ADD CONSTRAINT `fk_medicine_details_medicine_id` FOREIGN KEY (`medicine_id`) REFERENCES `medicines` (`id`);

--
-- قيود الجداول `patient_medication_history`
--
ALTER TABLE `patient_medication_history`
  ADD CONSTRAINT `fk_patient_medication_history_medicine_details_id` FOREIGN KEY (`medicine_details_id`) REFERENCES `medicine_details` (`id`),
  ADD CONSTRAINT `fk_patient_medication_history_patients_visits_id` FOREIGN KEY (`patient_visit_id`) REFERENCES `patient_visits` (`id`);

--
-- قيود الجداول `patient_visits`
--
ALTER TABLE `patient_visits`
  ADD CONSTRAINT `fk_patients_visit_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
