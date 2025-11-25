-- Use the correct database
USE VEHICLE_RENTAL_MANAGEMENT_SYSTEM;

-- Temporarily disable foreign key checks
SET FOREIGN_KEY_CHECKS=0;

-- Admin table
CREATE TABLE `admin` (
`ADMIN_ID` varchar(255) NOT NULL,
`ADMIN_PASSWORD` varchar(255) NOT NULL,
PRIMARY KEY (`ADMIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `admin` (`ADMIN_ID`, `ADMIN_PASSWORD`) VALUES
('admin', 'admin123');

-- Users table
CREATE TABLE `users` (
`FNAME` varchar(255) NOT NULL,
`EMAIL` varchar(255) NOT NULL,
`LIC_NUM` varchar(255) NOT NULL,
`PHONE_NUMBER` bigint(20) NOT NULL,
`PASSWORD` varchar(255) NOT NULL,
`GENDER` varchar(255) NOT NULL,
PRIMARY KEY (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `users` (`FNAME`, `EMAIL`, `LIC_NUM`, `PHONE_NUMBER`, `PASSWORD`, `GENDER`) VALUES
('hima', '[broitsmemam@gmail.com](mailto:broitsmemam@gmail.com)', 'AP22 123456789012', 9696969696, '1234', ''),
('akshay', '[broitsmeman@gmail.com](mailto:broitsmeman@gmail.com)', 'AP22 123456789012', 9696969690, '12345', ''),
('david', '[hero1234@gmail.com](mailto:hero1234@gmail.com)', 'AP22 123456789012', 9696969696, 'hero', ''),
('himakar', '[himakar2005@gmail.com](mailto:himakar2005@gmail.com)', 'AP22 123456789028', 9000908409, '12345', ''),
('swasthik', '[swasthik@gmail.com](mailto:swasthik@gmail.com)', 'B2356', 987654321, '123', 'male'),
('varshith', '[varshithvh@gmail.com](mailto:varshithvh@gmail.com)', 'B3uudh4', 6363549133, '234', 'male');

-- Cars table
CREATE TABLE `cars` (
`CAR_ID` int(11) NOT NULL AUTO_INCREMENT,
`CAR_NAME` varchar(255) NOT NULL,
`FUEL_TYPE` varchar(255) NOT NULL,
`CAPACITY` int(11) NOT NULL,
`PRICE` int(11) NOT NULL,
`CAR_IMG` varchar(255) NOT NULL,
`AVAILABLE` varchar(255) NOT NULL,
PRIMARY KEY (`CAR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `cars` (`CAR_ID`, `CAR_NAME`, `FUEL_TYPE`, `CAPACITY`, `PRICE`, `CAR_IMG`, `AVAILABLE`) VALUES
(1, 'FERR', 'PETROL', 5, 5000, 'ferrari.jpg', 'Y'),
(2, 'LAMBORGINI', 'petrol', 6, 7344, 'lambo.jpg', 'N'),
(20, 'MAHINDRA', 'DEISEL', 4, 3500, 'mahe.jpg', 'Y'),
(457, 'ROLLS ROYCE ', 'PETROL', 4, 5000, 'rolls.jpg', 'N'),
(458, 'Koenseg', 'petrol', 2, 6000, 'koin.jpg', 'Y'),
(459, 'Porsche', 'Gas', 2, 5500, 'IMG-663c94bda58230.17423553.jpg', 'Y'),
(460, 'ROLLS ROYCE ', 'Water', 4, 30000, 'IMG-663de755d349d2.52779112.jpg', 'Y'),
(461, 'Koenseg', 'oil', 4, 45508, 'IMG-664396feda8ba3.46070147.jpg', 'Y'),
(462, 'ferrrari', 'Gas', 2, 2345, 'IMG-66439ccc1255e7.22617557.jpg', 'Y');

-- Booking table
CREATE TABLE `booking` (
`BOOK_ID` int(11) NOT NULL AUTO_INCREMENT,
`CAR_ID` int(11) NOT NULL,
`EMAIL` varchar(255) NOT NULL,
`BOOK_PLACE` varchar(255) NOT NULL,
`BOOK_DATE` date NOT NULL,
`DURATION` int(11) NOT NULL,
`PHONE_NUMBER` bigint(20) NOT NULL,
`DESTINATION` varchar(255) NOT NULL,
`RETURN_DATE` date NOT NULL,
`PRICE` int(11) NOT NULL,
`BOOK_STATUS` varchar(255) NOT NULL DEFAULT 'UNDER PROCESSING',
PRIMARY KEY (`BOOK_ID`),
KEY `CAR_ID` (`CAR_ID`),
KEY `EMAIL` (`EMAIL`),
CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`CAR_ID`) REFERENCES `cars` (`CAR_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`EMAIL`) REFERENCES `users` (`EMAIL`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `booking` (`BOOK_ID`, `CAR_ID`, `EMAIL`, `BOOK_PLACE`, `BOOK_DATE`, `DURATION`, `PHONE_NUMBER`, `DESTINATION`, `RETURN_DATE`, `PRICE`, `BOOK_STATUS`) VALUES
(66, 2, '[swasthik@gmail.com](mailto:swasthik@gmail.com)', 'bangalore', '2022-03-22', 5, 6363549133, 'moodabidri', '2022-04-09', 35000, 'RETURNED'),
(68, 1, '[varshithvh@gmail.com](mailto:varshithvh@gmail.com)', 'mysore', '2022-03-22', 10, 6363549133, 'moodabidri', '2022-04-02', 50000, 'RETURNED'),
(71, 20, '[himakar2005@gmail.com](mailto:himakar2005@gmail.com)', 'vijayawada', '2024-05-09', 2, 9000908409, 'guntur', '2024-05-11', 2000, 'RETURNED'),
(72, 2, '[himakar2005@gmail.com](mailto:himakar2005@gmail.com)', 'vijayawada', '2024-05-09', 5, 9000908409, 'guntur', '2024-05-14', 35000, 'RETURNED'),
(73, 457, '[himakar2005@gmail.com](mailto:himakar2005@gmail.com)', 'vijayawada', '2024-05-09', 5, 9000908409, 'guntur', '2024-05-14', 25000, 'RETURNED'),
(76, 20, '[himakar2005@gmail.com](mailto:himakar2005@gmail.com)', 'vijayawada', '2024-05-09', 10, 9000908409, 'guntur', '2024-05-19', 35000, 'RETURNED'),
(78, 458, '[hero1234@gmail.com](mailto:hero1234@gmail.com)', 'vijayawada', '2024-05-10', 5, 9696969696, 'goa', '2024-05-15', 30000, 'RETURNED'),
(79, 2, '[himakar2005@gmail.com](mailto:himakar2005@gmail.com)', 'vijayawada', '2024-05-10', 5, 9696969696, 'guntur', '2024-05-18', 35000, 'UNDER PROCESSING'),
(81, 457, '[broitsmeman@gmail.com](mailto:broitsmeman@gmail.com)', 'vijayawada', '2024-05-10', 5, 9696969690, 'goa', '2024-05-15', 25000, 'APPROVED'),
(82, 2, '[broitsmemam@gmail.com](mailto:broitsmemam@gmail.com)', 'vijayawada', '2024-05-14', 5, 9696969696, 'goa', '2024-05-19', 35000, 'APPROVED');

-- Feedback table
CREATE TABLE `feedback` (
`FED_ID` int(11) NOT NULL AUTO_INCREMENT,
`EMAIL` varchar(255) NOT NULL,
`COMMENT` text NOT NULL,
PRIMARY KEY (`FED_ID`),
CONSTRAINT `TEST` FOREIGN KEY (`EMAIL`) REFERENCES `users` (`EMAIL`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `feedback` (`FED_ID`, `EMAIL`, `COMMENT`) VALUES
(10, '[varshithvh@gmail.com](mailto:varshithvh@gmail.com)', 'hai I am satisfied with your service. But need to know whether is there any other options');

-- Payment table
CREATE TABLE `payment` (
`PAY_ID` int(11) NOT NULL AUTO_INCREMENT,
`BOOK_ID` int(11) NOT NULL,
`CARD_NO` varchar(255) NOT NULL,
`EXP_DATE` varchar(255) NOT NULL,
`CVV` int(11) NOT NULL,
`PRICE` int(11) NOT NULL,
PRIMARY KEY (`PAY_ID`),
UNIQUE KEY `BOOK_ID` (`BOOK_ID`),
CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`BOOK_ID`) REFERENCES `booking` (`BOOK_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `payment` (`PAY_ID`, `BOOK_ID`, `CARD_NO`, `EXP_DATE`, `CVV`, `PRICE`) VALUES
(24, 68, '4444444444444444', '11/22', 333, 50000),
(26, 72, '7894561237894561', '11/20', 456, 35000),
(27, 73, '7894561237418529', '11/25', 456, 25000),
(30, 76, '7414789562314587', '11/23', 789, 35000),
(31, 78, '7894561237418529', '09/27', 646, 30000),
(32, 79, '7894561230789462', '01/24', 496, 35000),
(33, 81, '7891456123789456', '11/26', 456, 25000),
(34, 82, '7894561237418529', '11/23', 456, 35000);

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS=1;
